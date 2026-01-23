Var ModuleCommandMapping;
Var Version;
Var IndexCache;
Var AccessTemplate;
Var PackagesDirectory;


Procedure OnObjectCreate()
    
    InitializeCommonLists();
    
    CurrentDirectory = CurrentScript().Path;
    AccessTemplate = CombinePath(CurrentDirectory, "internal", "Classes", "%1.os");
    
EndProcedure

Procedure InitializeCommonLists() Export
    
    CurrentDirectory = CurrentScript().Path;
    DataFile = CombinePath(CurrentDirectory, "index", "lib.json");
    
    JSONReader = New JSONReader();
    JSONReader.OpenFile(DataFile);
    Data = ReadJSON(JSONReader, True);
    JSONReader.Close();

    IndexCache = New Map();
    ModuleCommandMapping = Data["modules"];
    Version = Data["version"];
    
EndProcedure

Function GetVersion() Export
    Return Version;
EndFunction

Function GetCommandModuleMapping() Export
    Return ModuleCommandMapping;
EndFunction

Function GetIndexData(Val Command) Export
    
    IndexInformation = IndexCache.Get(Command);
    
    If IndexInformation = Undefined Then
        
        Try
            CompositionObject = LoadScript(StrTemplate(AccessTemplate, Command));
            
            Composition = CompositionObject.GetComposition();
            ConnectionString = CompositionObject.GetConnectionString();
            
            IndexInformation = New Structure;
            IndexInformation.Insert("Composition" , Composition);
            IndexInformation.Insert("ConnectionString", ConnectionString);
            
            IndexCache.Insert(Command, IndexInformation);
            
        Except
            Raise StrTemplate("Invalid command name: %1", Command)
        EndTry;
        
    EndIf;
    
    Return IndexInformation;
    
EndFunction

Function GetFullComposition() Export
    
    CommonTable = Undefined;
    
    For Each Command In ModuleCommandMapping Do
        
        IndexObject = GetIndexData(Command.Key);
        CurrentTable = IndexObject["Composition"];
        
        If CommonTable = Undefined Then
            CommonTable = CurrentTable;
        Else
            For Each TableRow In CurrentTable Do
                FillPropertyValues(CommonTable.Add(), TableRow);
            EndDo;
        EndIf;
        
    EndDo;
    
    Return CommonTable;
    
EndFunction


Function FormMethodCallString(Val PassedParameters, Val Command, Val Method, Val Dynamically = True) Export
    
    If PackagesDirectory = Undefined Then
        DefinePackagesDirectory();
    EndIf;
    
    Module = GetCommandModuleMapping().Get(Command);
    IndexObject = GetIndexData(Command);
    
    If Not ValueIsFilled(Module) Then
        Return New Structure("Error,Result", True, "Command");
    EndIf;
    
    CommandSelection = New Structure("SearchMethod", Upper(Method));
    MethodParameters = IndexObject["Composition"].FindRows(CommandSelection);
    
    If Dynamically Then
        ExecutionText = StrTemplate(IndexObject["ConnectionString"], PackagesDirectory);
    Else
        ExecutionText = "";
    EndIf;
    
    If Not ValueIsFilled(MethodParameters) Then
        Return New Structure("Error,Result", True, "Method");
    EndIf;
    
    CallString = Module + "." + Method + "(";
    Counter = 0;
    
    For Each RequiredParameter In MethodParameters Do
        
        ParameterName = RequiredParameter.Parameter;
        ParameterNameTrim = RequiredParameter.ParameterTrim;
        
        ParameterValue = PassedParameters.Get(ParameterName);
        ParameterValue = ?(ParameterValue = Undefined
        , PassedParameters.Get(ParameterNameTrim)
        , ParameterValue);
        
        If ValueIsFilled(ParameterValue) Then
            
            ParameterName = "Parameter" + StrReplace(ParameterName, "--", "_");
            
            ExecutionText = ExecutionText 
            + Chars.LF 
            + ParameterName
            + " = """ 
            + StrReplace(ParameterValue, """", """""")
            + """;";
            
            If RequiresProcessingOfEscapeSequences(ParameterName, ParameterValue) Then
                ExecutionText = ExecutionText 
                + Chars.LF 
                + "OPI_Tools.ReplaceEscapeSequences(" + ParameterName + ");";
            EndIf;
            
            CallString = CallString + ParameterName + ", ";
            Counter = Counter + 1;
            
        Else
            CallString = CallString + " , ";
        EndIf;
        
    EndDo;
    
    ExtraCharacters = 2;
    CallString = Left(CallString, StrLen(CallString) - ExtraCharacters);
    CallString = CallString + ");";
    CallString = "Response = " + CallString;
    ExecutionText = ExecutionText + Chars.LF + CallString;
    
    ReturnStructure = New Structure("Error,Result", False, ExecutionText);
    
    Return ReturnStructure;
    
EndFunction

Procedure CompleteCompositionCache(Val Library, Val ParametersTable, Command = "") Export
    
    Command = ?(ValueIsFilled(Command), Command, Library);
    ConnectionString = "";
    
    IndexInformation = New Structure;
    IndexInformation.Insert("Composition" , ParametersTable);
    IndexInformation.Insert("ConnectionString", ConnectionString);
    
    IndexCache.Insert(Command, IndexInformation);
    ModuleCommandMapping.Insert(Command, Library);
    
EndProcedure

Procedure SetPackagesDirectory(Val Path) Export
    PackagesDirectory = Path;
EndProcedure

Procedure DefinePackagesDirectory()
    
    CurrentDirectory = CurrentScript().Path;
    CurrentDirectory = StrReplace(CurrentDirectory, "\", "/");
    
    PathParts = StrSplit(CurrentDirectory, "/");
    PathParts.Delete(PathParts.UBound());
    PathParts.Delete(PathParts.UBound());
    PathParts.Delete(PathParts.UBound());
    
    PackagesDirectory = StrConcat(PathParts, "/");
    
EndProcedure

Function RequiresProcessingOfEscapeSequences(Val ParameterName, Val ParameterValue)
    
    ParamFile = New File(ParameterValue);
    ParamValueTrim = TrimAll(ParameterValue);
    
    Return Not StrStartsWith(ParamValueTrim, "{")
    And Not StrStartsWith(ParamValueTrim, "[") 
    And Not ParamFile.Exists() 
    And Not ParameterName = "Parameter_out";
    
EndFunction
#Region Alternate

Procedure ИнициализироватьОсновныеСписки() Export
	InitializeCommonLists();
EndProcedure

Function ПолучитьВерсию() Export
	Return GetVersion();
EndFunction

Function ПолучитьСоответствиеКомандМодулей() Export
	Return GetCommandModuleMapping();
EndFunction

Function ПолучитьИнформациюИндекса(Val Команда) Export
	Return GetIndexData(Команда);
EndFunction

Function ПолучитьПолныйСостав() Export
	Return GetFullComposition();
EndFunction

Function СформироватьСтрокуВызоваМетода(Val ПереданныеПараметры, Val Команда, Val Метод, Val Динамически = True) Export
	Return FormMethodCallString(ПереданныеПараметры, Команда, Метод, Динамически);
EndFunction

Procedure ДополнитьКэшСостава(Val Библиотека, Val ТаблицаПараметров, Команда = "") Export
	CompleteCompositionCache(Библиотека, ТаблицаПараметров, Команда);
EndProcedure

Procedure УстановитьКаталогПакетов(Val Путь) Export
	SetPackagesDirectory(Путь);
EndProcedure

#EndRegion