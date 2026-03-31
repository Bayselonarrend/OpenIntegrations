// OneScript: ./OInt/tests/Modules/OPIt_GreenAPI.os

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

// Набор тестов для YAxUnit

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

#Использовать oint
#Использовать asserts
#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("GreenAPI");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("GreenAPI");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область GreenAPI

Процедура GAPI_Аккаунт() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_AccountID"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_TestGroupID", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"             , ПараметрыТеста);

    GreenAPI_АрхивироватьЧат(ПараметрыТеста);
    GreenAPI_РазархивироватьЧат(ПараметрыТеста);
    GreenAPI_СформироватьПараметрыДоступа(ПараметрыТеста);
    GreenAPI_ПолучитьНастройкиИнстанса(ПараметрыТеста);
    GreenAPI_ПолучитьИнформациюОбАккаунте(ПараметрыТеста);
    GreenAPI_ПолучитьСтруктуруНастроекИнстанса(ПараметрыТеста);
    GreenAPI_УстановитьНастройкиИнстанса(ПараметрыТеста);
    GreenAPI_ПолучитьСостояниеИнстанса(ПараметрыТеста);
    GreenAPI_УстановитьКартинкуПрофиля(ПараметрыТеста);
    // !DISABLED! GreenAPI_ПерезапуститьИнстанс(ПараметрыТеста);
    // !DISABLED! GreenAPI_ПолучитьКодАвторизации(ПараметрыТеста);
    // !DISABLED! GreenAPI_РазлогинитьИнстанс(ПараметрыТеста);
    // !DISABLED! GreenAPI_ПолучитьQR(ПараметрыТеста);

КонецПроцедуры

Процедура GAPI_УправлениеГруппами() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_ApiURL"    , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_MediaURL"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_IdInstance", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_Token"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_AccountID" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"            , ПараметрыТеста);

    GreenAPI_СоздатьГруппу(ПараметрыТеста);
    GreenAPI_ПолучитьИнформациюОГруппе(ПараметрыТеста);
    GreenAPI_ИзменитьИмяГруппы(ПараметрыТеста);
    GreenAPI_УстановитьКартинкуГруппы(ПараметрыТеста);
    GreenAPI_ДобавитьУчастникаВГруппу(ПараметрыТеста);
    GreenAPI_ИсключитьУчастникаГруппы(ПараметрыТеста);
    GreenAPI_НазначитьПраваАдминистратора(ПараметрыТеста);
    GreenAPI_ОтозватьПраваАдминистратора(ПараметрыТеста);
    GreenAPI_ПокинутьГруппу(ПараметрыТеста);

КонецПроцедуры

Процедура GAPI_ОтправкаСообщений() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_TestGroupID", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_AccountID"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"             , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Video"               , ПараметрыТеста);

    GreenAPI_ОтправитьТекстовоеСообщение(ПараметрыТеста);
    GreenAPI_ОтправитьФайл(ПараметрыТеста);
    GreenAPI_ОтправитьФайлПоURL(ПараметрыТеста);
    GreenAPI_ОтправитьОпрос(ПараметрыТеста);
    GreenAPI_ОтправитьЛокацию(ПараметрыТеста);
    GreenAPI_ОтправитьКонтакт(ПараметрыТеста);
    GreenAPI_ПереслатьСообщения(ПараметрыТеста);
    GreenAPI_ПолучитьОписаниеЛокации(ПараметрыТеста);
    GreenAPI_ПолучитьОписаниеКонтакта(ПараметрыТеста);
    GreenAPI_ИзменитьТекстСообщения(ПараметрыТеста);
    GreenAPI_УдалитьСообщение(ПараметрыТеста);

КонецПроцедуры

Процедура GAPI_ПолучениеУведомлений() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_ApiURL"           , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_MediaURL"         , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_IdInstance"       , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_Token"            , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_AccountID"        , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_FileMessageID"    , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_TestGroupID"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_DownloadMessageID", ПараметрыТеста);

    GreenAPI_ПолучитьУведомление(ПараметрыТеста);
    GreenAPI_УстановитьОтметкуПрочтения(ПараметрыТеста);
    // !DISABLED! GreenAPI_СкачатьФайлСообщения(ПараметрыТеста);
    GreenAPI_УдалитьУведомлениеИзОчереди(ПараметрыТеста);

