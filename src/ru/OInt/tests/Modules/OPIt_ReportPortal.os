// OneScript: ./OInt/tests/Modules/OPIt_ReportPortal.os

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

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("ReportPortal");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("ReportPortal");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область ReportPortal

Процедура RPortal_Авторизация() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_URL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_Login"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_Password", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_UserID"  , ПараметрыТеста);

    ReportPortal_ПолучитьВременныйТокен(ПараметрыТеста);
    ReportPortal_ПолучитьПостоянныйТокен(ПараметрыТеста);
    ReportPortal_УдалитьПостоянныйТокен(ПараметрыТеста);
    ReportPortal_ПолучитьТокеныПользователя(ПараметрыТеста);

КонецПроцедуры

Процедура RPortal_УправлениеТестами() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_TempToken", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_URL"      , ПараметрыТеста);

    ReportPortal_СоздатьЗапуск(ПараметрыТеста);
    ReportPortal_ПолучитьЗапуск(ПараметрыТеста);
    ReportPortal_ПолучитьЭлементыЗапуска(ПараметрыТеста);
    ReportPortal_ИзменитьЗапуск(ПараметрыТеста);
    ReportPortal_СоздатьЭлемент(ПараметрыТеста);
    ReportPortal_ПолучитьЭлемент(ПараметрыТеста);
    ReportPortal_ПолучитьЛогиЭлемента(ПараметрыТеста);
    ReportPortal_ИзменитьЭлемент(ПараметрыТеста);
    ReportPortal_ЗавершитьЭлемент(ПараметрыТеста);
    ReportPortal_ЗавершитьЗапуск(ПараметрыТеста);
    ReportPortal_УдалитьЭлемент(ПараметрыТеста);
    ReportPortal_ПолучитьОтчетЗапуска(ПараметрыТеста);
    ReportPortal_УдалитьЗапуск(ПараметрыТеста);
    ReportPortal_ПолучитьСтруктуруЗапуска(ПараметрыТеста);
    ReportPortal_ПолучитьСтруктуруЭлемента(ПараметрыТеста);
    ReportPortal_ПолучитьСтруктуруЗавершенияЭлемента(ПараметрыТеста);
    ReportPortal_ПолучитьСтруктуруЗавершенияЗапуска(ПараметрыТеста);

КонецПроцедуры

Процедура RPortal_ЗаписьЛогов() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_TempToken", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_URL"      , ПараметрыТеста);

    ReportPortal_СоздатьЗапуск(ПараметрыТеста);
    ReportPortal_СоздатьЭлемент(ПараметрыТеста);

    ReportPortal_ЗаписатьЛог(ПараметрыТеста);
    ReportPortal_ПолучитьСтруктуруЛога(ПараметрыТеста);
    ReportPortal_ПолучитьЛог(ПараметрыТеста);
    ReportPortal_УдалитьЛог(ПараметрыТеста);

    ReportPortal_ЗавершитьЭлемент(ПараметрыТеста);
    ReportPortal_ЗавершитьЗапуск(ПараметрыТеста);

КонецПроцедуры

Процедура RPortal_УправлениеПроектами() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_TempToken", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_URL"      , ПараметрыТеста);

    ReportPortal_СоздатьПроект(ПараметрыТеста);
    ReportPortal_ПолучитьПроект(ПараметрыТеста);
    ReportPortal_ПолучитьПроекты(ПараметрыТеста);
    ReportPortal_ДобавитьПользователейВПроект(ПараметрыТеста);
    ReportPortal_ИсключитьПользователейИзПроекта(ПараметрыТеста);
    ReportPortal_УдалитьПроект(ПараметрыТеста);

КонецПроцедуры

