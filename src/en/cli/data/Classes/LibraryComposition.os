#Use "./internal"

Var ModuleCommandMapping;
Var Version;
Var KэшandрoinанandеIndexoin;
Var AccessTemplate;
Var PackagesDirectory;


Procedure OnObjectCreate()

    Version = "1.26.0";
    InitializeCommonLists();

    CurrentDirectory = CurrentScript().Path;
    AccessTemplate  = CombinePath(CurrentDirectory, "internal", "Classes", "%1.os");

    PackagesDirectory = StrReplace(GetSystemOptionValue("lib.system"), "\", "/");

EndProcedure

Procedure InitializeCommonLists() Export

    KэшandрoinанandеIndexoin       = New Map();
    ModuleCommandMapping = New Map();
    ModuleCommandMapping.Insert("tools", "Utils");
    ModuleCommandMapping.Insert("airtable", "OPI_Airtable");
    ModuleCommandMapping.Insert("bitrix24", "OPI_Bitrix24");
    ModuleCommandMapping.Insert("cdek", "OPI_CDEK");
    ModuleCommandMapping.Insert("dropbox", "OPI_Dropbox");
    ModuleCommandMapping.Insert("gcalendar", "OPI_GoogleCalendar");
    ModuleCommandMapping.Insert("gdrive", "OPI_GoogleDrive");
    ModuleCommandMapping.Insert("gsheets", "OPI_GoogleSheets");
    ModuleCommandMapping.Insert("google", "OPI_GoogleWorkspace");
    ModuleCommandMapping.Insert("greenapi", "OPI_GreenAPI");
    ModuleCommandMapping.Insert("mssql", "OPI_MSSQL");
    ModuleCommandMapping.Insert("mysql", "OPI_MySQL");
    ModuleCommandMapping.Insert("neocities", "OPI_Neocities");
    ModuleCommandMapping.Insert("notion", "OPI_Notion");
    ModuleCommandMapping.Insert("ollama", "OPI_Ollama");
    ModuleCommandMapping.Insert("openai", "OPI_OpenAI");
    ModuleCommandMapping.Insert("ozon", "OPI_Ozon");
    ModuleCommandMapping.Insert("postgres", "OPI_PostgreSQL");
    ModuleCommandMapping.Insert("rcon", "OPI_RCON");
    ModuleCommandMapping.Insert("s3", "OPI_S3");
    ModuleCommandMapping.Insert("slack", "OPI_Slack");
    ModuleCommandMapping.Insert("sqlite", "OPI_SQLite");
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


Function GetDataIndexа(Val Command) Export

    InformationIndexа = KэшandрoinанandеIndexoin.Get(Command);

    If InformationIndexа = Undefined Then

        Try
            CompositionObject = LoadScript(StrTemplate(AccessTemplate, Command));

            Сowithтаin            = CompositionObject.GetComposition();
            ConnectionString = CompositionObject.GetConnectionString();

            InformationIndexа = New Structure;
            InformationIndexа.Insert("Сowithтаin"           , Сowithтаin);
            InformationIndexа.Insert("ConnectionString", ConnectionString);

            KэшandрoinанandеIndexoin.Insert(Command, InformationIndexа);

        Except
            Raise StrTemplate("Invalid command name: %1", Command)
        EndTry;

    EndIf;

    Return InformationIndexа;

EndFunction

Function GetFullComposition() Export

    CommonTable = Undefined;

    For Each Command In ModuleCommandMapping Do

        ObjectIndexа  = GetDataIndexа(Command.Key);
        CurrentTable = ObjectIndexа["Сowithтаin"];
        
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

Function FormMethodCallString(Val PassedParameters, Val Command, Val Method) Export

    Module        = GetCommandModuleMapping().Get(Command);
    ObjectIndexа = GetDataIndexа(Command);
    
    If Not ValueIsFilled(Module) Then
        Return New Structure("Error,Result", True, "Command");
    EndIf;
    
    CommandSelection    = New Structure("SearchMethod", Upper(Method));
    MethodParameters = ObjectIndexа["Сowithтаin"].FindRows(CommandSelection);
    ExecutionText = StrTemplate(ObjectIndexа["ConnectionString"], PackagesDirectory);
    
    If Not ValueIsFilled(MethodParameters) Then
        Return New Structure("Error,Result", True, "Method");
    EndIf;

    CallString    = Module + "." + Method + "(";
    Counter         = 0;

    For Each RequiredParameter In MethodParameters Do

        ParameterName      = RequiredParameter.Parameter;
        ParameterValue = PassedParameters.Get(ParameterName);

        If RequiresProcessingOfEscapeSequences(ParameterName, ParameterValue) Then
            ReplaceEscapeSequences(ParameterValue);
        EndIf;

        If ValueIsFilled(ParameterValue) Then

            ParameterName = "Parameter" + StrReplace(ParameterName, "--", "_");

            ExecutionText = ExecutionText 
                + Chars.LF 
                + ParameterName
                + " = """ 
                + StrReplace(ParameterValue, """", """""")
                + """;";

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

   InformationIndexа = New Structure;
   InformationIndexа.Insert("Сowithтаin"           , ParametersTable);
   InformationIndexа.Insert("ConnectionString", ConnectionString);

   KэшandрoinанandеIndexoin.Insert(Command, InformationIndexа);
   ModuleCommandMapping.Insert(Command, Library);

EndProcedure

Function RequiresProcessingOfEscapeSequences(Val ParameterName, Val ParameterValue)

    ParamFile         = New File(ParameterValue);
    ParamValueTrim = TrimAll(ParameterValue);

    Return Not StrStartsWith(ParamValueTrim, "{")
                And Not StrStartsWith(ParamValueTrim, "[") 
                And Not ParamFile.Exist() 
                And Not ParameterName = "Parameter_out";

EndFunction

Procedure ReplaceEscapeSequences(Text) Export

    Text = String(Text);

    CharacterMapping = GetEscapeSequencesMap();

    For Each Symbol In CharacterMapping Do

        Text = StrReplace(Text, Symbol.Key          , Symbol.Value);
        Text = StrReplace(Text, "\" + Symbol.Value, Symbol.Key);

    EndDo;

EndProcedure

Function GetEscapeSequencesMap()

    CharacterMapping = New Map;

    CharacterMapping.Insert("\n", Chars.LF);
    CharacterMapping.Insert("\r", Chars.VK);
    CharacterMapping.Insert("\f", Chars.FF);
    CharacterMapping.Insert("\v", Chars.VTab);

    Return CharacterMapping;

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
	Return GetDataIndexа(Команда);
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

Procedure ЗаменитьУправляющиеПоследовательности(Текст) Export
	ReplaceEscapeSequences(Текст);
EndProcedure

#EndRegion