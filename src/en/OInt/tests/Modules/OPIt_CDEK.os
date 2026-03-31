// OneScript: ./OInt/tests/Modules/OPIt_CDEK.os

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

    OPI_TestDataRetrieval.FormYAXTests("CDEK");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("CDEK");

EndFunction

#Region Internal

#Region RunnableTests

#Region CDEK

Procedure CdekAPI_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Account" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Password", TestParameters);

    CDEK_GetToken(TestParameters);
    CDEK_GetCashboxChecksByDate(TestParameters);
    CDEK_GetDeliveryCashRegistry(TestParameters);
    CDEK_GetDeliveryCashTransfers(TestParameters);
    CDEK_GetOfficeFilterDescription(TestParameters);
    CDEK_GetOfficeList(TestParameters);
    CDEK_GetRegionsList(TestParameters);

EndProcedure

Procedure CDEKAPI_OrdersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Token", TestParameters);

    CDEK_GetOrderDescription(TestParameters);
    CDEK_CreateOrder(TestParameters);

    OPI_Tools.Pause(25);

    CDEK_GetOrder(TestParameters);
    CDEK_GetOrderByNumber(TestParameters);
    CDEK_CreateReceipt(TestParameters);
    CDEK_CreateBarcode(TestParameters);
    CDEK_CreatePrealert(TestParameters);

    OPI_Tools.Pause(25);

    CDEK_GetReceipt(TestParameters);
    CDEK_GetBarcode(TestParameters);
    CDEK_GetPrealert(TestParameters);
    CDEK_GetPassportDataStatus(TestParameters);
    CDEK_GetCashboxCheck(TestParameters);
    CDEK_UpdateOrder(TestParameters);
    CDEK_CreateCustomerRefund(TestParameters);
    CDEK_CreateRefusal(TestParameters);
    CDEK_DeleteOrder(TestParameters);

EndProcedure

Procedure CdekAPI_CourierInvitationsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Token", TestParameters);

    CDEK_CreateOrder(TestParameters);

    OPI_Tools.Pause(25);

    CDEK_GetCourierInvitationsDescription(TestParameters);
    CDEK_CreateCourierInvitation(TestParameters);
    CDEK_GetCourierInvitation(TestParameters);
    CDEK_DeleteCourierInvitation(TestParameters);
    CDEK_GetAppointmentDescription(TestParameters);

    CDEK_GetAvailableDeliveryIntervals(TestParameters);
    CDEK_RegisterDeliveryAppointment(TestParameters);

    OPI_Tools.Pause(25);

    CDEK_GetDeliveryAppointment(TestParameters);
    CDEK_DeleteOrder(TestParameters);

EndProcedure

#EndRegion // CDEK

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region CDEK

