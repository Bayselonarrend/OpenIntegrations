﻿Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "FormAccessParameters";
    NewLine.МетодПоиска = "FORMACCESSPARAMETERS";
    NewLine.Параметр    = "--api";
    NewLine.Описание    = "API host link";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Forms the structure of basic authorization data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "FormAccessParameters";
    NewLine.МетодПоиска = "FORMACCESSPARAMETERS";
    NewLine.Параметр    = "--media";
    NewLine.Описание    = "Link to host API for sending files";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "FormAccessParameters";
    NewLine.МетодПоиска = "FORMACCESSPARAMETERS";
    NewLine.Параметр    = "--id";
    NewLine.Описание    = "Unique instance number";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "FormAccessParameters";
    NewLine.МетодПоиска = "FORMACCESSPARAMETERS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Instance access key";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetAccountInformation";
    NewLine.МетодПоиска = "GETACCOUNTINFORMATION";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Gets account information";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetInstanceSettings";
    NewLine.МетодПоиска = "GETINSTANCESETTINGS";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Gets the current instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetInstanceSettings";
    NewLine.МетодПоиска = "SETINSTANCESETTINGS";
    NewLine.Параметр    = "--settings";
    NewLine.Описание    = "Instance settings. See GetInstanceSettingsStructure";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Sets the instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetInstanceSettings";
    NewLine.МетодПоиска = "SETINSTANCESETTINGS";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetInstanceStatus";
    NewLine.МетодПоиска = "GETINSTANCESTATUS";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Gets instance status";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "RebootInstance";
    NewLine.МетодПоиска = "REBOOTINSTANCE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Restarts the instance";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "LogoutInstance";
    NewLine.МетодПоиска = "LOGOUTINSTANCE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Unlogging the instance";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetQR";
    NewLine.МетодПоиска = "GETQR";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Receives authorization QR code";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetAuthorizationCode";
    NewLine.МетодПоиска = "GETAUTHORIZATIONCODE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Receives the authorization code for phone number linking";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetAuthorizationCode";
    NewLine.МетодПоиска = "GETAUTHORIZATIONCODE";
    NewLine.Параметр    = "--phone";
    NewLine.Описание    = "Phone number in international format without + and 00";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetProfilePicture";
    NewLine.МетодПоиска = "SETPROFILEPICTURE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Sets a new profile picture";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetProfilePicture";
    NewLine.МетодПоиска = "SETPROFILEPICTURE";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Profile picture";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetInstanceSettingsStructure";
    NewLine.МетодПоиска = "GETINSTANCESETTINGSSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Gets the structure template for instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetGroupInformation";
    NewLine.МетодПоиска = "GETGROUPINFORMATION";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Gets group chat data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetGroupInformation";
    NewLine.МетодПоиска = "GETGROUPINFORMATION";
    NewLine.Параметр    = "--group";
    NewLine.Описание    = "Group chat identifier";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "CreateGroup";
    NewLine.МетодПоиска = "CREATEGROUP";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Creates a new group chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "CreateGroup";
    NewLine.МетодПоиска = "CREATEGROUP";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Name of the group chat";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "CreateGroup";
    NewLine.МетодПоиска = "CREATEGROUP";
    NewLine.Параметр    = "--members";
    NewLine.Описание    = "Chat members array (optional, def. val. - Empty value)";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "UpdateGroupName";
    NewLine.МетодПоиска = "UPDATEGROUPNAME";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Changes the name of an existing group";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "UpdateGroupName";
    NewLine.МетодПоиска = "UPDATEGROUPNAME";
    NewLine.Параметр    = "--group";
    NewLine.Описание    = "Group chat identifier";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "UpdateGroupName";
    NewLine.МетодПоиска = "UPDATEGROUPNAME";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "New group chat name";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "AddGroupMember";
    NewLine.МетодПоиска = "ADDGROUPMEMBER";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Adds a participant to a group chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "AddGroupMember";
    NewLine.МетодПоиска = "ADDGROUPMEMBER";
    NewLine.Параметр    = "--group";
    NewLine.Описание    = "Group chat identifier";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "AddGroupMember";
    NewLine.МетодПоиска = "ADDGROUPMEMBER";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID to add";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "ExcludeGroupMember";
    NewLine.МетодПоиска = "EXCLUDEGROUPMEMBER";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Excludes a member from the group";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "ExcludeGroupMember";
    NewLine.МетодПоиска = "EXCLUDEGROUPMEMBER";
    NewLine.Параметр    = "--group";
    NewLine.Описание    = "Group chat identifier";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "ExcludeGroupMember";
    NewLine.МетодПоиска = "EXCLUDEGROUPMEMBER";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID to add";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "LeaveGroup";
    NewLine.МетодПоиска = "LEAVEGROUP";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Logs the current account out of group chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "LeaveGroup";
    NewLine.МетодПоиска = "LEAVEGROUP";
    NewLine.Параметр    = "--group";
    NewLine.Описание    = "Group chat identifier";
    NewLine.Область     = "Group management";

    Return CompositionTable;
EndFunction

