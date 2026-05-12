// OneScript: ./OInt/tests/Modules/OPIt_GoogleSheets.os

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

    OPI_СписокТестовКлиентСервер.СформироватьТестыЯкс("GoogleSheets");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("GoogleSheets");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область GoogleSheets

Процедура ГТ_Авторизация() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ClientID"    , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ClientSecret", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Code"        , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Refresh"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ServiceData" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Access_Token"       , ПараметрыТеста);

    GoogleSheets_СформироватьСсылкуПолученияКода(ПараметрыТеста);
    GoogleSheets_ПолучитьТокенПоКоду(ПараметрыТеста);
    GoogleSheets_ОбновитьТокен(ПараметрыТеста);
    GoogleSheets_ПолучитьТокенServiceАккаунта(ПараметрыТеста);

КонецПроцедуры

Процедура ГТ_СоздатьТаблицу() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Token", ПараметрыТеста);

    GoogleSheets_СоздатьКнигу(ПараметрыТеста);
    GoogleSheets_ПолучитьКнигу(ПараметрыТеста);
    GoogleSheets_КопироватьЛист(ПараметрыТеста);
    GoogleSheets_ДобавитьЛист(ПараметрыТеста);
    GoogleSheets_УдалитьЛист(ПараметрыТеста);
    GoogleSheets_ИзменитьНаименованиеКниги(ПараметрыТеста);
    GoogleSheets_ПолучитьТаблицу(ПараметрыТеста);

    OPI_GoogleDrive.УдалитьОбъект(ПараметрыТеста["Google_Token"], ПараметрыТеста["GS_Spreadsheet"]);
    OPI_GoogleDrive.УдалитьОбъект(ПараметрыТеста["Google_Token"], ПараметрыТеста["GS_Spreadsheet2"]);

КонецПроцедуры

Процедура ГТ_ЗаполнитьОчиститьЯчейки() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Token", ПараметрыТеста);

    GoogleSheets_СоздатьКнигу(ПараметрыТеста);
    GoogleSheets_УстановитьЗначенияЯчеек(ПараметрыТеста);
    GoogleSheets_ПолучитьЗначенияЯчеек(ПараметрыТеста);
    GoogleSheets_ОчиститьЯчейки(ПараметрыТеста);

    OPI_GoogleDrive.УдалитьОбъект(ПараметрыТеста["Google_Token"], ПараметрыТеста["GS_Spreadsheet"]);
    OPI_GoogleDrive.УдалитьОбъект(ПараметрыТеста["Google_Token"], ПараметрыТеста["GS_Spreadsheet2"]);

КонецПроцедуры

#КонецОбласти // GoogleSheets

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область GoogleSheets

Процедура GoogleSheets_СформироватьСсылкуПолученияКода(ПараметрыФункции)

    ClientID  = ПараметрыФункции["Google_ClientID"];
    Результат = OPI_GoogleSheets.СформироватьСсылкуПолученияКода(ClientID);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "СформироватьСсылкуПолученияКода");

КонецПроцедуры

Процедура GoogleSheets_ПолучитьТокенПоКоду(ПараметрыФункции)

    ClientID     = ПараметрыФункции["Google_ClientID"];
    ClientSecret = ПараметрыФункции["Google_ClientSecret"];
    Code         = ПараметрыФункции["Google_Code"];

    Результат = OPI_GoogleSheets.ПолучитьТокенПоКоду(ClientID, ClientSecret, Code);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ПолучитьТокенПоКоду");

КонецПроцедуры

Процедура GoogleSheets_ОбновитьТокен(ПараметрыФункции)

    ClientID     = ПараметрыФункции["Google_ClientID"];
    ClientSecret = ПараметрыФункции["Google_ClientSecret"];
    RefreshToken = ПараметрыФункции["Google_Refresh"];

    Результат = OPI_GoogleSheets.ОбновитьТокен(ClientID, ClientSecret, RefreshToken);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ОбновитьТокен");

КонецПроцедуры

Процедура GoogleSheets_ПолучитьТокенServiceАккаунта(ПараметрыФункции)

    Данные = ПараметрыФункции["Google_ServiceData"]; // URL, двоичные данные, файл или коллекция

    Токен  = ПараметрыФункции["Access_Token"];  // SKIP
    Данные = OPI_ЗапросыHTTP                    // SKIP
        .НовыйЗапрос()                          // SKIP
        .Инициализировать(Данные)               // SKIP
        .ДобавитьBearerАвторизацию(Токен)       // SKIP
        .ОбработатьЗапрос("GET")                // SKIP
        .ВернутьОтветКакДвоичныеДанные();       // SKIP

    ОбластиДействия = Новый Массив;
    ОбластиДействия.Добавить("https://www.googleapis.com/auth/calendar");
    ОбластиДействия.Добавить("https://www.googleapis.com/auth/drive");
    ОбластиДействия.Добавить("https://www.googleapis.com/auth/spreadsheets");

    Результат = OPI_GoogleSheets.ПолучитьТокенServiceАккаунта(Данные, ОбластиДействия);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ПолучитьТокенServiceАккаунта");

КонецПроцедуры

Процедура GoogleSheets_СоздатьКнигу(ПараметрыФункции)

    Токен        = ПараметрыФункции["Google_Token"];
    Наименование = "Тестовая таблица";

    МассивЛистов = Новый Массив;
    МассивЛистов.Добавить("Лист1");
    МассивЛистов.Добавить("Лист2");

    Результат = OPI_GoogleSheets.СоздатьКнигу(Токен, Наименование, МассивЛистов);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "СоздатьКнигу", , ПараметрыФункции, Наименование, МассивЛистов);

    Наименование = "Тестовая таблица (доп.)";
    Результат    = OPI_GoogleSheets.СоздатьКнигу(Токен, Наименование, МассивЛистов);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "СоздатьКнигу", "Дополнительно", ПараметрыФункции, Наименование);

