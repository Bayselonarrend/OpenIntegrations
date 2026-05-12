// OneScript: ./OInt/tests/Modules/OPIt_GreenMax.os

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

// #Использовать oint
// #Использовать asserts
// #Использовать "internal"

#Если Не ВебКлиент Тогда

// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_СписокТестовКлиентСервер.СформироватьТестыЯкс("GreenMax");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("GreenMax");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область GreenMax

Процедура GMax_Аккаунт() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Phone"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_AccountID"  , ПараметрыТеста);
    //OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_TestGroupID", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"             , ПараметрыТеста);

    GreenMax_СформироватьПараметрыДоступа(ПараметрыТеста);
    // !DISABLED! GreenMax_РазлогинитьИнстанс(ПараметрыТеста);
    // !DISABLED! GreenMax_ПолучитьКодАвторизации(ПараметрыТеста);
    // !DISABLED! GreenMax_ОтправитьКодАвторизации(ПараметрыТеста);
    GreenMax_ПолучитьСостояниеИнстанса(ПараметрыТеста);
    GreenMax_ПолучитьНастройкиИнстанса(ПараметрыТеста);
    GreenMax_УстановитьНастройкиИнстанса(ПараметрыТеста);
    GreenMax_ПолучитьСтруктуруНастроекИнстанса(ПараметрыТеста);
    GreenMax_УстановитьКартинкуПрофиля(ПараметрыТеста);
    GreenMax_ПолучитьИнформациюОбАккаунте(ПараметрыТеста);
    GreenMax_ПроверитьАккаунт(ПараметрыТеста);
    GreenMax_ПолучитьСписокКонтактов(ПараметрыТеста);
    GreenMax_ПолучитьИнформациюОКонтакте(ПараметрыТеста);
    GreenMax_ПолучитьСписокЧатов(ПараметрыТеста);
    GreenMax_ПолучитьАватарЧата(ПараметрыТеста);
    GreenMax_ПерезапуститьИнстанс(ПараметрыТеста);

КонецПроцедуры