Процедура RPortal_УправлениеПользователями() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_TempToken", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RPortal_URL"      , ПараметрыТеста);

    ReportPortal_СоздатьПользователя(ПараметрыТеста);
    ReportPortal_ПолучитьТекущегоПользователя(ПараметрыТеста);
    ReportPortal_ПолучитьПользователя(ПараметрыТеста);
    ReportPortal_ПолучитьПользователей(ПараметрыТеста);
    ReportPortal_ПолучитьПроектыПользователя(ПараметрыТеста);
    ReportPortal_ИзменитьПользователя(ПараметрыТеста);
    ReportPortal_УдалитьПользователя(ПараметрыТеста);
    ReportPortal_ПолучитьСтруктуруПользователя(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // ReportPortal

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область ReportPortal

Процедура ReportPortal_ПолучитьВременныйТокен(ПараметрыФункции)

    URL    = ПараметрыФункции["RPortal_URL"];
    Логин  = ПараметрыФункции["RPortal_Login"];
    Пароль = ПараметрыФункции["RPortal_Password"];

    Результат = OPI_ReportPortal.ПолучитьВременныйТокен(URL, Логин, Пароль);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьВременныйТокен", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_ПолучитьПостоянныйТокен(ПараметрыФункции)

    URL            = ПараметрыФункции["RPortal_URL"];
    Токен          = ПараметрыФункции["RPortal_TempToken"];
    IDПользователя = ПараметрыФункции["RPortal_UserID"];
    ИмяКлюча       = "test_key_2";

    Результат = OPI_ReportPortal.ПолучитьПостоянныйТокен(URL, Токен, IDПользователя, ИмяКлюча);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьПостоянныйТокен", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_УдалитьПостоянныйТокен(ПараметрыФункции)

    URL            = ПараметрыФункции["RPortal_URL"];
    Токен          = ПараметрыФункции["RPortal_TestApiKey"];
    IDПользователя = ПараметрыФункции["RPortal_UserID"];
    IDКлюча        = ПараметрыФункции["RPortal_TestKeyID"];

    Результат = OPI_ReportPortal.УдалитьПостоянныйТокен(URL, Токен, IDПользователя, IDКлюча);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "УдалитьПостоянныйТокен");

КонецПроцедуры

