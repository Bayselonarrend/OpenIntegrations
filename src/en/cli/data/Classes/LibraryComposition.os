#Use "./internal"

Var ModuleCommandMapping;
Var Version;
Var CompositionCache;


Procedure OnObjectCreate()

    Version = "1.23.0";
    CompositionCache       = New Map();
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
    ModuleCommandMapping.Insert("mysql", "OPI_MySQL");
    ModuleCommandMapping.Insert("neocities", "OPI_Neocities");
    ModuleCommandMapping.Insert("notion", "OPI_Notion");
    ModuleCommandMapping.Insert("ollama", "OPI_Ollama");
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


Function GetComposition(Val Command) Export

    CurrentComposition = CompositionCache.Get(Command);

    If CurrentComposition = Undefined Then
        CompositionObject = New(Command);
        CurrentComposition = CompositionObject.GetComposition();
        CompositionCache.Insert(Command, CurrentComposition);
    EndIf;

    Return CurrentComposition;

EndFunction

Function GetFullComposition() Export

    CommonTable = Undefined;

    For Each Command In ModuleCommandMapping Do

        CurrentTable = GetComposition(Command.Key);
        
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

    Module = GetCommandModuleMapping().Get(Command);
    
    If Not ValueIsFilled(Module) Then
        Return New Structure("Error,Result", True, "Command");
    EndIf;
    
    CommandSelection      = New Structure("SearchMethod", Upper(Method));
    MethodParameters   = GetComposition(Command).FindRows(CommandSelection);
    
    If Not ValueIsFilled(MethodParameters) Then
        Return New Structure("Error,Result", True, "Method");
    EndIf;

    ExecutionText = "";
    CallString    = Module + "." + Method + "(";
    Counter         = 0;

    For Each RequiredParameter In MethodParameters Do

        ParameterName      = RequiredParameter.Parameter;
        ParameterValue = PassedParameters.Get(ParameterName);

        If ValueIsFilled(ParameterValue) Then

            ParameterName = "Parameter" + StrReplace(ParameterName, "--", "_");

            ExecutionText = ExecutionText 
                + Chars.LF 
                + ParameterName
                + " = """ 
                + StrReplace(ParameterValue, """", """""")
                + """;";

            If RequiresProcessingOfEscapeSequences(ParameterName, ParameterValue) Then

                ExecutionText = ExecutionText + "
                | OPI_Tools.ReplaceEscapeSequences(" + ParameterName + ");
                |";

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

Function RequiresProcessingOfEscapeSequences(Val ParameterName, Val ParameterValue)

    ParamFile         = New File(ParameterValue);
    ParamValueTrim = TrimAll(ParameterValue);

    Return Not StrStartsWith(ParamValueTrim, "{")
                And Not StrStartsWith(ParamValueTrim, "[") 
                And Not ParamFile.Exist() 
                And Not ParameterName = "Parameter_out";

EndFunction
