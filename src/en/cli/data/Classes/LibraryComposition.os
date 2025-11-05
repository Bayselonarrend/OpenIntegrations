#Use "./internal"

Var ModuleCommandMapping;
Var Version;
Var IndexCache;
Var AccessTemplate;
Var PackagesDirectory;


Procedure OnObjectCreate()

    Version = "1.30.0";
    InitializeCommonLists();

    CurrentDirectory = CurrentScript().Path;
    AccessTemplate  = CombinePath(CurrentDirectory, "internal", "Classes", "%1.os");

    PackagesDirectory = StrReplace(GetSystemOptionValue("lib.system"), "\", "/");

EndProcedure

Procedure InitializeCommonLists() Export

    IndexCache       = New Map();
    ModuleCommandMapping = New Map();
    ModuleCommandMapping.Insert("tools", "Utils");
    ModuleCommandMapping.Insert("airtable", "OPI_Airtable");
    ModuleCommandMapping.Insert("bitrix24", "OPI_Bitrix24");
    ModuleCommandMapping.Insert("cdek", "OPI_CDEK");
    ModuleCommandMapping.Insert("dropbox", "OPI_Dropbox");
    ModuleCommandMapping.Insert("ftp", "OPI_FTP");
    ModuleCommandMapping.Insert("gcalendar", "OPI_GoogleCalendar");
    ModuleCommandMapping.Insert("gdrive", "OPI_GoogleDrive");
    ModuleCommandMapping.Insert("gsheets", "OPI_GoogleSheets");
    ModuleCommandMapping.Insert("google", "OPI_GoogleWorkspace");
    ModuleCommandMapping.Insert("greenapi", "OPI_GreenAPI");
    ModuleCommandMapping.Insert("greenmax", "OPI_GreenMax");
    ModuleCommandMapping.Insert("mongodb", "OPI_MongoDB");
    ModuleCommandMapping.Insert("mssql", "OPI_MSSQL");
    ModuleCommandMapping.Insert("mysql", "OPI_MySQL");
    ModuleCommandMapping.Insert("neocities", "OPI_Neocities");
    ModuleCommandMapping.Insert("notion", "OPI_Notion");
    ModuleCommandMapping.Insert("ollama", "OPI_Ollama");
    ModuleCommandMapping.Insert("openai", "OPI_OpenAI");
    ModuleCommandMapping.Insert("postgres", "OPI_PostgreSQL");
    ModuleCommandMapping.Insert("rcon", "OPI_RCON");
    ModuleCommandMapping.Insert("rportal", "OPI_ReportPortal");
    ModuleCommandMapping.Insert("s3", "OPI_S3");
    ModuleCommandMapping.Insert("sftp", "OPI_SFTP");
    ModuleCommandMapping.Insert("slack", "OPI_Slack");
    ModuleCommandMapping.Insert("sqlite", "OPI_SQLite");
    ModuleCommandMapping.Insert("ssh", "OPI_SSH");
    ModuleCommandMapping.Insert("tcp", "OPI_TCP");
    ModuleCommandMapping.Insert("telegram", "OPI_Telegram");
    ModuleCommandMapping.Insert("twitter", "OPI_Twitter");
    ModuleCommandMapping.Insert("viber", "OPI_Viber");
    ModuleCommandMapping.Insert("vk", "OPI_VK");
    ModuleCommandMapping.Insert("vkteams", "OPI_VKTeams");
    ModuleCommandMapping.Insert("yadisk", "OPI_YandexDisk");
    ModuleCommandMapping.Insert("yandex", "OPI_YandexID");
    ModuleCommandMapping.Insert("yamarket", "OPI_YandexMarket");
    ModuleCommandMapping.Insert("metrika", "OPI_YandexMetrika");

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

            Composition            = CompositionObject.GetComposition();
            ConnectionString = CompositionObject.GetConnectionString();

            IndexInformation = New Structure;
            IndexInformation.Insert("Composition"           , Composition);
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

        IndexObject  = GetIndexData(Command.Key);
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

    Module             = GetCommandModuleMapping().Get(Command);
    IndexObject      = GetIndexData(Command);
    
    If Not ValueIsFilled(Module) Then
        Return New Structure("Error,Result", True, "Command");
    EndIf;
    
    CommandSelection    = New Structure("SearchMethod", Upper(Method));
    MethodParameters = IndexObject["Composition"].FindRows(CommandSelection);
    
    If Dynamically Then
       ExecutionText = StrTemplate(IndexObject["ConnectionString"], PackagesDirectory);
    Else
       ExecutionText = "";
    EndIf;
    
    If Not ValueIsFilled(MethodParameters) Then
        Return New Structure("Error,Result", True, "Method");
    EndIf;

    CallString    = Module + "." + Method + "(";
    Counter         = 0;

    For Each RequiredParameter In MethodParameters Do

       ParameterName      = RequiredParameter.Parameter;
       ParameterNameTrim  = RequiredParameter.ParameterTrim;

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
            Counter      = Counter + 1;

        Else
            CallString = CallString + " , ";
        EndIf;

    EndDo;

    ExtraCharacters   = 2;
    CallString    = Left(CallString, StrLen(CallString) - ExtraCharacters);
    CallString    = CallString + ");";
    CallString    = "Response = " + CallString;
    ExecutionText = ExecutionText + Chars.LF + CallString;

    ReturnStructure = New Structure("Error,Result", False, ExecutionText);

    Return ReturnStructure;

EndFunction

Procedure CompleteCompositionCache(Val Library, Val ParametersTable, Command = "") Export

   Command           = ?(ValueIsFilled(Command), Command, Library);
   ConnectionString = "";

   IndexInformation = New Structure;
   IndexInformation.Insert("Composition"           , ParametersTable);
   IndexInformation.Insert("ConnectionString", ConnectionString);

   IndexCache.Insert(Command, IndexInformation);
   ModuleCommandMapping.Insert(Command, Library);

EndProcedure

Function RequiresProcessingOfEscapeSequences(Val ParameterName, Val ParameterValue)

    ParamFile         = New File(ParameterValue);
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

#EndRegion