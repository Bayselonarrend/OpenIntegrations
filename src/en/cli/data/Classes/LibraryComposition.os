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
            IndexInformation = ReadJSONFile(IndexPath);        
            
            IndexCache.Insert(Command, IndexInformation);
            
        Except
            Raise StrTemplate("Invalid command name: %1", Command)
        EndTry;
        
    EndIf;
    
    Return IndexInformation;
    
EndFunction

Function GetMethodData(Val Command, Val Method) Export
    
    MethodInfo = Undefined;
    CurrentIndex = GetIndexData(Command);
    SearchMethod = Upper(Method);
    
    For Each IndexMethod In CurrentIndex["methods"] Do
        If IndexMethod["id"] = SearchMethod Then
            MethodInfo = IndexMethod;
            Break;
        EndIf;
    EndDo;
    
    Return MethodInfo;
    
EndFunction

Function GetFullComposition() Export
    
    For Each Command In ModuleCommandMapping Do
        GetIndexData(Command.Key);
    EndDo;
    
    Return IndexCache;
    
EndFunction

Function FormMethodCallString(Val PassedParameters, Val Command, Val Method, Val Dynamically = True) Export
    
    If PackagesDirectory = Undefined Then
        DefinePackagesDirectory();
    EndIf;
    
    Module = ModuleCommandMapping.Get(Command);
    
    If Not ValueIsFilled(Module) Then
        Return New Structure("Error,Result", True, "Command");
    EndIf;
    
    CommandData = GetIndexData(Command);
    MethodData = GetMethodData(Command, Method);
    
    If MethodData = Undefined Then
        Return New Structure("Error,Result", True, "Method");
    EndIf;
    
    StingsArray = New Array;
    CallArray = New Array;
    ExecutionText = "";
    
    MethodParameters = MethodData["params"];
    VariableTemplate = "%1 = ""%2"";";
    TemplateES = "OPI_Tools.ReplaceEscapeSequences(%1);";
    
    If Dynamically Then
        InitializationString = FormModuleInitializationString(CommandData, Module);
        StingsArray.Add(InitializationString);
    EndIf;
      
    For Each RequiredParameter In MethodParameters Do
        
        ParameterName = RequiredParameter["name"];

        ParameterNameTrim = RequiredParameter["short"];
        ParameterValue = PassedParameters.Get(ParameterName);
        ParameterValue = ?(ParameterValue = Undefined
            , PassedParameters.Get(ParameterNameTrim)
            , ParameterValue);
        
        If ValueIsFilled(ParameterValue) Then
            
            ParameterName = StrTemplate("Parameter%1", StrReplace(ParameterName, "--", "_"));
            CoveredValue = StrReplace(ParameterValue, """", """""");
            
            StingsArray.Add(StrTemplate(VariableTemplate, ParameterName, CoveredValue));
            
            If RequiresProcessingOfEscapeSequences(ParameterName, ParameterValue) Then
                StingsArray.Add(StrTemplate(TemplateES, ParameterName));
            EndIf;
            
            CallArray.Add(ParameterName);
            
        Else
            CallArray.Add("");
        EndIf;
        
    EndDo;
    
    CallString = StrTemplate("Response = %1.%2(%3)", Module, Method, StrConcat(CallArray, ","));
    StingsArray.Add(CallString);
    
    ExecutionText = StrConcat(StingsArray, Chars.LF);
    
    ReturnStructure = New Structure("Error,Result", False, ExecutionText);
    
    Return ReturnStructure;
    
EndFunction

Procedure CompleteCompositionCache(Val Library, Val ParametersTable, Command = "") Export
    
    Command = ?(ValueIsFilled(Command), Command, Library);
    
    IndexCache.Insert(Command, ParametersTable);
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

Function FormModuleInitializationString(Val CommandData, Val Module)
    
    LoadingTemplate = StrTemplate("%%1 = LoadScript(""%1/oint/core/Modules/%%1.os"", Context);", PackagesDirectory);
    ContextTemplate = "Context.Insert(""%1"", %2);";
    CallArray = New Array;

    CallArray.Add("Context = New Structure;");

    Dependencies = CommandData["dependencies"];

    If Dependencies <> Undefined Then

        For Each Dependence In Dependencies Do

            CallArray.Add(StrTemplate(LoadingTemplate, Dependence));
            CallArray.Add(StrTemplate(ContextTemplate, Dependence, Dependence));

        EndDo;

    EndIf;
    
    CallArray.Add(StrTemplate(ContextTemplate, Module, "Undefined"));
    CallArray.Add(StrTemplate(LoadingTemplate , Module));
    
    If CommandData["self_depend"] Then
        
        CallArray.Add(StrTemplate(ContextTemplate, Module, Module));
        CallArray.Add(StrTemplate(LoadingTemplate , Module));
        
    EndIf;
    
    ExecutionText = StrConcat(CallArray, Chars.LF);

    Return ExecutionText;
    
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

Function ПолучитьИнформациюОМетоде(Val Команда, Val Метод) Export
    Return GetMethodData(Команда, Метод);
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