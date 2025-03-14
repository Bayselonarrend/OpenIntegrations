Function ПолучитьСостав() Export

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
    NewLine.Метод       = "SetAdminRights";
    NewLine.МетодПоиска = "SETADMINRIGHTS";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Assigns the user as the group administrator";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetAdminRights";
    NewLine.МетодПоиска = "SETADMINRIGHTS";
    NewLine.Параметр    = "--group";
    NewLine.Описание    = "Group chat identifier";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetAdminRights";
    NewLine.МетодПоиска = "SETADMINRIGHTS";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID to add";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "RevokeAdminRights";
    NewLine.МетодПоиска = "REVOKEADMINRIGHTS";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Revokes administrator rights from the user";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "RevokeAdminRights";
    NewLine.МетодПоиска = "REVOKEADMINRIGHTS";
    NewLine.Параметр    = "--group";
    NewLine.Описание    = "Group chat identifier";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "RevokeAdminRights";
    NewLine.МетодПоиска = "REVOKEADMINRIGHTS";
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


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetGroupPicture";
    NewLine.МетодПоиска = "SETGROUPPICTURE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Group management";
    NewLine.ОписаниеМетода   = "Sets the group chat picture";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetGroupPicture";
    NewLine.МетодПоиска = "SETGROUPPICTURE";
    NewLine.Параметр    = "--group";
    NewLine.Описание    = "Group chat identifier";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetGroupPicture";
    NewLine.МетодПоиска = "SETGROUPPICTURE";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Profile picture";
    NewLine.Область     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a text message to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--quoted";
    NewLine.Описание    = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends the file to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File data or filepath";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--filename";
    NewLine.Описание    = "Name of the file with the extension";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--caption";
    NewLine.Описание    = "Message text below the file (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--quoted";
    NewLine.Описание    = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFileByURL";
    NewLine.МетодПоиска = "SENDFILEBYURL";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a file from web to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFileByURL";
    NewLine.МетодПоиска = "SENDFILEBYURL";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFileByURL";
    NewLine.МетодПоиска = "SENDFILEBYURL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "File URL";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFileByURL";
    NewLine.МетодПоиска = "SENDFILEBYURL";
    NewLine.Параметр    = "--filename";
    NewLine.Описание    = "Name of the file with the extension";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFileByURL";
    NewLine.МетодПоиска = "SENDFILEBYURL";
    NewLine.Параметр    = "--caption";
    NewLine.Описание    = "Message text below the file (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendFileByURL";
    NewLine.МетодПоиска = "SENDFILEBYURL";
    NewLine.Параметр    = "--quoted";
    NewLine.Описание    = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a poll with answer choices to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Answer options";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--multi";
    NewLine.Описание    = "Allows to select more than one answer choice (optional, def. val. - No)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--quoted";
    NewLine.Описание    = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends location data to the specified chat room";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--loc";
    NewLine.Описание    = "Location description. See GetLocationDescription";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--quoted";
    NewLine.Описание    = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a contact with a phone number to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--contact";
    NewLine.Описание    = "Contact description. See GetContactDescription";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--quoted";
    NewLine.Описание    = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "ForwardMessages";
    NewLine.МетодПоиска = "FORWARDMESSAGES";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends messages from one chat room to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "ForwardMessages";
    NewLine.МетодПоиска = "FORWARDMESSAGES";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "Message source chat ID";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "ForwardMessages";
    NewLine.МетодПоиска = "FORWARDMESSAGES";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "Message receiver chat ID";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "ForwardMessages";
    NewLine.МетодПоиска = "FORWARDMESSAGES";
    NewLine.Параметр    = "--msgs";
    NewLine.Описание    = "Messages or a single message to be sent";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetContactDescription";
    NewLine.МетодПоиска = "GETCONTACTDESCRIPTION";
    NewLine.Параметр    = "--phone";
    NewLine.Описание    = "Phone number in international format without a plus sign";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Gets the contact description for the SendContact function";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetContactDescription";
    NewLine.МетодПоиска = "GETCONTACTDESCRIPTION";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Contact name (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetContactDescription";
    NewLine.МетодПоиска = "GETCONTACTDESCRIPTION";
    NewLine.Параметр    = "--surname";
    NewLine.Описание    = "Contact last name (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetContactDescription";
    NewLine.МетодПоиска = "GETCONTACTDESCRIPTION";
    NewLine.Параметр    = "--midname";
    NewLine.Описание    = "Contacts patronymic or middle name (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetContactDescription";
    NewLine.МетодПоиска = "GETCONTACTDESCRIPTION";
    NewLine.Параметр    = "--company";
    NewLine.Описание    = "Name of the contact company (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetLocationDescription";
    NewLine.МетодПоиска = "GETLOCATIONDESCRIPTION";
    NewLine.Параметр    = "--lat";
    NewLine.Описание    = "Geographic latitude";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Gets the description of the location to send with SendLocation method";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetLocationDescription";
    NewLine.МетодПоиска = "GETLOCATIONDESCRIPTION";
    NewLine.Параметр    = "--long";
    NewLine.Описание    = "Geographic longitude";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetLocationDescription";
    NewLine.МетодПоиска = "GETLOCATIONDESCRIPTION";
    NewLine.Параметр    = "--addr";
    NewLine.Описание    = "Location address (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetLocationDescription";
    NewLine.МетодПоиска = "GETLOCATIONDESCRIPTION";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Location name (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetNotification";
    NewLine.МетодПоиска = "GETNOTIFICATION";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Notifications receiving";
    NewLine.ОписаниеМетода   = "Receives one notification from the queue";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetNotification";
    NewLine.МетодПоиска = "GETNOTIFICATION";
    NewLine.Параметр    = "--timeout";
    NewLine.Описание    = "Timeout for waiting for new messages when the queue is empty (optional, def. val. - 5)";
    NewLine.Область     = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "DeleteNotificationFromQueue";
    NewLine.МетодПоиска = "DELETENOTIFICATIONFROMQUEUE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Notifications receiving";
    NewLine.ОписаниеМетода   = "Deletes the notification from the queue after successful receipt";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "DeleteNotificationFromQueue";
    NewLine.МетодПоиска = "DELETENOTIFICATIONFROMQUEUE";
    NewLine.Параметр    = "--receipt";
    NewLine.Описание    = "Receipt identifier from the GetNotification method";
    NewLine.Область     = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "DownloadMessageFile";
    NewLine.МетодПоиска = "DOWNLOADMESSAGEFILE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Notifications receiving";
    NewLine.ОписаниеМетода   = "Gets a link to download a file from an incoming message";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "DownloadMessageFile";
    NewLine.МетодПоиска = "DOWNLOADMESSAGEFILE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "DownloadMessageFile";
    NewLine.МетодПоиска = "DOWNLOADMESSAGEFILE";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "Identifier of the message with the file";
    NewLine.Область     = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetReadMark";
    NewLine.МетодПоиска = "SETREADMARK";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Notifications receiving";
    NewLine.ОписаниеМетода   = "Sets the Read mark for a message or all chat messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetReadMark";
    NewLine.МетодПоиска = "SETREADMARK";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetReadMark";
    NewLine.МетодПоиска = "SETREADMARK";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "Message ID. All messages, if not filled in (optional, def. val. - Empty value)";
    NewLine.Область     = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetMessageQueue";
    NewLine.МетодПоиска = "GETMESSAGEQUEUE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message queue";
    NewLine.ОписаниеМетода   = "Gets the list of messages in the queue to be sent";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "ClearMessageQueue";
    NewLine.МетодПоиска = "CLEARMESSAGEQUEUE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message queue";
    NewLine.ОписаниеМетода   = "Clears the queue of messages to be sent";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetChatHistory";
    NewLine.МетодПоиска = "GETCHATHISTORY";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message logs";
    NewLine.ОписаниеМетода   = "Retrieves the chat message history";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetChatHistory";
    NewLine.МетодПоиска = "GETCHATHISTORY";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Message logs";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetChatHistory";
    NewLine.МетодПоиска = "GETCHATHISTORY";
    NewLine.Параметр    = "--count";
    NewLine.Описание    = "Number of messages to receive (optional, def. val. - 100)";
    NewLine.Область     = "Message logs";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetMessage";
    NewLine.МетодПоиска = "GETMESSAGE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Message logs";
    NewLine.ОписаниеМетода   = "Gets information about the chat message by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetMessage";
    NewLine.МетодПоиска = "GETMESSAGE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat identifier";
    NewLine.Область     = "Message logs";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetMessage";
    NewLine.МетодПоиска = "GETMESSAGE";
    NewLine.Параметр    = "--msg";
    NewLine.Описание    = "Message identifier";
    NewLine.Область     = "Message logs";

    Return CompositionTable;
EndFunction