КонецПроцедуры

Процедура GoogleSheets_ПолучитьКнигу(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GS_Spreadsheet"];

    Результат = OPI_GoogleSheets.ПолучитьКнигу(Токен, Идентификатор);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ПолучитьКнигу");

КонецПроцедуры

Процедура GoogleSheets_КопироватьЛист(ПараметрыФункции)

    Токен  = ПараметрыФункции["Google_Token"];
    Откуда = ПараметрыФункции["GS_Spreadsheet"];
    Куда   = ПараметрыФункции["GS_Spreadsheet2"];
    Лист   = ПараметрыФункции["GS_Sheet"];

    Результат = OPI_GoogleSheets.КопироватьЛист(Токен, Откуда, Куда, Лист);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "КопироватьЛист");

КонецПроцедуры

Процедура GoogleSheets_ДобавитьЛист(ПараметрыФункции)

    Токен        = ПараметрыФункции["Google_Token"];
    Книга        = ПараметрыФункции["GS_Spreadsheet"];
    Наименование = "Тестовый лист";

    Результат = OPI_GoogleSheets.ДобавитьЛист(Токен, Книга, Наименование);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ДобавитьЛист");

КонецПроцедуры

Процедура GoogleSheets_УдалитьЛист(ПараметрыФункции)

    Токен = ПараметрыФункции["Google_Token"];
    Книга = ПараметрыФункции["GS_Spreadsheet"];
    Лист  = ПараметрыФункции["GS_Sheet"];

    Результат = OPI_GoogleSheets.УдалитьЛист(Токен, Книга, Лист);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "УдалитьЛист", , Книга);

КонецПроцедуры

Процедура GoogleSheets_ИзменитьНаименованиеКниги(ПараметрыФункции)

    Токен        = ПараметрыФункции["Google_Token"];
    Книга        = ПараметрыФункции["GS_Spreadsheet"];
    Наименование = "Тестовая таблица (изм.)";

    Результат = OPI_GoogleSheets.ИзменитьНаименованиеКниги(Токен, Книга, Наименование);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ИзменитьНаименованиеКниги", , Книга);

КонецПроцедуры

Процедура GoogleSheets_ПолучитьТаблицу(ПараметрыФункции)

    Токен = ПараметрыФункции["Google_Token"];
    Книга = ПараметрыФункции["GS_Spreadsheet"];

    Результат = OPI_GoogleSheets.ПолучитьКнигу(Токен, Книга);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ПолучитьТаблицу");

КонецПроцедуры

Процедура GoogleSheets_УстановитьЗначенияЯчеек(ПараметрыФункции)

    Токен = ПараметрыФункции["Google_Token"];
    Книга = ПараметрыФункции["GS_Spreadsheet"];
    Лист  = "Лист2";

    СоответствиеЗначений = Новый Соответствие;
    СоответствиеЗначений.Вставить("A1", "Это A1");
    СоответствиеЗначений.Вставить("A2", "Это A2");
    СоответствиеЗначений.Вставить("B2", "Это B2");
    СоответствиеЗначений.Вставить("B3", "Это B3");
    СоответствиеЗначений.Вставить("A3", "Это A3");
    СоответствиеЗначений.Вставить("A4", "Это A4");
    СоответствиеЗначений.Вставить("B1", "Это B1");
    СоответствиеЗначений.Вставить("B4", "Это B4");

    Результат = OPI_GoogleSheets.УстановитьЗначенияЯчеек(Токен, Книга, СоответствиеЗначений, Лист);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "УстановитьЗначенияЯчеек", , СоответствиеЗначений.Количество());

КонецПроцедуры

Процедура GoogleSheets_ПолучитьЗначенияЯчеек(ПараметрыФункции)

    Токен = ПараметрыФункции["Google_Token"];
    Книга = ПараметрыФункции["GS_Spreadsheet"];
    Лист  = "Лист2";

    МассивЯчеек = Новый Массив;
    МассивЯчеек.Добавить("B2");
    МассивЯчеек.Добавить("A3");
    МассивЯчеек.Добавить("B4");

    Результат = OPI_GoogleSheets.ПолучитьЗначенияЯчеек(Токен, Книга, МассивЯчеек, Лист);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ПолучитьЗначенияЯчеек", , МассивЯчеек.Количество());

    Результат = OPI_GoogleSheets.ПолучитьЗначенияЯчеек(Токен, Книга, , Лист);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ПолучитьЗначенияЯчеек", "Все", Книга);

КонецПроцедуры

Процедура GoogleSheets_ОчиститьЯчейки(ПараметрыФункции)

    Токен = ПараметрыФункции["Google_Token"];
    Книга = ПараметрыФункции["GS_Spreadsheet"];
    Лист  = "Лист2";

    МассивЯчеек = Новый Массив;
    МассивЯчеек.Добавить("B2");
    МассивЯчеек.Добавить("A3");
    МассивЯчеек.Добавить("B4");

    Результат = OPI_GoogleSheets.ОчиститьЯчейки(Токен, Книга, МассивЯчеек, Лист);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleSheets", "ОчиститьЯчейки", , МассивЯчеек.Количество());

КонецПроцедуры

#КонецОбласти // GoogleSheets

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли
