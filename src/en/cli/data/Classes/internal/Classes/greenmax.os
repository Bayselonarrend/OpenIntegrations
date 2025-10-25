
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
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "FormAccessParameters";
    NewLine.SearchMethod = "FORMACCESSPARAMETERS";
    NewLine.Parameter    = "--api";
    NewLine.Description    = "API host link";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Forms the structure of basic authorization data";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "FormAccessParameters";
    NewLine.SearchMethod = "FORMACCESSPARAMETERS";
    NewLine.Parameter    = "--media";
    NewLine.Description    = "Link to host API for sending files";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "FormAccessParameters";
    NewLine.SearchMethod = "FORMACCESSPARAMETERS";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Unique instance number";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "FormAccessParameters";
    NewLine.SearchMethod = "FORMACCESSPARAMETERS";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Instance access key";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetAccountInformation";
    NewLine.SearchMethod = "GETACCOUNTINFORMATION";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets account information";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetInstanceSettings";
    NewLine.SearchMethod = "GETINSTANCESETTINGS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets the current instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetInstanceSettings";
    NewLine.SearchMethod = "SETINSTANCESETTINGS";
    NewLine.Parameter    = "--settings";
    NewLine.Description    = "Instance settings. See GetInstanceSettingsStructure";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Sets the instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetInstanceSettings";
    NewLine.SearchMethod = "SETINSTANCESETTINGS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetAuthorizationCode";
    NewLine.SearchMethod = "GETAUTHORIZATIONCODE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Sends an SMS to the specified number to obtain a confirmation code";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetAuthorizationCode";
    NewLine.SearchMethod = "GETAUTHORIZATIONCODE";
    NewLine.Parameter    = "--phone";
    NewLine.Description    = "Phone number without +";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SendAuthorizationCode";
    NewLine.SearchMethod = "SENDAUTHORIZATIONCODE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Authorizes the instance using the access code from SMS";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SendAuthorizationCode";
    NewLine.SearchMethod = "SENDAUTHORIZATIONCODE";
    NewLine.Parameter    = "--code";
    NewLine.Description    = "Authorization code";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetInstanceStatus";
    NewLine.SearchMethod = "GETINSTANCESTATUS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets instance status";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetProfilePicture";
    NewLine.SearchMethod = "SETPROFILEPICTURE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Sets a new profile picture";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetProfilePicture";
    NewLine.SearchMethod = "SETPROFILEPICTURE";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "Profile picture";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "LogoutInstance";
    NewLine.SearchMethod = "LOGOUTINSTANCE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Unlogging the instance";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "RebootInstance";
    NewLine.SearchMethod = "REBOOTINSTANCE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Restarts the instance";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CheckAccount";
    NewLine.SearchMethod = "CHECKACCOUNT";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Checks the existence of a Max account by phone number";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CheckAccount";
    NewLine.SearchMethod = "CHECKACCOUNT";
    NewLine.Parameter    = "--phone";
    NewLine.Description    = "Phone number for verification without +";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CheckAccount";
    NewLine.SearchMethod = "CHECKACCOUNT";
    NewLine.Parameter    = "--force";
    NewLine.Description    = "Ignore cache on repeated verification request (optional, def. val. - False)";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetContactList";
    NewLine.SearchMethod = "GETCONTACTLIST";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets account contact list";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetContactList";
    NewLine.SearchMethod = "GETCONTACTLIST";
    NewLine.Parameter    = "--count";
    NewLine.Description    = "Contact count to retrieve. All if not specified (optional, def. val. - Empty value)";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetContactInformation";
    NewLine.SearchMethod = "GETCONTACTINFORMATION";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets information about the selected contact";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetContactInformation";
    NewLine.SearchMethod = "GETCONTACTINFORMATION";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Chat identifier";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetChatList";
    NewLine.SearchMethod = "GETCHATLIST";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets account chat list";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetChatAvatar";
    NewLine.SearchMethod = "GETCHATAVATAR";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets chat image URL";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetChatAvatar";
    NewLine.SearchMethod = "GETCHATAVATAR";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Chat identifier";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetInstanceSettingsStructure";
    NewLine.SearchMethod = "GETINSTANCESETTINGSSTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets the structure template for instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CreateGroup";
    NewLine.SearchMethod = "CREATEGROUP";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Creates a new group chat with the specified name";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CreateGroup";
    NewLine.SearchMethod = "CREATEGROUP";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Group name";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CreateGroup";
    NewLine.SearchMethod = "CREATEGROUP";
    NewLine.Parameter    = "--members";
    NewLine.Description    = "Array of group member IDs or a single ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetGroupInformation";
    NewLine.SearchMethod = "GETGROUPINFORMATION";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Gets information about the group chat";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetGroupInformation";
    NewLine.SearchMethod = "GETGROUPINFORMATION";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "UpdateGroupName";
    NewLine.SearchMethod = "UPDATEGROUPNAME";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Change group chat name";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "UpdateGroupName";
    NewLine.SearchMethod = "UPDATEGROUPNAME";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "UpdateGroupName";
    NewLine.SearchMethod = "UPDATEGROUPNAME";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "New chat name";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetGroupPicture";
    NewLine.SearchMethod = "SETGROUPPICTURE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Sets the image as the group chat avatar";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetGroupPicture";
    NewLine.SearchMethod = "SETGROUPPICTURE";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetGroupPicture";
    NewLine.SearchMethod = "SETGROUPPICTURE";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "Image in jpg format";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "ChangeGroupSettings";
    NewLine.SearchMethod = "CHANGEGROUPSETTINGS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Changes selected group chat settings";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "ChangeGroupSettings";
    NewLine.SearchMethod = "CHANGEGROUPSETTINGS";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "ChangeGroupSettings";
    NewLine.SearchMethod = "CHANGEGROUPSETTINGS";
    NewLine.Parameter    = "--set";
    NewLine.Description    = "Group chat settings. See GetGroupSettingsStructure";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "AddGroupMember";
    NewLine.SearchMethod = "ADDGROUPMEMBER";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Adds a new member to the selected group chat";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "AddGroupMember";
    NewLine.SearchMethod = "ADDGROUPMEMBER";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "AddGroupMember";
    NewLine.SearchMethod = "ADDGROUPMEMBER";
    NewLine.Parameter    = "--member";
    NewLine.Description    = "Member ID for addition";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "RemoveGroupMember";
    NewLine.SearchMethod = "REMOVEGROUPMEMBER";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Removes a member from the selected group chat";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "RemoveGroupMember";
    NewLine.SearchMethod = "REMOVEGROUPMEMBER";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "RemoveGroupMember";
    NewLine.SearchMethod = "REMOVEGROUPMEMBER";
    NewLine.Parameter    = "--member";
    NewLine.Description    = "Member ID for removal";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetAdminRights";
    NewLine.SearchMethod = "SETADMINRIGHTS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Assigns administrator rights to the specified group chat member";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetAdminRights";
    NewLine.SearchMethod = "SETADMINRIGHTS";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetAdminRights";
    NewLine.SearchMethod = "SETADMINRIGHTS";
    NewLine.Parameter    = "--member";
    NewLine.Description    = "Member ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "RevokeAdminRights";
    NewLine.SearchMethod = "REVOKEADMINRIGHTS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Revokes administrator rights from the specified group chat member";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "RevokeAdminRights";
    NewLine.SearchMethod = "REVOKEADMINRIGHTS";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "RevokeAdminRights";
    NewLine.SearchMethod = "REVOKEADMINRIGHTS";
    NewLine.Parameter    = "--member";
    NewLine.Description    = "Member ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "LeaveGroup";
    NewLine.SearchMethod = "LEAVEGROUP";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Excludes the current account from the specified group";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "LeaveGroup";
    NewLine.SearchMethod = "LEAVEGROUP";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Group chat ID";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetGroupSettingsStructure";
    NewLine.SearchMethod = "GETGROUPSETTINGSSTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Group management";
    NewLine.MethodDescription   = "Returns the structure of group chat settings fields";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetGroupSettingsStructure";
    NewLine.SearchMethod = "GETGROUPSETTINGSSTRUCTURE";
    NewLine.Parameter    = "--map";
    NewLine.Description    = "True > returns settings fields as a mapping (optional, def. val. - False)";
    NewLine.Region     = "Group management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Message sending";
    NewLine.MethodDescription   = "Sends a text message to the selected chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Chat identifier";
    NewLine.Region     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--typing";
    NewLine.Description    = "Time to show the typing indicator before sending (in ms.) (optional, def. val. - Empty value)";
    NewLine.Region     = "Message sending";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_GreenMax = LoadScript(""%1/oint/core/Modules/OPI_GreenMax.os"", Context);
        |" + Chars.LF;


EndFunction 