Процедура ReportPortal_ПолучитьТокеныПользователя(ПараметрыФункции)

    URL            = ПараметрыФункции["RPortal_URL"];
    Токен          = ПараметрыФункции["RPortal_TempToken"];
    IDПользователя = ПараметрыФункции["RPortal_UserID"];

    Результат = OPI_ReportPortal.ПолучитьТокеныПользователя(URL, Токен, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьТокеныПользователя");

КонецПроцедуры

Процедура ReportPortal_СоздатьЗапуск(ПараметрыФункции)

    URL    = ПараметрыФункции["RPortal_URL"];
    Токен  = ПараметрыФункции["RPortal_TempToken"];
    Проект = "Test";

    ДатаНачала = Дата("20260101100000");

    СтруктураЗапуска = Новый Структура;
    СтруктураЗапуска.Вставить("name"       , "Test");
    СтруктураЗапуска.Вставить("startTime"  , ДатаНачала);
    СтруктураЗапуска.Вставить("description", "Test launch");

    Результат = OPI_ReportPortal.СоздатьЗапуск(URL, Токен, Проект, СтруктураЗапуска);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "СоздатьЗапуск", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_ЗавершитьЗапуск(ПараметрыФункции)

    URL       = ПараметрыФункции["RPortal_URL"];
    Токен     = ПараметрыФункции["RPortal_TempToken"];
    IDЗапуска = ПараметрыФункции["RPortal_TestLaunch"];
    Проект    = "Test";

    ДатаЗавершения      = Дата("20260101200000");
    СтруктураЗавершения = OPI_ReportPortal.ПолучитьСтруктуруЗавершенияЗапуска(ДатаЗавершения
        , "passed"
        , "Updated launch description");

    Результат = OPI_ReportPortal.ЗавершитьЗапуск(URL, Токен, Проект, IDЗапуска, СтруктураЗавершения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ЗавершитьЗапуск");

КонецПроцедуры

Процедура ReportPortal_СоздатьЭлемент(ПараметрыФункции)

    URL       = ПараметрыФункции["RPortal_URL"];
    Токен     = ПараметрыФункции["RPortal_TempToken"];
    IDЗапуска = ПараметрыФункции["RPortal_TestLaunch"];
    Проект    = "Test";

    ДатаНачала = Дата("20260101100000");

    СтруктураЭлемента = Новый Структура;
    СтруктураЭлемента.Вставить("name"       , "Test");
    СтруктураЭлемента.Вставить("startTime"  , ДатаНачала);
    СтруктураЭлемента.Вставить("type"       , "test");
    СтруктураЭлемента.Вставить("description", "Test launch");
    СтруктураЭлемента.Вставить("launchUuid" , IDЗапуска);

    Результат = OPI_ReportPortal.СоздатьЭлемент(URL, Токен, Проект, СтруктураЭлемента);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "СоздатьЭлемент", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_ЗавершитьЭлемент(ПараметрыФункции)

    URL        = ПараметрыФункции["RPortal_URL"];
    Токен      = ПараметрыФункции["RPortal_TempToken"];
    IDЭлемента = ПараметрыФункции["RPortal_TestItem"];
    Проект     = "Test";

    ДатаЗавершения = Дата("20260101200000");

    СтруктураЗавершения = Новый Структура;
    СтруктураЗавершения.Вставить("endTime", ДатаЗавершения);
    СтруктураЗавершения.Вставить("status" , "passed");

    Результат = OPI_ReportPortal.ЗавершитьЭлемент(URL, Токен, Проект, IDЭлемента, СтруктураЗавершения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ЗавершитьЭлемент");

КонецПроцедуры

Процедура ReportPortal_ПолучитьСтруктуруЗапуска(ПараметрыФункции)

    Результат = OPI_ReportPortal.ПолучитьСтруктуруЗапуска();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруЗапуска");

    Результат = OPI_ReportPortal.ПолучитьСтруктуруЗапуска(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруЗапуска", "Пустая");

КонецПроцедуры

Процедура ReportPortal_ПолучитьСтруктуруЭлемента(ПараметрыФункции)

    Результат = OPI_ReportPortal.ПолучитьСтруктуруЭлемента();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруЭлемента");

    Результат = OPI_ReportPortal.ПолучитьСтруктуруЭлемента(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруЭлемента", "Пустая");

КонецПроцедуры

Процедура ReportPortal_ПолучитьСтруктуруЗавершенияЭлемента(ПараметрыФункции)

    Результат = OPI_ReportPortal.ПолучитьСтруктуруЗавершенияЭлемента();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруЗавершенияЭлемента");

    Результат = OPI_ReportPortal.ПолучитьСтруктуруЗавершенияЭлемента(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруЗавершенияЭлемента", "Пустая");

КонецПроцедуры

Процедура ReportPortal_ПолучитьСтруктуруЗавершенияЗапуска(ПараметрыФункции)

    Время    = Дата("20260101100000");
    Статус   = "passed";
    Описание = "Some test";
    Атрибуты = "key1:value1, key2:value2";

    Результат = OPI_ReportPortal.ПолучитьСтруктуруЗавершенияЗапуска(Время, Статус, Описание, Атрибуты);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруЗавершенияЗапуска");

КонецПроцедуры

Процедура ReportPortal_ЗаписатьЛог(ПараметрыФункции)

    URL        = ПараметрыФункции["RPortal_URL"];
    Токен      = ПараметрыФункции["RPortal_TempToken"];
    IDЗапуска  = ПараметрыФункции["RPortal_TestLaunch"];
    IDЭлемента = ПараметрыФункции["RPortal_TestItem"];
    Проект     = "Test";
    Время      = Дата("20260101100010");
    Текст      = "Some log 1";

    СтруктураЛога = OPI_ReportPortal.ПолучитьСтруктуруЛога(IDЗапуска, IDЭлемента, Время, Текст);
    Результат     = OPI_ReportPortal.ЗаписатьЛог(URL, Токен, Проект, СтруктураЛога);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ЗаписатьЛог", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_ПолучитьСтруктуруЛога(ПараметрыФункции)

    URL        = ПараметрыФункции["RPortal_URL"];
    Токен      = ПараметрыФункции["RPortal_TempToken"];
    IDЗапуска  = ПараметрыФункции["RPortal_TestLaunch"];
    IDЭлемента = ПараметрыФункции["RPortal_TestItem"];
    Проект     = "Test";
    Время      = Дата("20260101100010");
    Текст      = "Some log";

    Результат = OPI_ReportPortal.ПолучитьСтруктуруЛога(IDЗапуска, IDЭлемента, Время, Текст);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруЛога");

КонецПроцедуры

Процедура ReportPortal_ПолучитьЛог(ПараметрыФункции)

    URL      = ПараметрыФункции["RPortal_URL"];
    Токен    = ПараметрыФункции["RPortal_TempToken"];
    UUIDЛога = ПараметрыФункции["RPortal_TestLog"];
    Проект   = "Test";

    Результат = OPI_ReportPortal.ПолучитьЛог(URL, Токен, Проект, UUIDЛога);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьЛог", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_УдалитьЛог(ПараметрыФункции)

    URL    = ПараметрыФункции["RPortal_URL"];
    Токен  = ПараметрыФункции["RPortal_TempToken"];
    IDЛога = ПараметрыФункции["RPortal_TestLogId"];
    Проект = "Test";

    Результат = OPI_ReportPortal.УдалитьЛог(URL, Токен, Проект, IDЛога);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "УдалитьЛог");

КонецПроцедуры

Процедура ReportPortal_СоздатьПроект(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];
    Имя   = "testproject";

    Результат = OPI_ReportPortal.СоздатьПроект(URL, Токен, Имя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "СоздатьПроект", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_УдалитьПроект(ПараметрыФункции)

    URL       = ПараметрыФункции["RPortal_URL"];
    Токен     = ПараметрыФункции["RPortal_TempToken"];
    IDПроекта = ПараметрыФункции["RPortal_TestProject"];

    Результат = OPI_ReportPortal.УдалитьПроект(URL, Токен, IDПроекта);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "УдалитьПроект");

КонецПроцедуры

Процедура ReportPortal_ПолучитьПроект(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];
    Имя   = "TestProject";

    Результат = OPI_ReportPortal.ПолучитьПроект(URL, Токен, Имя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьПроект");

КонецПроцедуры

Процедура ReportPortal_ПолучитьПроекты(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];

    Результат = OPI_ReportPortal.ПолучитьПроекты(URL, Токен);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьПроекты");

КонецПроцедуры

Процедура ReportPortal_ДобавитьПользователейВПроект(ПараметрыФункции)

    URL        = ПараметрыФункции["RPortal_URL"];
    Токен      = ПараметрыФункции["RPortal_TempToken"];
    ИмяПроекта = "TestProject";

    СписокПользователей = Новый Соответствие;
    СписокПользователей.Вставить("default", "MEMBER");

    Результат = OPI_ReportPortal.ДобавитьПользователейВПроект(URL, Токен, ИмяПроекта, СписокПользователей);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ДобавитьПользователейВПроект");

КонецПроцедуры

Процедура ReportPortal_ИсключитьПользователейИзПроекта(ПараметрыФункции)

    URL        = ПараметрыФункции["RPortal_URL"];
    Токен      = ПараметрыФункции["RPortal_TempToken"];
    ИмяПроекта = "TestProject";

    МассивПользователей = Новый Массив;
    МассивПользователей.Добавить("default");

    Результат = OPI_ReportPortal.ИсключитьПользователейИзПроекта(URL, Токен, ИмяПроекта, МассивПользователей);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ИсключитьПользователейИзПроекта");

КонецПроцедуры

Процедура ReportPortal_ПолучитьЗапуск(ПараметрыФункции)

    URL         = ПараметрыФункции["RPortal_URL"];
    Токен       = ПараметрыФункции["RPortal_TempToken"];
    UUIDЗапуска = ПараметрыФункции["RPortal_TestLaunch"];
    Проект      = "Test";

    Результат = OPI_ReportPortal.ПолучитьЗапуск(URL, Токен, Проект, UUIDЗапуска);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьЗапуск", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_ПолучитьЭлементыЗапуска(ПараметрыФункции)

    URL       = ПараметрыФункции["RPortal_URL"];
    Токен     = ПараметрыФункции["RPortal_TempToken"];
    IDЗапуска = ПараметрыФункции["RPortal_TestLaunchId"];
    Проект    = "Test";

    Результат = OPI_ReportPortal.ПолучитьЭлементыЗапуска(URL, Токен, Проект, IDЗапуска);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьЭлементыЗапуска");

КонецПроцедуры

Процедура ReportPortal_ПолучитьЭлемент(ПараметрыФункции)

    URL          = ПараметрыФункции["RPortal_URL"];
    Токен        = ПараметрыФункции["RPortal_TempToken"];
    UUIDЭлемента = ПараметрыФункции["RPortal_TestItem"];
    Проект       = "Test";

    Результат = OPI_ReportPortal.ПолучитьЭлемент(URL, Токен, Проект, UUIDЭлемента);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьЭлемент", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_ПолучитьЛогиЭлемента(ПараметрыФункции)

    URL        = ПараметрыФункции["RPortal_URL"];
    Токен      = ПараметрыФункции["RPortal_TempToken"];
    IDЭлемента = ПараметрыФункции["RPortal_TestItemId"];
    Проект     = "Test";

    Результат = OPI_ReportPortal.ПолучитьЛогиЭлемента(URL, Токен, Проект, IDЭлемента);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьЛогиЭлемента");

КонецПроцедуры

Процедура ReportPortal_ИзменитьЗапуск(ПараметрыФункции)

    URL       = ПараметрыФункции["RPortal_URL"];
    Токен     = ПараметрыФункции["RPortal_TempToken"];
    IDЗапуска = ПараметрыФункции["RPortal_TestLaunchId"];
    Проект    = "Test";

    СтруктураЗапуска = Новый Структура;
    СтруктураЗапуска.Вставить("description", "New description");

    Результат = OPI_ReportPortal.ИзменитьЗапуск(URL, Токен, Проект, IDЗапуска, СтруктураЗапуска);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ИзменитьЗапуск");

КонецПроцедуры

Процедура ReportPortal_ИзменитьЭлемент(ПараметрыФункции)

    URL        = ПараметрыФункции["RPortal_URL"];
    Токен      = ПараметрыФункции["RPortal_TempToken"];
    IDЭлемента = ПараметрыФункции["RPortal_TestItemId"];
    Проект     = "Test";

    СтруктураЗапуска = Новый Структура;
    СтруктураЗапуска.Вставить("description", "New description");

    Результат = OPI_ReportPortal.ИзменитьЭлемент(URL, Токен, Проект, IDЭлемента, СтруктураЗапуска);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ИзменитьЭлемент");

КонецПроцедуры

Процедура ReportPortal_УдалитьЗапуск(ПараметрыФункции)

    URL       = ПараметрыФункции["RPortal_URL"];
    Токен     = ПараметрыФункции["RPortal_TempToken"];
    IDЗапуска = ПараметрыФункции["RPortal_TestLaunchId"];
    Проект    = "Test";

    Результат = OPI_ReportPortal.УдалитьЗапуск(URL, Токен, Проект, IDЗапуска);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "УдалитьЗапуск");

КонецПроцедуры

Процедура ReportPortal_УдалитьЭлемент(ПараметрыФункции)

    URL        = ПараметрыФункции["RPortal_URL"];
    Токен      = ПараметрыФункции["RPortal_TempToken"];
    IDЭлемента = ПараметрыФункции["RPortal_TestItemId"];
    Проект     = "Test";

    Результат = OPI_ReportPortal.УдалитьЭлемент(URL, Токен, Проект, IDЭлемента);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "УдалитьЭлемент");

КонецПроцедуры

Процедура ReportPortal_ПолучитьОтчетЗапуска(ПараметрыФункции)

    URL       = ПараметрыФункции["RPortal_URL"];
    Токен     = ПараметрыФункции["RPortal_TempToken"];
    IDЗапуска = ПараметрыФункции["RPortal_TestLaunchId"];
    Проект    = "Test";

    Результат = OPI_ReportPortal.ПолучитьОтчетЗапуска(URL, Токен, Проект, IDЗапуска, "html");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьОтчетЗапуска");

КонецПроцедуры

Процедура ReportPortal_СоздатьПользователя(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];
    Имя   = "testproject";

    СтруктураПользователя = Новый Структура;
    СтруктураПользователя.Вставить("active"        , Истина);
    СтруктураПользователя.Вставить("login"         , "test");
    СтруктураПользователя.Вставить("password"      , "G00d_Pass");
    СтруктураПользователя.Вставить("fullName"      , "Test User");
    СтруктураПользователя.Вставить("email"         , "test@example.com");
    СтруктураПользователя.Вставить("accountRole"   , "USER");
    СтруктураПользователя.Вставить("projectRole"   , "MEMBER");
    СтруктураПользователя.Вставить("defaultProject", "test");

    Результат = OPI_ReportPortal.СоздатьПользователя(URL, Токен, СтруктураПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "СоздатьПользователя", , ПараметрыФункции);

КонецПроцедуры

Процедура ReportPortal_УдалитьПользователя(ПараметрыФункции)

    URL            = ПараметрыФункции["RPortal_URL"];
    Токен          = ПараметрыФункции["RPortal_TempToken"];
    IDПользователя = ПараметрыФункции["RPortal_TestUser"];

    Результат = OPI_ReportPortal.УдалитьПользователя(URL, Токен, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "УдалитьПользователя");

КонецПроцедуры

Процедура ReportPortal_ПолучитьСтруктуруПользователя(ПараметрыФункции)

    Результат = OPI_ReportPortal.ПолучитьСтруктуруПользователя();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруПользователя");

    Результат = OPI_ReportPortal.ПолучитьСтруктуруПользователя(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьСтруктуруПользователя", "Пустая");

КонецПроцедуры

Процедура ReportPortal_ИзменитьПользователя(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];
    Логин = "test";

    СтруктураПользователя = Новый Структура;
    СтруктураПользователя.Вставить("fullName", "Updated Test User");
    СтруктураПользователя.Вставить("email"   , "updated@example.com");

    Результат = OPI_ReportPortal.ИзменитьПользователя(URL, Токен, Логин, СтруктураПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ИзменитьПользователя");

КонецПроцедуры

Процедура ReportPortal_ПолучитьТекущегоПользователя(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];

    Результат = OPI_ReportPortal.ПолучитьТекущегоПользователя(URL, Токен);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьТекущегоПользователя");

КонецПроцедуры

Процедура ReportPortal_ПолучитьПользователя(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];
    Логин = "test";

    Результат = OPI_ReportPortal.ПолучитьПользователя(URL, Токен, Логин);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьПользователя");

КонецПроцедуры

Процедура ReportPortal_ПолучитьПользователей(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];

    Результат = OPI_ReportPortal.ПолучитьПользователей(URL, Токен);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьПользователей");

КонецПроцедуры

Процедура ReportPortal_ПолучитьПроектыПользователя(ПараметрыФункции)

    URL   = ПараметрыФункции["RPortal_URL"];
    Токен = ПараметрыФункции["RPortal_TempToken"];
    Логин = "test";

    Результат = OPI_ReportPortal.ПолучитьПроектыПользователя(URL, Токен, Логин);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "ReportPortal", "ПолучитьПроектыПользователя");

КонецПроцедуры

#КонецОбласти // ReportPortal

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure RPortal_Authorization() Export
    RPortal_Авторизация();
EndProcedure

Procedure RPortal_TestManagement() Export
    RPortal_УправлениеТестами();
EndProcedure

Procedure RPortal_LogRecording() Export
    RPortal_ЗаписьЛогов();
EndProcedure

Procedure RPortal_ProjectManagement() Export
    RPortal_УправлениеПроектами();
EndProcedure

Procedure RPortal_UserManagement() Export
    RPortal_УправлениеПользователями();
EndProcedure

#EndRegion