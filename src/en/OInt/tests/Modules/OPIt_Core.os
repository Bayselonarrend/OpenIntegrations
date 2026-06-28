// OneScript: ./OInt/tests/Modules/OPIt_Core.os

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

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

    OPI_TestDataRetrieval.FormYAXTests("Core");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Core");

EndFunction

#Region Internal

#Region RunnableTests

Procedure CheckIBToLastBuildCompliance() Export

    BuildSum = OPI_Tools.GetLastBuildHashSum();

    URL = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/service/last_build_hash.txt";

    LastSum = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .ProcessRequest("GET")
        .ReturnResponseAsString(False, True);

    OPI_TestDataRetrieval.Process(BuildSum, "Core", "CheckIBToLastBuildCompliance", , LastSum);

EndProcedure

Procedure ValidateAdvancedCall() Export

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    AdvancedCall_CallWithSettings(TestParameters);
    AdvancedCall_GetAvailableSettings();
    AdvancedCall_BackgroundCall(TestParameters);

EndProcedure

Procedure CheckCLIOutputRepresentation() Export

    If Not OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI ONLY");
        Return;
    EndIf;

    OutputRepresentation_BinaryDataHex();
    OutputRepresentation_BinaryDataBase64();
    OutputRepresentation_BinaryDataUtf8();
    OutputRepresentation_HexString();
    OutputRepresentation_Base64String();
    OutputRepresentation_Utf8String();

EndProcedure

#EndRegion

#EndRegion

#Region Private

#Region AtomicTests

Procedure AdvancedCall_CallWithSettings(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];

    Parameters = New Array;
    Parameters.Add(Token);

    Settings = New Structure("adv_response", True);

    Result = OPI_AdvancedCall.CallWithSettings("OPI_Telegram"
        , "GetBotInformation"
        , Parameters
        , Settings);

    OPI_TestDataRetrieval.Process(Result, "Core", "CallWithSettings");

EndProcedure

Procedure AdvancedCall_GetAvailableSettings()

    Result = OPI_AdvancedCall.GetAvailableSettings("OPI_Telegram", "GetBotInformation");

    OPI_TestDataRetrieval.Process(Result, "Core", "GetAvailableSettings");

EndProcedure

Procedure AdvancedCall_BackgroundCall(FunctionParameters)

    #If Not Client Then

        Token  = FunctionParameters["Telegram_Token"];
        FileID = FunctionParameters["Telegram_FileID"];

        Parameters = New Array;
        Parameters.Add(Token);

        Settings = New Structure("adv_response, dontwait"
            , True
            , True);

        Result = OPI_AdvancedCall.CallWithSettings("OPI_Telegram"
            , "GetBotInformation"
            , Parameters
            , Settings);

        OPI_TestDataRetrieval.Process(Result, "Core", "BackgroundCall");

        Parameters = New Array;
        Parameters.Add(Token);
        Parameters.Add(FileID);

        Settings = New Structure("dontwait", True);

        Result = OPI_AdvancedCall.CallWithSettings("OPI_Telegram"
            , "DownloadFile"
            , Parameters
            , Settings);

        OPI_TestDataRetrieval.Process(Result, "Core", "BackgroundCall", "BDReturn");

        Settings = New Structure("adv_response, dontwait"
            , True
            , True);

        Result = OPI_AdvancedCall.CallWithSettings("OPI_Telegram"
            , "DownloadFile"
            , Parameters
            , Settings);

        OPI_TestDataRetrieval.Process(Result, "Core", "BackgroundCall", "DBStructReturn");

    #EndIf

EndProcedure

Procedure OutputRepresentation_BinaryDataHex()

    Data = New Map;
    Data.Insert("a", "b");

    Expected    = OPI_MessagePack.SerializeData(Data);
    ExpectedHex = Upper(GetHexStringFromBinaryData(Expected));

    Options = New Structure;
    Options.Insert("value", OPI_Tools.JSONString(Data));
    Options.Insert("raw"  , "true");
    Options.Insert("out"  , "_hex_");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

    OPI_TestDataRetrieval.Process(Result, "Core", "BinaryDataHex", , ExpectedHex);

    //END

EndProcedure

Procedure OutputRepresentation_BinaryDataBase64()

    Data = New Map;
    Data.Insert("a", "b");

    Expected       = OPI_MessagePack.SerializeData(Data);
    ExpectedBase64 = GetBase64StringFromBinaryData(Expected);

    Options = New Structure;
    Options.Insert("value", OPI_Tools.JSONString(Data));
    Options.Insert("raw"  , "true");
    Options.Insert("out"  , "_base64_");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

    OPI_TestDataRetrieval.Process(Result, "Core", "BinaryDataBase64", , ExpectedBase64);

EndProcedure

Procedure OutputRepresentation_BinaryDataUtf8()

    Data = New Map;
    Data.Insert("a", "b");

    Expected     = OPI_MessagePack.SerializeData(Data);
    ExpectedUtf8 = GetStringFromBinaryData(Expected);

    Options = New Structure;
    Options.Insert("value", OPI_Tools.JSONString(Data));
    Options.Insert("raw"  , "true");
    Options.Insert("out"  , "_utf8_");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

    OPI_TestDataRetrieval.Process(Result, "Core", "BinaryDataUtf8", , ExpectedUtf8);

EndProcedure

Procedure OutputRepresentation_HexString()

    ExpectedString = OPI_Tools.GetLastBuildHashSum();
    ExpectedHex    = Upper(GetHexStringFromBinaryData(GetBinaryDataFromString(ExpectedString)));

    Options = New Structure;
    Options.Insert("out", "_hex_");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("hashsum", "", Options);

    OPI_TestDataRetrieval.Process(Result, "Core", "HexString", , ExpectedHex);

EndProcedure

Procedure OutputRepresentation_Base64String()

    ExpectedString = OPI_Tools.GetLastBuildHashSum();
    ExpectedBase64 = GetBase64StringFromBinaryData(GetBinaryDataFromString(ExpectedString));

    Options = New Structure;
    Options.Insert("out", "_base64_");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("hashsum", "", Options);

    OPI_TestDataRetrieval.Process(Result, "Core", "Base64String", , ExpectedBase64);

EndProcedure

Procedure OutputRepresentation_Utf8String()

    Expected = OPI_Tools.GetLastBuildHashSum();

    Options = New Structure;
    Options.Insert("out", "_utf8_");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("hashsum", "", Options);

    OPI_TestDataRetrieval.Process(Result, "Core", "Utf8String", , Expected);

EndProcedure

#EndRegion

#EndRegion


#Region Alternate

Procedure ПроверитьСоответствиеИБПоследнейСборке() Export
    CheckIBToLastBuildCompliance();
EndProcedure

Procedure ПроверитьРасширенныйВызов() Export
    ValidateAdvancedCall();
EndProcedure

Procedure ПроверитьРепрезентациюВыводаCLI() Export
    CheckCLIOutputRepresentation();
EndProcedure

#EndRegion