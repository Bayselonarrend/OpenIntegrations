Var ModuleCommandMapping;
Var Version;
Var IndexCache;
Var CurrentDirectory;
Var PackagesDirectory;


Procedure OnObjectCreate()
    
    CurrentDirectory = CurrentScript().Path;
    InitializeCommonLists();  
    
EndProcedure

Procedure InitializeCommonLists() Export
    
    DataFile = CombinePath(CurrentDirectory, "index", "lib.json");  
    Data = ReadJSONFile(DataFile);
    
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

            IndexPath = CombinePath(CurrentDirectory, "index", Command + ".json");
            ModuleData = ReadJSONFile(IndexPath);        
            
            IndexCache.Insert(Command, ModuleData);
            
        Except
            Raise StrTemplate("Invalid command name: %1", Command)
        EndTry;
        
    EndIf;
    
    Return ModuleData;
    
EndFunction

Function GetFullComposition() Export
    
    For Each Command In ModuleCommandMapping Do
        GetIndexData(Command.Key);
    EndDo;
    
    Return IndexCache;
    
EndFunction

Function FormMethodCallString(Val PassedParameters, Val Command, Val Method) Export
    
    If PackagesDirectory = Undefined Then
        DefinePackagesDirectory();
    EndIf;
    
    Module = ModuleCommandMapping.Get(Command);
    IndexObject = GetIndexData(Command);
    MethodParameters = Undefined;
    
    If Not ValueIsFilled(Module) Then
        Return New Structure("Error,Result", True, "Command");
    EndIf;
    
    For Each Method In IndexObject["methods"] Do
        If Method["id"] = Upper(Method) Then
            MethodParameters = Method["params"];
            Break;
        EndIf;
    EndDo;

    If MethodParameters = Undefined Then
        Return New Structure("Error,Result", True, "Method");
    EndIf;
    
    ExecutionText = "";
    CallString = Module + "." + Method + "(";
    Counter = 0;
    
    For Each RequiredParameter In MethodParameters Do
        
        ParameterName = RequiredParameter["name"];
        ParameterNameTrim = RequiredParameter["short"];
        
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

Function ReadJSONFile(Val Path)
    
    JSONReader = New JSONReader();
    JSONReader.OpenFile(Path);
    Data = ReadJSON(JSONReader, True);
    JSONReader.Close();

    Return Data;

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

Function СформироватьСтрокуВызоваМетода(Val ПереданныеПараметры, Val Команда, Val Метод) Export
	Return FormMethodCallString(ПереданныеПараметры, Команда, Метод);
EndFunction

Procedure ДополнитьКэшСостава(Val Библиотека, Val ТаблицаПараметров, Команда = "") Export
	CompleteCompositionCache(Библиотека, ТаблицаПараметров, Команда);
EndProcedure

Procedure УстановитьКаталогПакетов(Val Путь) Export
	SetPackagesDirectory(Путь);
EndProcedure

#EndRegion