Procedure CDEK_GetToken(FunctionParameters)

    Account  = FunctionParameters["CDEK_Account"];
    Password = FunctionParameters["CDEK_Password"];

    Result = OPI_CDEK.GetToken(Account, Password, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetToken", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrderDescription(FunctionParameters)

    Result = OPI_CDEK.GetOrderDescription();

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetOrderDescription");

    Result = OPI_CDEK.GetOrderDescription(True);

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetOrderDescription", "Clear");

EndProcedure

Procedure CDEK_CreateOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    OrderDescription = New Structure;

    SendLocation = New Structure;
    SendLocation.Insert("code"   , "44");
    SendLocation.Insert("city"   , "Moscow");
    SendLocation.Insert("address", "Ave. Leningradsky, 4");

    DestLocation = New Structure;
    DestLocation.Insert("code"   , "270");
    DestLocation.Insert("city"   , "Novosibirsk");
    DestLocation.Insert("address", "st. Bluchera, 32");

    Recipient = New Structure;

    Phones = New Array;
    Phones.Add(New Structure("number", "+79134637228"));

    Recipient.Insert("phones", Phones);
    Recipient.Insert("name"  , "Ivaniv Ivan");

    Sender = New Structure("name", "Petrov Petr");

    Services = New Array;

    Service = New Structure;
    Service.Insert("code"     , "SECURE_PACKAGE_A2");
    Service.Insert("parameter", 10);

    Services.Add(Service);

    Packages = New Array;

    Package = New Structure;

    Items = New Array;

    Item = New Structure;

    Payment = New Structure;
    Payment.Insert("value", 3000);

    Item.Insert("payment" , Payment);
    Item.Insert("ware_key", "00055");
    Item.Insert("name"    , "Product");
    Item.Insert("cost"    , 300);
    Item.Insert("amount"  , 2);
    Item.Insert("weight"  , 700);
    Item.Insert("url"     , "www.item.ru");

    Items.Add(Item);

    Package.Insert("items"  , Items);
    Package.Insert("number" , "bar-001");
    Package.Insert("comment", "Packaging");
    Package.Insert("height" , 10);
    Package.Insert("length" , 10);
    Package.Insert("weight" , "4000");
    Package.Insert("width"  , 10);

    Packages.Add(Package);

    OrderDescription.Insert("from_location", SendLocation);
    OrderDescription.Insert("to_location"  , DestLocation);
    OrderDescription.Insert("packages"     , Packages);
    OrderDescription.Insert("recipient"    , Recipient);
    OrderDescription.Insert("sender"       , Sender);
    OrderDescription.Insert("services"     , Services);

    OrderDescription.Insert("number"     , String(New UUID));
    OrderDescription.Insert("comment"    , "New order");
    OrderDescription.Insert("tariff_code", 139);

    OrderDescription.Insert("delivery_recipient_cost"    , New Structure("value"        , 50));
    OrderDescription.Insert("delivery_recipient_cost_adv", New Structure("sum,threshold", 3000, 200));

    Result = OPI_CDEK.CreateOrder(Token, OrderDescription, True, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "CreateOrder", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.GetOrder(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetOrder", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrderByNumber(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    OrderNumber = FunctionParameters["CDEK_OrderIMN"];
    Result      = OPI_CDEK.GetOrderByNumber(Token, OrderNumber, True, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetOrderByNumber");

EndProcedure

Procedure CDEK_UpdateOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    OrderDescription = New Structure("comment", "NewComment");

    Result = OPI_CDEK.UpdateOrder(Token, UUID, OrderDescription, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "UpdateOrder");

EndProcedure

Procedure CDEK_DeleteOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.DeleteOrder(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "DeleteOrder");

EndProcedure

Procedure CDEK_CreateCustomerRefund(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Tariff = 139;

    Result = OPI_CDEK.CreateCustomerRefund(Token, UUID, Tariff, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "CreateCustomerRefund");

EndProcedure

Procedure CDEK_CreateRefusal(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.CreateRefusal(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "CreateRefusal");

EndProcedure

Procedure CDEK_GetCourierInvitationsDescription(FunctionParameters)

    Result = OPI_CDEK.GetCourierInvitationsDescription();

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetCourierInvitationsDescription");

    Result = OPI_CDEK.GetCourierInvitationsDescription(True);

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetCourierInvitationsDescription", "Clear");

EndProcedure

Procedure CDEK_CreateCourierInvitation(FunctionParameters)

    Token       = FunctionParameters["CDEK_Token"];
    CurrentDate = OPI_Tools.GetCurrentDate();

    InvitationDescription = New Structure;
    InvitationDescription.Insert("intake_date"     , Format(CurrentDate + 60 * 60 * 24, "DF=yyyy-MM-dd"));
    InvitationDescription.Insert("intake_time_from", "10:00");
    InvitationDescription.Insert("intake_time_to"  , "17:00");
    InvitationDescription.Insert("name"            , "Consolidated cargo");
    InvitationDescription.Insert("weight"          , 1000);
    InvitationDescription.Insert("length"          , 10);
    InvitationDescription.Insert("width"           , 10);
    InvitationDescription.Insert("height"          , 10);
    InvitationDescription.Insert("comment"         , "Comment to courier");
    InvitationDescription.Insert("need_call"       , False);

    Sender = New Structure;
    Sender.Insert("company", "Company");
    Sender.Insert("name"   , "Ivaniv Ivan");

    Phones = New Array;
    Phone  = New Structure("number", "+79589441654");
    Phones.Add(Phone);

    Sender.Insert("phones", Phones);

    InvitationDescription.Insert("sender", Sender);

    ShippingPoint = New Structure;
    ShippingPoint.Insert("code"        , "44");
    ShippingPoint.Insert("fias_guid"   , "0c5b2444-70a0-4932-980c-b4dc0d3f02b5");
    ShippingPoint.Insert("postal_code" , "109004");
    ShippingPoint.Insert("longitude"   , 37.6204);
    ShippingPoint.Insert("latitude"    , 55.754);
    ShippingPoint.Insert("country_code", "RU");
    ShippingPoint.Insert("region"      , "Moscow");
    ShippingPoint.Insert("sub_region"  , "Moscow");
    ShippingPoint.Insert("city"        , "Moscow");
    ShippingPoint.Insert("kladr_code"  , "7700000000000");
    ShippingPoint.Insert("address"     , "st. Bluchera, 32");

    InvitationDescription.Insert("from_location", ShippingPoint);

    Result = OPI_CDEK.CreateCourierInvitation(Token, InvitationDescription, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "CreateCourierInvitation", , FunctionParameters);

EndProcedure

Procedure CDEK_GetCourierInvitation(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_IntakeUUID"];

    Result = OPI_CDEK.GetCourierInvitation(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetCourierInvitation");

EndProcedure

Procedure CDEK_DeleteCourierInvitation(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_IntakeUUID"];

    Result = OPI_CDEK.DeleteCourierInvitation(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "DeleteCourierInvitation");

EndProcedure

Procedure CDEK_CreateReceipt(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Type   = "tpl_russia";
    Copies = 1;

    Result = OPI_CDEK.CreateReceipt(Token, UUID, Type, Copies, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "CreateReceipt", , FunctionParameters);

EndProcedure

Procedure CDEK_GetReceipt(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_PrintUUID"];

    Result = OPI_CDEK.GetReceipt(Token, UUID, , True); // Server response with a URL

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetReceipt");

EndProcedure

Procedure CDEK_CreateBarcode(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Format = "A5";
    Copies = 1;

    Result = OPI_CDEK.CreateBarcode(Token, UUID, Copies, Format, , True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "CreateBarcode", , FunctionParameters);

EndProcedure

Procedure CDEK_GetBarcode(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_BarcodeUUID"];

    Result = OPI_CDEK.GetBarcode(Token, UUID, , True); // Server response with a URL

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetBarcode");

EndProcedure

Procedure CDEK_GetAvailableDeliveryIntervals(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.GetAvailableDeliveryIntervals(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetAvailableDeliveryIntervals");

EndProcedure

Procedure CDEK_GetAppointmentDescription(FunctionParameters)

    Result = OPI_CDEK.GetAppointmentDescription();

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetAppointmentDescription");

    Result = OPI_CDEK.GetAppointmentDescription(True);

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetAppointmentDescription", "Clear");

EndProcedure

Procedure CDEK_RegisterDeliveryAppointment(FunctionParameters)

    Token     = FunctionParameters["CDEK_Token"];
    OrderUUID = FunctionParameters["CDEK_OrderUUID"];

    Day          = 60 * 60 * 24;
    CurrentDate  = BegOfDay(OPI_Tools.GetCurrentDate());
    DeliveryDate = CurrentDate + Day * 14;

    While DayOfWeek(DeliveryDate) > 5 Do
        DeliveryDate = DeliveryDate + Day;
    EndDo;

    Appointment = New Structure;

    Appointment.Insert("cdek_number", "1106207236");
    Appointment.Insert("order_uuid" , OrderUUID);
    Appointment.Insert("date"       , Format(DeliveryDate, "DF=yyyy-MM-dd"));
    Appointment.Insert("time_from"  , "10:00");
    Appointment.Insert("time_to"    , "17:00");
    Appointment.Insert("comment"    , "Group office");

    DeliveryLocation = New Structure;
    DeliveryLocation.Insert("code"        , "270");
    DeliveryLocation.Insert("fias_guid"   , "0c5b2444-70a0-4932-980c-b4dc0d3f02b5");
    DeliveryLocation.Insert("postal_code" , "109004");
    DeliveryLocation.Insert("longitude"   , 37.6204);
    DeliveryLocation.Insert("latitude"    , 55.754);
    DeliveryLocation.Insert("country_code", "RU");
    DeliveryLocation.Insert("region"      , "Novosibirsk");
    DeliveryLocation.Insert("sub_region"  , "Novosibirsk");
    DeliveryLocation.Insert("city"        , "Novosibirsk");
    DeliveryLocation.Insert("kladr_code"  , "7700000000000");
    DeliveryLocation.Insert("address"     , "st. Bluchera, 33");

    Appointment.Insert("to_location", DeliveryLocation);

    Result = OPI_CDEK.RegisterDeliveryAppointment(Token, Appointment, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "RegisterDeliveryAppointment", , FunctionParameters);

EndProcedure

Procedure CDEK_GetDeliveryAppointment(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_ApptUUID"];

    Result = OPI_CDEK.GetDeliveryAppointment(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetDeliveryAppointment");

EndProcedure

Procedure CDEK_CreatePrealert(FunctionParameters)

    Token        = FunctionParameters["CDEK_Token"];
    UUID         = FunctionParameters["CDEK_OrderUUID"];
    Point        = "NSK27";
    TransferDate = OPI_Tools.GetCurrentDate() + 60 * 60 * 24;

    Result = OPI_CDEK.CreatePrealert(Token, UUID, TransferDate, Point, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "CreatePrealert", , FunctionParameters);

EndProcedure

Procedure CDEK_GetPrealert(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_PrealertUUID"];

    Result = OPI_CDEK.GetPrealert(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetPrealert");

EndProcedure

Procedure CDEK_GetPassportDataStatus(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.GetPassportDataStatus(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetPassportDataStatus");

EndProcedure

Procedure CDEK_GetCashboxCheck(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.GetCashboxCheck(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetCashboxCheck");

EndProcedure

Procedure CDEK_GetCashboxChecksByDate(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Result = OPI_CDEK.GetCashboxChecksByDate(Token, ReceivingDate, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetCashboxChecksByDate");

EndProcedure

Procedure CDEK_GetDeliveryCashRegistry(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Result = OPI_CDEK.GetDeliveryCashRegistry(Token, ReceivingDate, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetDeliveryCashRegistry");

EndProcedure

Procedure CDEK_GetDeliveryCashTransfers(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Result = OPI_CDEK.GetDeliveryCashTransfers(Token, ReceivingDate, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetDeliveryCashTransfers");

EndProcedure

Procedure CDEK_GetOfficeFilterDescription(FunctionParameters)

    Result = OPI_CDEK.GetOfficeFilterDescription();

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetOfficeFilterDescription");

    Result = OPI_CDEK.GetOfficeFilterDescription(True);

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetOfficeFilterDescription", "Clear");

EndProcedure

Procedure CDEK_GetOfficeList(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    Filter = New Structure;
    Filter.Insert("weight_max" , 50);
    Filter.Insert("city_code"  , 270);
    Filter.Insert("allowed_cod", True);

    Result = OPI_CDEK.GetOfficeList(Token, Filter, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetOfficeList");

EndProcedure

Procedure CDEK_GetRegionsList(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    Result = OPI_CDEK.GetRegionsList(Token, , , , True);

    // END

    OPI_TestDataRetrieval.Process(Result, "CDEK", "GetRegionsList");

EndProcedure

#EndRegion // CDEK

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure СдэкАПИ_ОбщиеМетоды() Export
    CdekAPI_CommonMethods();
EndProcedure

Procedure СдэкАПИ_РаботаСЗаказами() Export
    CDEKAPI_OrdersManagement();
EndProcedure

Procedure СдэкАПИ_РаботаСЗаявкамиНаВызовКурьера() Export
    CdekAPI_CourierInvitationsManagement();
EndProcedure

#EndRegion