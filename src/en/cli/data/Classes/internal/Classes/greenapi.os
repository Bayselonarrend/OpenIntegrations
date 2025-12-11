
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("ParameterTrim");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "FormAccessParameters";
    NewLine.SearchMethod  = "FORMACCESSPARAMETERS";
    NewLine.Parameter     = "--api";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "API host link";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Forms the structure of basic authorization data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "FormAccessParameters";
    NewLine.SearchMethod  = "FORMACCESSPARAMETERS";
    NewLine.Parameter     = "--media";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Link to host API for sending files";
    NewLine.Region      = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "FormAccessParameters";
    NewLine.SearchMethod  = "FORMACCESSPARAMETERS";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Unique instance number";
    NewLine.Region      = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "FormAccessParameters";
    NewLine.SearchMethod  = "FORMACCESSPARAMETERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Instance access key";
    NewLine.Region      = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetAccountInformation";
    NewLine.SearchMethod  = "GETACCOUNTINFORMATION";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Gets account information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetInstanceSettings";
    NewLine.SearchMethod  = "GETINSTANCESETTINGS";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Gets the current instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetInstanceSettings";
    NewLine.SearchMethod  = "SETINSTANCESETTINGS";
    NewLine.Parameter     = "--settings";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Instance settings. See GetInstanceSettingsStructure";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Sets the instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetInstanceSettings";
    NewLine.SearchMethod  = "SETINSTANCESETTINGS";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetInstanceStatus";
    NewLine.SearchMethod  = "GETINSTANCESTATUS";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Gets instance status";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "RebootInstance";
    NewLine.SearchMethod  = "REBOOTINSTANCE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Restarts the instance";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "LogoutInstance";
    NewLine.SearchMethod  = "LOGOUTINSTANCE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Unlogging the instance";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetQR";
    NewLine.SearchMethod  = "GETQR";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Receives authorization QR code";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetAuthorizationCode";
    NewLine.SearchMethod  = "GETAUTHORIZATIONCODE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Receives the authorization code for phone number linking";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetAuthorizationCode";
    NewLine.SearchMethod  = "GETAUTHORIZATIONCODE";
    NewLine.Parameter     = "--phone";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Phone number in international format without + and 00";
    NewLine.Region      = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetProfilePicture";
    NewLine.SearchMethod  = "SETPROFILEPICTURE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Sets a new profile picture";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetProfilePicture";
    NewLine.SearchMethod  = "SETPROFILEPICTURE";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Profile picture";
    NewLine.Region      = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ArchiveChat";
    NewLine.SearchMethod  = "ARCHIVECHAT";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Archives the selected chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ArchiveChat";
    NewLine.SearchMethod  = "ARCHIVECHAT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for archiving";
    NewLine.Region      = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "UnarchiveChat";
    NewLine.SearchMethod  = "UNARCHIVECHAT";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Unarchives the selected chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "UnarchiveChat";
    NewLine.SearchMethod  = "UNARCHIVECHAT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for dearchiving";
    NewLine.Region      = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetInstanceSettingsStructure";
    NewLine.SearchMethod  = "GETINSTANCESETTINGSSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Account";
    NewLine.MethodDescription   = "Gets the structure template for instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetGroupInformation";
    NewLine.SearchMethod  = "GETGROUPINFORMATION";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Gets group chat data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetGroupInformation";
    NewLine.SearchMethod  = "GETGROUPINFORMATION";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group chat identifier";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "CreateGroup";
    NewLine.SearchMethod  = "CREATEGROUP";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Creates a new group chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "CreateGroup";
    NewLine.SearchMethod  = "CREATEGROUP";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the group chat";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "CreateGroup";
    NewLine.SearchMethod  = "CREATEGROUP";
    NewLine.Parameter     = "--members";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Chat members array (optional, def. val.. - Empty value)";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "UpdateGroupName";
    NewLine.SearchMethod  = "UPDATEGROUPNAME";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Changes the name of an existing group";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "UpdateGroupName";
    NewLine.SearchMethod  = "UPDATEGROUPNAME";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group chat identifier";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "UpdateGroupName";
    NewLine.SearchMethod  = "UPDATEGROUPNAME";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "New group chat name";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "AddGroupMember";
    NewLine.SearchMethod  = "ADDGROUPMEMBER";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Adds a participant to a group chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "AddGroupMember";
    NewLine.SearchMethod  = "ADDGROUPMEMBER";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group chat identifier";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "AddGroupMember";
    NewLine.SearchMethod  = "ADDGROUPMEMBER";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID to add";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ExcludeGroupMember";
    NewLine.SearchMethod  = "EXCLUDEGROUPMEMBER";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Excludes a member from the group";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ExcludeGroupMember";
    NewLine.SearchMethod  = "EXCLUDEGROUPMEMBER";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group chat identifier";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ExcludeGroupMember";
    NewLine.SearchMethod  = "EXCLUDEGROUPMEMBER";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID to add";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetAdminRights";
    NewLine.SearchMethod  = "SETADMINRIGHTS";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Assigns the user as the group administrator";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetAdminRights";
    NewLine.SearchMethod  = "SETADMINRIGHTS";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group chat identifier";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetAdminRights";
    NewLine.SearchMethod  = "SETADMINRIGHTS";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID to add";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "RevokeAdminRights";
    NewLine.SearchMethod  = "REVOKEADMINRIGHTS";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Revokes administrator rights from the user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "RevokeAdminRights";
    NewLine.SearchMethod  = "REVOKEADMINRIGHTS";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group chat identifier";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "RevokeAdminRights";
    NewLine.SearchMethod  = "REVOKEADMINRIGHTS";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID to add";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "LeaveGroup";
    NewLine.SearchMethod  = "LEAVEGROUP";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Logs the current account out of group chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "LeaveGroup";
    NewLine.SearchMethod  = "LEAVEGROUP";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group chat identifier";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetGroupPicture";
    NewLine.SearchMethod  = "SETGROUPPICTURE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Group management";
    NewLine.MethodDescription   = "Sets the group chat picture";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetGroupPicture";
    NewLine.SearchMethod  = "SETGROUPPICTURE";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group chat identifier";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetGroupPicture";
    NewLine.SearchMethod  = "SETGROUPPICTURE";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Profile picture";
    NewLine.Region      = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a text message to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--quoted";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Replying message id if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends the file to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File data or filepath";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--filename";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Name of the file with the extension";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--caption";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text below the file (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--quoted";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Replying message id if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFileByURL";
    NewLine.SearchMethod  = "SENDFILEBYURL";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a file from web to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFileByURL";
    NewLine.SearchMethod  = "SENDFILEBYURL";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFileByURL";
    NewLine.SearchMethod  = "SENDFILEBYURL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "File URL";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFileByURL";
    NewLine.SearchMethod  = "SENDFILEBYURL";
    NewLine.Parameter     = "--filename";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Name of the file with the extension";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFileByURL";
    NewLine.SearchMethod  = "SENDFILEBYURL";
    NewLine.Parameter     = "--caption";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text below the file (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendFileByURL";
    NewLine.SearchMethod  = "SENDFILEBYURL";
    NewLine.Parameter     = "--quoted";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Replying message id if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a poll with answer choices to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Answer options";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--multi";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Allows to select more than one answer choice (optional, def. val.. - False)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--quoted";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Replying message id if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends location data to the specified chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--loc";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Location description. See GetLocationDescription";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--quoted";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Replying message id if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a contact with a phone number to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--contact";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Contact description. See GetContactDescription";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--quoted";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Replying message id if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ForwardMessages";
    NewLine.SearchMethod  = "FORWARDMESSAGES";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends messages from one chat room to another";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ForwardMessages";
    NewLine.SearchMethod  = "FORWARDMESSAGES";
    NewLine.Parameter     = "--from";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Message source chat ID";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ForwardMessages";
    NewLine.SearchMethod  = "FORWARDMESSAGES";
    NewLine.Parameter     = "--to";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message receiver chat ID";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ForwardMessages";
    NewLine.SearchMethod  = "FORWARDMESSAGES";
    NewLine.Parameter     = "--msgs";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Messages or a single message to be sent";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Changes the text of the message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Message identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New message text";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Deletes a message in the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Message identifier";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--sender";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Delete for sender only (optional, def. val.. - False)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetContactDescription";
    NewLine.SearchMethod  = "GETCONTACTDESCRIPTION";
    NewLine.Parameter     = "--phone";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Phone number in international format without a plus sign";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Gets the contact description for the SendContact function";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetContactDescription";
    NewLine.SearchMethod  = "GETCONTACTDESCRIPTION";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Contact name (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetContactDescription";
    NewLine.SearchMethod  = "GETCONTACTDESCRIPTION";
    NewLine.Parameter     = "--surname";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Contact last name (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetContactDescription";
    NewLine.SearchMethod  = "GETCONTACTDESCRIPTION";
    NewLine.Parameter     = "--midname";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Contacts patronymic or middle name (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetContactDescription";
    NewLine.SearchMethod  = "GETCONTACTDESCRIPTION";
    NewLine.Parameter     = "--company";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Name of the contact company (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetLocationDescription";
    NewLine.SearchMethod  = "GETLOCATIONDESCRIPTION";
    NewLine.Parameter     = "--lat";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Geographic latitude";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Gets the description of the location to send with SendLocation method";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetLocationDescription";
    NewLine.SearchMethod  = "GETLOCATIONDESCRIPTION";
    NewLine.Parameter     = "--long";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Geographic longitude";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetLocationDescription";
    NewLine.SearchMethod  = "GETLOCATIONDESCRIPTION";
    NewLine.Parameter     = "--addr";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Location address (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetLocationDescription";
    NewLine.SearchMethod  = "GETLOCATIONDESCRIPTION";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Location name (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetNotification";
    NewLine.SearchMethod  = "GETNOTIFICATION";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Notifications receiving";
    NewLine.MethodDescription   = "Receives one notification from the queue";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetNotification";
    NewLine.SearchMethod  = "GETNOTIFICATION";
    NewLine.Parameter     = "--timeout";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Timeout for waiting for new messages when the queue is empty (optional, def. val.. - 5)";
    NewLine.Region      = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DeleteNotificationFromQueue";
    NewLine.SearchMethod  = "DELETENOTIFICATIONFROMQUEUE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Notifications receiving";
    NewLine.MethodDescription   = "Deletes the notification from the queue after successful receipt";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DeleteNotificationFromQueue";
    NewLine.SearchMethod  = "DELETENOTIFICATIONFROMQUEUE";
    NewLine.Parameter     = "--receipt";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Receipt identifier from the GetNotification method";
    NewLine.Region      = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DownloadMessageFile";
    NewLine.SearchMethod  = "DOWNLOADMESSAGEFILE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Notifications receiving";
    NewLine.MethodDescription   = "Gets a link to download a file from an incoming message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DownloadMessageFile";
    NewLine.SearchMethod  = "DOWNLOADMESSAGEFILE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "DownloadMessageFile";
    NewLine.SearchMethod  = "DOWNLOADMESSAGEFILE";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Identifier of the message with the file";
    NewLine.Region      = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetReadMark";
    NewLine.SearchMethod  = "SETREADMARK";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Notifications receiving";
    NewLine.MethodDescription   = "Sets the Read mark for a message or all chat messages";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetReadMark";
    NewLine.SearchMethod  = "SETREADMARK";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "SetReadMark";
    NewLine.SearchMethod  = "SETREADMARK";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Message ID. All messages, if not filled in (optional, def. val.. - Empty value)";
    NewLine.Region      = "Notifications receiving";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetMessageQueue";
    NewLine.SearchMethod  = "GETMESSAGEQUEUE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message queue";
    NewLine.MethodDescription   = "Gets the list of messages in the queue to be sent";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "ClearMessageQueue";
    NewLine.SearchMethod  = "CLEARMESSAGEQUEUE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message queue";
    NewLine.MethodDescription   = "Clears the queue of messages to be sent";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetChatHistory";
    NewLine.SearchMethod  = "GETCHATHISTORY";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message logs";
    NewLine.MethodDescription   = "Retrieves the chat message history";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetChatHistory";
    NewLine.SearchMethod  = "GETCHATHISTORY";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message logs";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetChatHistory";
    NewLine.SearchMethod  = "GETCHATHISTORY";
    NewLine.Parameter     = "--count";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Number of messages to receive (optional, def. val.. - 100)";
    NewLine.Region      = "Message logs";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetMessage";
    NewLine.SearchMethod  = "GETMESSAGE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message logs";
    NewLine.MethodDescription   = "Gets information about the chat message by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetMessage";
    NewLine.SearchMethod  = "GETMESSAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat identifier";
    NewLine.Region      = "Message logs";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetMessage";
    NewLine.SearchMethod  = "GETMESSAGE";
    NewLine.Parameter     = "--msg";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Message identifier";
    NewLine.Region      = "Message logs";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetIncomingMessageLog";
    NewLine.SearchMethod  = "GETINCOMINGMESSAGELOG";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message logs";
    NewLine.MethodDescription   = "Gets the list of incoming messages of the instance for the specified period";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetIncomingMessageLog";
    NewLine.SearchMethod  = "GETINCOMINGMESSAGELOG";
    NewLine.Parameter     = "--period";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Time in minutes for which messages need to be received (optional, def. val.. - 1440)";
    NewLine.Region      = "Message logs";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetOutgoingMessageLog";
    NewLine.SearchMethod  = "GETOUTGOINGMESSAGELOG";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access parameters. See FormAccessParameters";
    NewLine.Region      = "Message logs";
    NewLine.MethodDescription   = "Gets the list of outgoing messages of the instance for the specified period";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "greenapi";
    NewLine.Module       = "OPI_GreenAPI";
    NewLine.Method        = "GetOutgoingMessageLog";
    NewLine.SearchMethod  = "GETOUTGOINGMESSAGELOG";
    NewLine.Parameter     = "--period";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Time in minutes for which messages need to be received (optional, def. val.. - 1440)";
    NewLine.Region      = "Message logs";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_GreenAPI = LoadScript(""%1/oint/core/Modules/OPI_GreenAPI.os"", Context);
        |" + Chars.LF;


EndFunction 
