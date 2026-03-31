// OneScript: ./OInt/tests/Modules/OPIt_Viber.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Test suite for YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

#Use oint
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("Viber");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Viber");

EndFunction

#Region Internal

#Region RunnableTests

#Region Viber

Procedure Viber_DataRetrieval() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelToken"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelAdminID", TestParameters);

    Return;

    //@skip-check unreachable-statements
    // BSLLS:UnreachableCode-off

    Viber_GetChannelInformation(TestParameters);
    Viber_GetUserData(TestParameters);
    Viber_GetOnlineUsers(TestParameters);
    Viber_SetWebhook(TestParameters);

    // BSLLS:UnreachableCode-on

EndProcedure

Procedure Viber_MessagesSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelToken"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelAdminID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_Token"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_UserID"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"            , TestParameters);

    Viber_CreateKeyboardFromArrayButton(TestParameters);

    Return;

    //@skip-check unreachable-statement
    // BSLLS:UnreachableCode-off

    Viber_SendTextMessage(TestParameters);
    Viber_SendImage(TestParameters);
    Viber_SendFile(TestParameters);
    Viber_SendContact(TestParameters);
    Viber_SendLocation(TestParameters);
    Viber_SendLink(TestParameters);

    // BSLLS:UnreachableCode-on

EndProcedure

#EndRegion // Viber

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Viber

Procedure Viber_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Viber_ChannelToken"];
    URL   = "http://api.athenaeum.digital/hs/viber";

    Result = OPI_Viber.SetWebhook(Token, URL);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "SetWebhook");

EndProcedure

Procedure Viber_GetChannelInformation(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    Result = OPI_Viber.GetChannelInformation(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "GetChannelInformation");

EndProcedure

Procedure Viber_GetUserData(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Result = OPI_Viber.GetUserData(Token, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "GetUserData");

EndProcedure

Procedure Viber_GetOnlineUsers(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Result = OPI_Viber.GetOnlineUsers(Token, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "GetOnlineUsers");

EndProcedure

Procedure Viber_CreateKeyboardFromArrayButton(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Result = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "CreateKeyboardFromArrayButton");

EndProcedure

Procedure Viber_SendTextMessage(FunctionParameters)

    Text = "TestMessage";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Keyboard = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendTextMessage"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendTextMessage", "Channel");

EndProcedure

Procedure Viber_SendImage(FunctionParameters)

    Description = "TestMessage";
    URL         = FunctionParameters["Picture"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendImage"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendImage", "Channel");

EndProcedure

Procedure Viber_SendFile(FunctionParameters)

    Extension = "docx";
    URL       = FunctionParameters["Document"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendFile"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendFile", "Channel");

EndProcedure

Procedure Viber_SendContact(FunctionParameters)

    Name  = "Petr Petrov";
    Phone = "+123456789";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendContact"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendContact", "Channel");

EndProcedure

Procedure Viber_SendLocation(FunctionParameters)

    Latitude  = "48.87373649724122";
    Longitude = "2.2954639195323967";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendLocation"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendLocation", "Channel");

EndProcedure

Procedure Viber_SendLink(FunctionParameters)

    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendLink"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Viber", "SendLink", "Channel");

EndProcedure

#EndRegion // Viber

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure Вайбер_ПолучениеИнформации() Export
    Viber_DataRetrieval();
EndProcedure

Procedure Вайбер_ОтправкаСообщений() Export
    Viber_MessagesSending();
EndProcedure

#EndRegion