КонецПроцедуры

Процедура GAPI_ОчередьСообщений() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_AccountID"  , ПараметрыТеста);

    GreenAPI_ПолучитьОчередьСообщений(ПараметрыТеста);
    GreenAPI_ОчиститьОчередьСообщений(ПараметрыТеста);

КонецПроцедуры

Процедура GAPI_ЖурналыСообщений() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_TestGroupID", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_AccountID"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenAPI_MessageID"  , ПараметрыТеста);

    GreenAPI_ПолучитьИсториюЧата(ПараметрыТеста);
    GreenAPI_ПолучитьСообщение(ПараметрыТеста);
    GreenAPI_ПолучитьЖурналВходящихСообщений(ПараметрыТеста);
    GreenAPI_ПолучитьЖурналИсходящихСообщений(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // GreenAPI

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область GreenAPI

Процедура GreenAPI_СформироватьПараметрыДоступа(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    Результат = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "СформироватьПараметрыДоступа");

КонецПроцедуры

Процедура GreenAPI_ПолучитьНастройкиИнстанса(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьНастройкиИнстанса(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьНастройкиИнстанса", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenAPI_ПолучитьИнформациюОбАккаунте(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьИнформациюОбАккаунте(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьИнформациюОбАккаунте");

КонецПроцедуры

Процедура GreenAPI_ПолучитьСтруктуруНастроекИнстанса(ПараметрыФункции)

    Результат = OPI_GreenAPI.ПолучитьСтруктуруНастроекИнстанса();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьСтруктуруНастроекИнстанса");

    Результат = OPI_GreenAPI.ПолучитьСтруктуруНастроекИнстанса(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьСтруктуруНастроекИнстанса", "Пустая");

КонецПроцедуры

Процедура GreenAPI_УстановитьНастройкиИнстанса(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    СтруктураНастроек = Новый Структура;
    СтруктураНастроек.Вставить("pollMessageWebhook"       , "yes");
    СтруктураНастроек.Вставить("incomingBlockWebhook"     , "no");
    СтруктураНастроек.Вставить("incomingCallWebhook"      , "no");
    СтруктураНастроек.Вставить("editedMessageWebhook"     , "yes");
    СтруктураНастроек.Вставить("deletedMessageWebhook"    , "yes");
    СтруктураНастроек.Вставить("outgoingAPIMessageWebhook", "yes");

    Результат = OPI_GreenAPI.УстановитьНастройкиИнстанса(СтруктураНастроек, ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "УстановитьНастройкиИнстанса");

КонецПроцедуры

Процедура GreenAPI_ПолучитьСостояниеИнстанса(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьСостояниеИнстанса(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьСостояниеИнстанса");

КонецПроцедуры

Процедура GreenAPI_ПерезапуститьИнстанс(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПерезапуститьИнстанс(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПерезапуститьИнстанс");

КонецПроцедуры

Процедура GreenAPI_ПолучитьQR(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьQR(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьQR");

КонецПроцедуры

Процедура GreenAPI_РазлогинитьИнстанс(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.РазлогинитьИнстанс(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "РазлогинитьИнстанс");

КонецПроцедуры

Процедура GreenAPI_ПолучитьКодАвторизации(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    НомерТелефона = 441234567890;

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьКодАвторизации(ПараметрыДоступа, НомерТелефона);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьКодАвторизации");

КонецПроцедуры

Процедура GreenAPI_УстановитьКартинкуПрофиля(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    Картинка = ПараметрыФункции["Picture"]; // URL, Путь или Двоичные данные

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.УстановитьКартинкуПрофиля(ПараметрыДоступа, Картинка);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "УстановитьКартинкуПрофиля");

КонецПроцедуры

Процедура GreenAPI_СоздатьГруппу(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    Имя = "New group";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.СоздатьГруппу(ПараметрыДоступа, Имя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "СоздатьГруппу", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenAPI_ПокинутьГруппу(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDГруппы = ПараметрыФункции["GreenAPI_GroupID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПокинутьГруппу(ПараметрыДоступа, IDГруппы);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПокинутьГруппу");

КонецПроцедуры

Процедура GreenAPI_ПолучитьИнформациюОГруппе(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDГруппы = ПараметрыФункции["GreenAPI_GroupID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьИнформациюОГруппе(ПараметрыДоступа, IDГруппы);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьИнформациюОГруппе");

КонецПроцедуры

Процедура GreenAPI_ИзменитьИмяГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDГруппы = ПараметрыФункции["GreenAPI_GroupID"];
    Имя      = "New name";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ИзменитьИмяГруппы(ПараметрыДоступа, IDГруппы, Имя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ИзменитьИмяГруппы");

КонецПроцедуры

Процедура GreenAPI_ДобавитьУчастникаВГруппу(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDГруппы       = ПараметрыФункции["GreenAPI_GroupID"];
    IDПользователя = "123123123@c.us";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ДобавитьУчастникаВГруппу(ПараметрыДоступа, IDГруппы, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ДобавитьУчастникаВГруппу");

КонецПроцедуры

Процедура GreenAPI_ИсключитьУчастникаГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDГруппы       = ПараметрыФункции["GreenAPI_GroupID"];
    IDПользователя = "123123123@c.us";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ИсключитьУчастникаГруппы(ПараметрыДоступа, IDГруппы, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ИсключитьУчастникаГруппы");

КонецПроцедуры

Процедура GreenAPI_НазначитьПраваАдминистратора(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDГруппы       = ПараметрыФункции["GreenAPI_GroupID"];
    IDПользователя = "123123123@c.us";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.НазначитьПраваАдминистратора(ПараметрыДоступа, IDГруппы, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "НазначитьПраваАдминистратора");

КонецПроцедуры

Процедура GreenAPI_ОтозватьПраваАдминистратора(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDГруппы       = ПараметрыФункции["GreenAPI_GroupID"];
    IDПользователя = "123123123@c.us";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ОтозватьПраваАдминистратора(ПараметрыДоступа, IDГруппы, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтозватьПраваАдминистратора");

КонецПроцедуры

Процедура GreenAPI_УстановитьКартинкуГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    Картинка = ПараметрыФункции["Picture"]; // URL, Путь или Двоичные данные
    IDГруппы = ПараметрыФункции["GreenAPI_GroupID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.УстановитьКартинкуГруппы(ПараметрыДоступа, IDГруппы, Картинка);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "УстановитьКартинкуГруппы");

КонецПроцедуры

Процедура GreenAPI_ОтправитьТекстовоеСообщение(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата = ПараметрыФункции["GreenAPI_TestGroupID"];
    Текст  = "Новое сообщение";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ОтправитьТекстовоеСообщение(ПараметрыДоступа, IDЧата, Текст);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьТекстовоеСообщение", , ПараметрыФункции);

    IDСообщения = Результат["idMessage"];
    Результат   = OPI_GreenAPI.ОтправитьТекстовоеСообщение(ПараметрыДоступа, IDЧата, Текст, IDСообщения);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьТекстовоеСообщение", "Цитата");

КонецПроцедуры

Процедура GreenAPI_УдалитьСообщение(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата      = ПараметрыФункции["GreenAPI_TestGroupID"];
    IDСообщения = ПараметрыФункции["GreenAPI_MessageID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.УдалитьСообщение(ПараметрыДоступа, IDЧата, IDСообщения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "УдалитьСообщение");

КонецПроцедуры

Процедура GreenAPI_ИзменитьТекстСообщения(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата      = ПараметрыФункции["GreenAPI_TestGroupID"];
    IDСообщения = ПараметрыФункции["GreenAPI_MessageID"];
    Текст       = "Новый текст сообщения";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ИзменитьТекстСообщения(ПараметрыДоступа, IDЧата, IDСообщения, Текст);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ИзменитьТекстСообщения");

КонецПроцедуры

Процедура GreenAPI_ОтправитьФайл(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    Файл     = ПараметрыФункции["Picture"]; // URL, Путь или Двоичные данные
    ИмяФайла = "photo.jpg";
    IDЧата   = ПараметрыФункции["GreenAPI_TestGroupID"];
    Описание = "Описание файла";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ОтправитьФайл(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьФайл", , ПараметрыФункции);

    Файл     = ПараметрыФункции["Video"];
    ИмяФайла = "vid.mp4";

    IDСообщения = Результат["idMessage"];
    Результат   = OPI_GreenAPI.ОтправитьФайл(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание, IDСообщения);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьФайл", "Цитата");

КонецПроцедуры

Процедура GreenAPI_ОтправитьФайлПоURL(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    Файл     = ПараметрыФункции["Picture"];
    ИмяФайла = "photo.jpg";
    IDЧата   = ПараметрыФункции["GreenAPI_TestGroupID"];
    Описание = "Описание файла";

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ОтправитьФайлПоURL(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьФайлПоURL", , ПараметрыФункции);

    Файл     = ПараметрыФункции["Video"];
    ИмяФайла = "vid.mp4";

    IDСообщения = Результат["idMessage"];
    Результат   = OPI_GreenAPI.ОтправитьФайлПоURL(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание, IDСообщения);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьФайлПоURL", "Цитата");

КонецПроцедуры

Процедура GreenAPI_ОтправитьОпрос(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата = ПараметрыФункции["GreenAPI_TestGroupID"];
    Текст  = "Какой ваш любимый цвет?";

    Варианты = Новый Массив;
    Варианты.Добавить("Красный");
    Варианты.Добавить("Желтый");
    Варианты.Добавить("Зеленый");

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ОтправитьОпрос(ПараметрыДоступа, IDЧата, Текст, Варианты);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьОпрос", , ПараметрыФункции);

    IDСообщения = Результат["idMessage"];
    Результат   = OPI_GreenAPI.ОтправитьОпрос(ПараметрыДоступа, IDЧата, Текст, Варианты, Истина, IDСообщения);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьОпрос", "Цитата");

КонецПроцедуры

Процедура GreenAPI_ПолучитьОписаниеЛокации(ПараметрыФункции)

    Широта   = 53.908522;
    Долгота  = 27.574821;
    Адрес    = "Площадь Победы, Минск";
    Название = "пл. Победы";

    Результат = OPI_GreenAPI.ПолучитьОписаниеЛокации(Широта, Долгота, Адрес, Название);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьОписаниеЛокации");

КонецПроцедуры

Процедура GreenAPI_ОтправитьЛокацию(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата = ПараметрыФункции["GreenAPI_TestGroupID"];

    Широта   = 53.908522;
    Долгота  = 27.574821;
    Адрес    = "Площадь Победы, Минск";
    Название = "пл. Победы";

    Локация = OPI_GreenAPI.ПолучитьОписаниеЛокации(Широта, Долгота, Адрес, Название);

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ОтправитьЛокацию(ПараметрыДоступа, IDЧата, Локация);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьЛокацию", , ПараметрыФункции);

    IDСообщения = Результат["idMessage"];
    Локация     = OPI_GreenAPI.ПолучитьОписаниеЛокации(Широта, Долгота);
    Результат   = OPI_GreenAPI.ОтправитьЛокацию(ПараметрыДоступа, IDЧата, Локация, IDСообщения);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьЛокацию", "Цитата");

КонецПроцедуры

Процедура GreenAPI_ПолучитьОписаниеКонтакта(ПараметрыФункции)

    Телефон  = 79001234568;
    Имя      = "Артем";
    Фамилия  = "Евпаторийский";
    Отчество = "Петрович";
    Компания = "Велосипед";

    Результат = OPI_GreenAPI.ПолучитьОписаниеКонтакта(Телефон, Имя, Фамилия, Отчество, Компания);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьОписаниеКонтакта");

КонецПроцедуры

Процедура GreenAPI_ОтправитьКонтакт(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата = ПараметрыФункции["GreenAPI_TestGroupID"];

    Телефон  = 79001234568;
    Имя      = "Артем";
    Фамилия  = "Евпаторийский";
    Отчество = "Петрович";
    Компания = "Велосипед";

    Контакт = OPI_GreenAPI.ПолучитьОписаниеКонтакта(Телефон, Имя, Фамилия, Отчество, Компания);

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ОтправитьКонтакт(ПараметрыДоступа, IDЧата, Контакт);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьКонтакт", , ПараметрыФункции);

    IDСообщения = Результат["idMessage"];
    Контакт     = OPI_GreenAPI.ПолучитьОписаниеКонтакта(Телефон, , , , Компания);
    Результат   = OPI_GreenAPI.ОтправитьКонтакт(ПараметрыДоступа, IDЧата, Контакт, IDСообщения);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОтправитьКонтакт", "Цитата");

КонецПроцедуры

Процедура GreenAPI_ПереслатьСообщения(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    Откуда = "11001234567@c.us";
    Откуда = ПараметрыФункции["GreenAPI_TestGroupID"]; // SKIP
    Куда   = ПараметрыФункции["GreenAPI_TestGroupID"];

    Сообщение = ПараметрыФункции["GreenAPI_MessageID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПереслатьСообщения(ПараметрыДоступа, Откуда, Куда, Сообщение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПереслатьСообщения");

КонецПроцедуры

Процедура GreenAPI_ПолучитьУведомление(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьУведомление(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьУведомление", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenAPI_УдалитьУведомлениеИзОчереди(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDДоставки = ПараметрыФункции["GreenAPI_ReceiptID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.УдалитьУведомлениеИзОчереди(ПараметрыДоступа, IDДоставки);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "УдалитьУведомлениеИзОчереди");

КонецПроцедуры

Процедура GreenAPI_СкачатьФайлСообщения(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата      = ПараметрыФункции["GreenAPI_TestGroupID"];
    IDСообщения = ПараметрыФункции["GreenAPI_FileMessageID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.СкачатьФайлСообщения(ПараметрыДоступа, IDЧата, IDСообщения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "СкачатьФайлСообщения");

КонецПроцедуры

Процедура GreenAPI_УстановитьОтметкуПрочтения(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата      = ПараметрыФункции["GreenAPI_TestGroupID"];
    IDСообщения = ПараметрыФункции["GreenAPI_FileMessageID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.УстановитьОтметкуПрочтения(ПараметрыДоступа, IDЧата, IDСообщения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "УстановитьОтметкуПрочтения");

КонецПроцедуры

Процедура GreenAPI_ПолучитьОчередьСообщений(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьОчередьСообщений(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьОчередьСообщений");

КонецПроцедуры

Процедура GreenAPI_ОчиститьОчередьСообщений(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ОчиститьОчередьСообщений(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ОчиститьОчередьСообщений");

КонецПроцедуры

Процедура GreenAPI_ПолучитьИсториюЧата(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата = ПараметрыФункции["GreenAPI_TestGroupID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьИсториюЧата(ПараметрыДоступа, IDЧата);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьИсториюЧата", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenAPI_ПолучитьСообщение(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата      = ПараметрыФункции["GreenAPI_TestGroupID"];
    IDСообщения = ПараметрыФункции["GreenAPI_MessageID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьСообщение(ПараметрыДоступа, IDЧата, IDСообщения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьСообщение", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenAPI_ПолучитьЖурналВходящихСообщений(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьЖурналВходящихСообщений(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьЖурналВходящихСообщений", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenAPI_ПолучитьЖурналИсходящихСообщений(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.ПолучитьЖурналИсходящихСообщений(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "ПолучитьЖурналИсходящихСообщений", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenAPI_АрхивироватьЧат(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата = ПараметрыФункции["GreenAPI_TestGroupID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    OPI_GreenAPI.РазархивироватьЧат(ПараметрыДоступа, IDЧата); // SKIP

    Результат = OPI_GreenAPI.АрхивироватьЧат(ПараметрыДоступа, IDЧата);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "АрхивироватьЧат");

КонецПроцедуры

Процедура GreenAPI_РазархивироватьЧат(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenAPI_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenAPI_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenAPI_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenAPI_Token"];

    IDЧата = ПараметрыФункции["GreenAPI_TestGroupID"];

    ПараметрыДоступа = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenAPI.РазархивироватьЧат(ПараметрыДоступа, IDЧата);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenAPI", "РазархивироватьЧат");

КонецПроцедуры

#КонецОбласти // GreenAPI

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#Region Alternate

Procedure GAPI_Account() Export
    GAPI_Аккаунт();
EndProcedure

Procedure GAPI_GroupManagement() Export
    GAPI_УправлениеГруппами();
EndProcedure

Procedure GAPI_MessageSending() Export
    GAPI_ОтправкаСообщений();
EndProcedure

Procedure GAPI_NotificationsReceiving() Export
    GAPI_ПолучениеУведомлений();
EndProcedure

Procedure GAPI_MessageQueue() Export
    GAPI_ОчередьСообщений();
EndProcedure

Procedure GAPI_MessageLogs() Export
    GAPI_ЖурналыСообщений();
EndProcedure

#EndRegion