Процедура GMax_РаботаСГруппами() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Phone"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_AccountID"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MainGroupID", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"             , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture3"            , ПараметрыТеста);

    GreenMax_ПолучитьСписокКонтактов(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_СоздатьГруппу(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ПолучитьИнформациюОГруппе(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ИзменитьИмяГруппы(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ИзменитьНастройкиГруппы(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_НазначитьПраваАдминистратора(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ОтозватьПраваАдминистратора(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_УдалитьУчастникаГруппы(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ДобавитьУчастникаГруппы(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_УстановитьКартинкуГруппы(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ВыйтиИзГруппы(ПараметрыТеста);
    GreenMax_ПолучитьСтруктуруНастроекГруппы(ПараметрыТеста);

КонецПроцедуры

Процедура GMax_ОтправкаСообщений() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Phone"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_AccountID"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"             , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Video"               , ПараметрыТеста);

    GreenMax_ПолучитьСписокКонтактов(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_СоздатьГруппу(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ОтправитьТекстовоеСообщение(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ОтправитьФайл(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ОтправитьФайлПоURL(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_УдалитьУчастникаГруппы(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ВыйтиИзГруппы(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);

КонецПроцедуры

Процедура GMax_Уведомления() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Phone"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_AccountID"  , ПараметрыТеста);

    GreenMax_ПолучитьУведомление(ПараметрыТеста);
    GreenMax_УдалитьУведомление(ПараметрыТеста);

КонецПроцедуры

Процедура GMax_ИсторияСообщений() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Phone"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_AccountID"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MainGroupID", ПараметрыТеста);

    GreenMax_ОтметитьСообщенияКакПрочитанные(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ПолучитьИсториюСообщенийЧата(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ПолучитьСообщениеЧата(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ПолучитьЖурналВходящихСообщений(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ПолучитьЖурналИсходящихСообщений(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);

КонецПроцедуры

Процедура GMax_Очереди() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_ApiURL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MediaURL"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_IdInstance" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Token"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_Phone"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_AccountID"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GreenMax_MainGroupID", ПараметрыТеста);

    GreenMax_ПолучитьКоличествоСообщенийКОтправке(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ПолучитьОчередьСообщенийКОтправке(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ОчиститьОчередьСообщенийКОтправке(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ПолучитьКоличествоВходящихУведомлений(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);
    GreenMax_ОчиститьОчередьВходящихУведомлений(ПараметрыТеста);
    OPI_Инструменты.Пауза(1);

КонецПроцедуры

#КонецОбласти // GreenMax

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область GreenMax

Процедура GreenMax_СформироватьПараметрыДоступа(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Результат = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "СформироватьПараметрыДоступа");

КонецПроцедуры

Процедура GreenMax_ПолучитьКодАвторизации(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    НомерТелефона = 441234567890;

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьКодАвторизации(ПараметрыДоступа, НомерТелефона);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьКодАвторизации");

КонецПроцедуры

Процедура GreenMax_РазлогинитьИнстанс(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.РазлогинитьИнстанс(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "РазлогинитьИнстанс");

КонецПроцедуры

Процедура GreenMax_ОтправитьКодАвторизации(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    КодАвторизации = 123456;

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ОтправитьКодАвторизации(ПараметрыДоступа, КодАвторизации);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОтправитьКодАвторизации");

КонецПроцедуры

Процедура GreenMax_ПолучитьСостояниеИнстанса(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьСостояниеИнстанса(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьСостояниеИнстанса");

КонецПроцедуры

Процедура GreenMax_ПерезапуститьИнстанс(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПерезапуститьИнстанс(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПерезапуститьИнстанс");

КонецПроцедуры

Процедура GreenMax_ПолучитьСтруктуруНастроекИнстанса(ПараметрыФункции)

    Результат = OPI_GreenMax.ПолучитьСтруктуруНастроекИнстанса();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьСтруктуруНастроекИнстанса");

    Результат = OPI_GreenMax.ПолучитьСтруктуруНастроекИнстанса(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMAx", "ПолучитьСтруктуруНастроекИнстанса", "Пустая");

КонецПроцедуры

Процедура GreenMax_ПолучитьНастройкиИнстанса(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьНастройкиИнстанса(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьНастройкиИнстанса", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_УстановитьНастройкиИнстанса(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    СтруктураНастроек = Новый Структура;
    СтруктураНастроек.Вставить("markIncomingMessagesReaded" , "no");
    СтруктураНастроек.Вставить("outgoingWebhook"            , "no");
    СтруктураНастроек.Вставить("outgoingAPIMessageWebhook"  , "yes");

    Результат = OPI_GreenMax.УстановитьНастройкиИнстанса(СтруктураНастроек, ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "УстановитьНастройкиИнстанса");

КонецПроцедуры

Процедура GreenMax_УстановитьКартинкуПрофиля(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Картинка = ПараметрыФункции["Picture"]; // URL, Путь или Двоичные данные

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.УстановитьКартинкуПрофиля(ПараметрыДоступа, Картинка);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "УстановитьКартинкуПрофиля");

КонецПроцедуры

Процедура GreenMax_ПолучитьИнформациюОбАккаунте(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьИнформациюОбАккаунте(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьИнформациюОбАккаунте");

КонецПроцедуры

Процедура GreenMax_ПроверитьАккаунт(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    НомерТелефона = 441234567890;
    НомерТелефона = ПараметрыФункции["GreenMax_Phone"]; // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПроверитьАккаунт(ПараметрыДоступа, НомерТелефона);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПроверитьАккаунт", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_ПолучитьСписокКонтактов(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Количество = 1;

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьСписокКонтактов(ПараметрыДоступа, Количество);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьСписокКонтактов", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_ПолучитьИнформациюОКонтакте(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDКонтакта = 87654321;
    IDКонтакта = ПараметрыФункции["GreenMax_ContactID"]; // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьИнформациюОКонтакте(ПараметрыДоступа, IDКонтакта);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьИнформациюОКонтакте");

КонецПроцедуры

Процедура GreenMax_ПолучитьСписокЧатов(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьСписокЧатов(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьСписокЧатов");

КонецПроцедуры

Процедура GreenMax_ПолучитьАватарЧата(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата = 87654321;
    IDЧата = ПараметрыФункции["GreenMax_ContactID"]; // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьАватарЧата(ПараметрыДоступа, IDЧата);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьАватарЧата");

КонецПроцедуры

Процедура GreenMax_СоздатьГруппу(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDПользователя = 87654321;
    Наименование   = "Новая группа";

    IDПользователя = ПараметрыФункции["GreenMax_ContactID"]; // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.СоздатьГруппу(ПараметрыДоступа, Наименование, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "СоздатьГруппу", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_ДобавитьУчастникаГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата      = 12345678;
    IDУчастника = 87654321;

    IDЧата      = ПараметрыФункции["GreenMax_GroupID"];   // SKIP
    IDУчастника = ПараметрыФункции["GreenMax_ContactID"]; // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ДобавитьУчастникаГруппы(ПараметрыДоступа, IDЧата, IDУчастника);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ДобавитьУчастникаГруппы");

    GreenMax_УдалитьУчастникаГруппы(ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_УдалитьУчастникаГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата      = 12345678;
    IDУчастника = 87654321;

    IDЧата      = ПараметрыФункции["GreenMax_GroupID"];   // SKIP
    IDУчастника = ПараметрыФункции["GreenMax_ContactID"]; // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.УдалитьУчастникаГруппы(ПараметрыДоступа, IDЧата, IDУчастника);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "УдалитьУчастникаГруппы");

КонецПроцедуры

Процедура GreenMax_ВыйтиИзГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата = 12345678;
    IDЧата = ПараметрыФункции["GreenMax_GroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ВыйтиИзГруппы(ПараметрыДоступа, IDЧата);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ВыйтиИзГруппы");

КонецПроцедуры

Процедура GreenMax_ИзменитьИмяГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Наименование = "Новое имя группы";
    IDЧата       = 12345678;
    IDЧата       = ПараметрыФункции["GreenMax_GroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ИзменитьИмяГруппы(ПараметрыДоступа, IDЧата, Наименование);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ИзменитьИмяГруппы");

КонецПроцедуры

Процедура GreenMax_ПолучитьИнформациюОГруппе(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата = 12345678;
    IDЧата = ПараметрыФункции["GreenMax_GroupID"]; // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьИнформациюОГруппе(ПараметрыДоступа, IDЧата);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьИнформациюОГруппе");

КонецПроцедуры

Процедура GreenMax_ИзменитьНастройкиГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата = 12345678;
    IDЧата = ПараметрыФункции["GreenMax_GroupID"]; // SKIP

    Настройки = Новый Структура;
    Настройки.Вставить("allowParticipantsEditGroupSettings"  , Истина);
    Настройки.Вставить("allowParticipantsPinMessages"        , Ложь);
    Настройки.Вставить("allowParticipantsAddMembers"         , Ложь);

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ИзменитьНастройкиГруппы(ПараметрыДоступа, IDЧата, Настройки);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ИзменитьНастройкиГруппы");

КонецПроцедуры

Процедура GreenMax_ПолучитьСтруктуруНастроекГруппы(ПараметрыФункции)

    Результат = OPI_GreenMax.ПолучитьСтруктуруНастроекГруппы();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьСтруктуруНастроекГруппы");

    Результат = OPI_GreenMax.ПолучитьСтруктуруНастроекГруппы(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьСтруктуруНастроекГруппы", "Пустая");

КонецПроцедуры

Процедура GreenMax_НазначитьПраваАдминистратора(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата      = 12345678;
    IDУчастника = 87654321;

    IDЧата      = ПараметрыФункции["GreenMax_MainGroupID"]; // SKIP
    IDУчастника = ПараметрыФункции["GreenMax_ContactID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.НазначитьПраваАдминистратора(ПараметрыДоступа, IDЧата, IDУчастника);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "НазначитьПраваАдминистратора");

КонецПроцедуры

Процедура GreenMax_ОтозватьПраваАдминистратора(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата      = 12345678;
    IDУчастника = 87654321;

    IDЧата      = ПараметрыФункции["GreenMax_MainGroupID"]; // SKIP
    IDУчастника = ПараметрыФункции["GreenMax_ContactID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ОтозватьПраваАдминистратора(ПараметрыДоступа, IDЧата, IDУчастника);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОтозватьПраваАдминистратора");

КонецПроцедуры

Процедура GreenMax_УстановитьКартинкуГруппы(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Картинка = ПараметрыФункции["Picture3"]; // URL, Путь или Двоичные данные
    IDЧата   = 12345678;

    IDЧата = ПараметрыФункции["GreenMax_GroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.УстановитьКартинкуГруппы(ПараметрыДоступа, IDЧата, Картинка);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "УстановитьКартинкуГруппы");

КонецПроцедуры

Процедура GreenMax_ОтправитьТекстовоеСообщение(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Текст  = "Текст сообщения";
    IDЧата = 12345678;
    Набор  = 2000;

    IDЧата = ПараметрыФункции["GreenMax_GroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ОтправитьТекстовоеСообщение(ПараметрыДоступа, IDЧата, Текст, Набор);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОтправитьТекстовоеСообщение", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_ОтправитьФайл(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Файл     = ПараметрыФункции["Picture"]; // URL, Путь или Двоичные данные
    ИмяФайла = "photo.jpg";
    IDЧата   = 12345678;
    Описание = "Описание файла";

    IDЧата = ПараметрыФункции["GreenMax_GroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ОтправитьФайл(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОтправитьФайл", , ПараметрыФункции);

    Файл     = ПараметрыФункции["Video"];
    ИмяФайла = "vid.mp4";

    IDСообщения = Результат["idMessage"];
    Результат   = OPI_GreenMax.ОтправитьФайл(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание, 1000, "video");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОтправитьФайл", "Видео");

КонецПроцедуры

Процедура GreenMax_ОтправитьФайлПоURL(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Файл     = ПараметрыФункции["Picture"];
    ИмяФайла = "photo.jpg";
    IDЧата   = 12345678;
    Описание = "Описание файла";

    IDЧата = ПараметрыФункции["GreenMax_GroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ОтправитьФайлПоURL(ПараметрыДоступа, IDЧата, Файл, ИмяФайла);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОтправитьФайлПоURL");

    Файл     = ПараметрыФункции["Video"];
    ИмяФайла = "vid.mp4";

    IDСообщения = Результат["idMessage"];
    Результат   = OPI_GreenMax.ОтправитьФайлПоURL(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание, 1000);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОтправитьФайлПоURL", "Ввод");

КонецПроцедуры

Процедура GreenMax_ПолучитьУведомление(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьУведомление(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьУведомление", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_УдалитьУведомление(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDУведомления = ПараметрыФункции["GreenMax_ReceiptID"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.УдалитьУведомление(ПараметрыДоступа, IDУведомления);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "УдалитьУведомление", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_ОтметитьСообщенияКакПрочитанные(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата = 12345678;

    IDЧата = ПараметрыФункции["GreenMax_MainGroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ОтметитьСообщенияКакПрочитанные(ПараметрыДоступа, IDЧата);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОтметитьСообщенияКакПрочитанные");

КонецПроцедуры

Процедура GreenMax_ПолучитьИсториюСообщенийЧата(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата     = 12345678;
    Количество = 3;

    IDЧата = ПараметрыФункции["GreenMax_MainGroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьИсториюСообщенийЧата(ПараметрыДоступа, IDЧата, Количество);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьИсториюСообщенийЧата", , ПараметрыФункции);

КонецПроцедуры

Процедура GreenMax_ПолучитьСообщениеЧата(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    IDЧата      = 12345678;
    IDСообщения = ПараметрыФункции["GreenMax_MainMessageID"];

    IDЧата = ПараметрыФункции["GreenMax_MainGroupID"];   // SKIP

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьСообщениеЧата(ПараметрыДоступа, IDЧата, IDСообщения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьСообщениеЧата", , IDСообщения);

КонецПроцедуры

Процедура GreenMax_ПолучитьЖурналВходящихСообщений(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Период = 30;

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьЖурналВходящихСообщений(ПараметрыДоступа, Период);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьЖурналВходящихСообщений");

КонецПроцедуры

Процедура GreenMax_ПолучитьЖурналИсходящихСообщений(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    Период = 30;

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьЖурналИсходящихСообщений(ПараметрыДоступа, Период);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьЖурналИсходящихСообщений");

КонецПроцедуры

Процедура GreenMax_ПолучитьКоличествоСообщенийКОтправке(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьКоличествоСообщенийКОтправке(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьКоличествоСообщенийКОтправке");

КонецПроцедуры

Процедура GreenMax_ПолучитьОчередьСообщенийКОтправке(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьОчередьСообщенийКОтправке(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьОчередьСообщенийКОтправке");

КонецПроцедуры

Процедура GreenMax_ОчиститьОчередьСообщенийКОтправке(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ОчиститьОчередьСообщенийКОтправке(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОчиститьОчередьСообщенийКОтправке");

КонецПроцедуры

Процедура GreenMax_ПолучитьКоличествоВходящихУведомлений(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ПолучитьКоличествоВходящихУведомлений(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ПолучитьКоличествоВходящихУведомлений");

КонецПроцедуры

Процедура GreenMax_ОчиститьОчередьВходящихУведомлений(ПараметрыФункции)

    ApiUrl           = ПараметрыФункции["GreenMax_ApiURL"];
    MediaUrl         = ПараметрыФункции["GreenMax_MediaURL"];
    IdInstance       = ПараметрыФункции["GreenMax_IdInstance"];
    ApiTokenInstance = ПараметрыФункции["GreenMax_Token"];

    ПараметрыДоступа = OPI_GreenMax.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Результат        = OPI_GreenMax.ОчиститьОчередьВходящихУведомлений(ПараметрыДоступа);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GreenMax", "ОчиститьОчередьВходящихУведомлений");

КонецПроцедуры

#КонецОбласти // GreenMax

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли
