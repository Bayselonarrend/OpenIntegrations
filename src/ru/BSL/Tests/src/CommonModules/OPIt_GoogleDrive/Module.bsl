// OneScript: ./OInt/tests/Modules/OPIt_GoogleDrive.os

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

// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_СписокТестовКлиентСервер.СформироватьТестыЯкс("GoogleDrive");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("GoogleDrive");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область GoogleDrive

Процедура ГД_Авторизация() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ClientID"    , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ClientSecret", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Code"        , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Refresh"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ServiceData" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Access_Token"       , ПараметрыТеста);

    GoogleDrive_СформироватьСсылкуПолученияКода(ПараметрыТеста);
    GoogleDrive_ПолучитьТокенПоКоду(ПараметрыТеста);
    GoogleDrive_ОбновитьТокен(ПараметрыТеста);
    GoogleDrive_ПолучитьТокенServiceАккаунта(ПараметрыТеста);

КонецПроцедуры

Процедура ГД_ПолучитьСписокКаталогов() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Token", ПараметрыТеста);

    GoogleDrive_ПолучитьСписокКаталогов(ПараметрыТеста);
    GoogleDrive_ПолучитьИнформациюОбОбъекте(ПараметрыТеста);

КонецПроцедуры

Процедура ГД_ЗагрузитьУдалитьФайл() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Token", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GD_Catalog"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture2"    , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Big"         , ПараметрыТеста);

    ПараметрыТеста.Вставить("МассивУдаляемых", Новый Массив);

    GoogleDrive_ЗагрузитьФайл(ПараметрыТеста);
    GoogleDrive_СкопироватьОбъект(ПараметрыТеста);
    GoogleDrive_СкачатьФайл(ПараметрыТеста);
    GoogleDrive_ОбновитьФайл(ПараметрыТеста);
    GoogleDrive_ПолучитьСписокФайлов(ПараметрыТеста);
    GoogleDrive_УдалитьОбъект(ПараметрыТеста);
    GoogleDrive_ПолучитьОписаниеФайла(ПараметрыТеста);

    OPI_Инструменты.Пауза(5);

КонецПроцедуры

Процедура ГД_СоздатьУдалитьКомментарий() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Token", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GD_Catalog"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"     , ПараметрыТеста);

    ПараметрыТеста.Вставить("МассивУдаляемых", Новый Массив);

    GoogleDrive_ЗагрузитьФайл(ПараметрыТеста);

    GoogleDrive_СоздатьКомментарий(ПараметрыТеста);
    GoogleDrive_ПолучитьКомментарий(ПараметрыТеста);
    GoogleDrive_ПолучитьСписокКомментариев(ПараметрыТеста);
    GoogleDrive_УдалитьКомментарий(ПараметрыТеста);

    GoogleDrive_УдалитьОбъект(ПараметрыТеста);

КонецПроцедуры

Процедура ГД_СоздатьКаталог() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Token", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("GD_Catalog"  , ПараметрыТеста);

    GoogleDrive_СоздатьПапку(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // GoogleDrive

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область GoogleDrive

Процедура GoogleDrive_СформироватьСсылкуПолученияКода(ПараметрыФункции)

    ClientID  = ПараметрыФункции["Google_ClientID"];
    Результат = OPI_GoogleDrive.СформироватьСсылкуПолученияКода(ClientID);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "СформироватьСсылкуПолученияКода");

КонецПроцедуры

Процедура GoogleDrive_ПолучитьТокенПоКоду(ПараметрыФункции)

    ClientID     = ПараметрыФункции["Google_ClientID"];
    ClientSecret = ПараметрыФункции["Google_ClientSecret"];
    Code         = ПараметрыФункции["Google_Code"];

    Результат = OPI_GoogleDrive.ПолучитьТокенПоКоду(ClientID, ClientSecret, Code);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ПолучитьТокенПоКоду");

КонецПроцедуры

Процедура GoogleDrive_ОбновитьТокен(ПараметрыФункции)

    ClientID     = ПараметрыФункции["Google_ClientID"];
    ClientSecret = ПараметрыФункции["Google_ClientSecret"];
    RefreshToken = ПараметрыФункции["Google_Refresh"];

    Результат = OPI_GoogleDrive.ОбновитьТокен(ClientID, ClientSecret, RefreshToken);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ОбновитьТокен");

КонецПроцедуры

Процедура GoogleDrive_ПолучитьТокенServiceАккаунта(ПараметрыФункции)

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

    Результат = OPI_GoogleDrive.ПолучитьТокенServiceАккаунта(Данные, ОбластиДействия);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ПолучитьТокенServiceАккаунта");

КонецПроцедуры

Процедура GoogleDrive_ПолучитьСписокКаталогов(ПараметрыФункции)

    Имя   = "Тестовая папка";
    Токен = ПараметрыФункции["Google_Token"];

    Результат = OPI_GoogleDrive.ПолучитьСписокКаталогов(Токен, Имя, Истина);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ПолучитьСписокКаталогов", , ПараметрыФункции);

КонецПроцедуры

Процедура GoogleDrive_ПолучитьИнформациюОбОбъекте(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GD_Catalog"];

    Результат = OPI_GoogleDrive.ПолучитьИнформациюОбОбъекте(Токен, Идентификатор);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ПолучитьИнформациюОбОбъекте");

КонецПроцедуры

Процедура GoogleDrive_ЗагрузитьФайл(ПараметрыФункции)

    Токен    = ПараметрыФункции["Google_Token"];
    Каталог  = ПараметрыФункции["GD_Catalog"];
    Картинка = ПараметрыФункции["Picture"];      // URL, Двоичные данные или Путь к файлу

    Пустая   = Ложь;
    Описание = OPI_GoogleDrive.ПолучитьОписаниеФайла(Пустая);

    Описание.Вставить("Родитель", Каталог);

    Результат = OPI_GoogleDrive.ЗагрузитьФайл(Токен, Картинка, Описание);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ЗагрузитьФайл", , ПараметрыФункции, Описание);

    Если Не OPI_Инструменты.ЭтоOneScript() И ПараметрыФункции.Свойство("Big")  Тогда

        БольшойФайл = ПараметрыФункции["Big"];
        Описание.Вставить("Имя", "big.rar");

        Результат = OPI_GoogleDrive.ЗагрузитьФайл(Токен, БольшойФайл, Описание);

        OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ЗагрузитьФайл", "Большой", ПараметрыФункции, Описание);

        Результат = OPI_GoogleDrive.СкачатьФайл(Токен, Результат["id"]);

        OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ЗагрузитьФайл", "Проверка", ПараметрыФункции, Описание);

    КонецЕсли;

КонецПроцедуры

Процедура GoogleDrive_СкопироватьОбъект(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GD_File"];
    НовоеИмя      = "Скопированный файл.jpeg";
    НовыйРодитель = "root";

    Результат = OPI_GoogleDrive.СкопироватьОбъект(Токен, Идентификатор, НовоеИмя, НовыйРодитель);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "СкопироватьОбъект", , ПараметрыФункции, НовоеИмя);

КонецПроцедуры

Процедура GoogleDrive_СкачатьФайл(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GD_File"];

    Результат = OPI_GoogleDrive.СкачатьФайл(Токен, Идентификатор);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "СкачатьФайл", , ПараметрыФункции);

КонецПроцедуры

Процедура GoogleDrive_ОбновитьФайл(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    НовоеИмя      = "Обновленный файл.jpg";
    Идентификатор = ПараметрыФункции["GD_File"];
    Файл          = ПараметрыФункции["Picture2"]; // URL, Двоичные данные или Путь к файлу

    Результат = OPI_GoogleDrive.ОбновитьФайл(Токен, Идентификатор, Файл, НовоеИмя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ОбновитьФайл", , НовоеИмя);

КонецПроцедуры

Процедура GoogleDrive_ПолучитьСписокФайлов(ПараметрыФункции)

    Токен       = ПараметрыФункции["Google_Token"];
    Каталог     = "root";
    ИмяСодержит = "data";

    Результат = OPI_GoogleDrive.ПолучитьСписокФайлов(Токен, ИмяСодержит, Каталог);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ПолучитьСписокФайлов");

КонецПроцедуры

Процедура GoogleDrive_УдалитьОбъект(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GD_File"];

    Результат = OPI_GoogleDrive.УдалитьОбъект(Токен, Идентификатор);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "УдалитьОбъект");

    Для Каждого Удаляемый Из ПараметрыФункции["МассивУдаляемых"] Цикл

        Результат = OPI_GoogleDrive.УдалитьОбъект(Токен, Удаляемый);

        OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "УдалитьОбъект", "Дополнительный");

        OPI_Инструменты.Пауза(2);

    КонецЦикла;

КонецПроцедуры

Процедура GoogleDrive_ПолучитьОписаниеФайла(ПараметрыФункции)

    Результат = OPI_GoogleDrive.ПолучитьОписаниеФайла();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ПолучитьОписаниеФайла");

КонецПроцедуры

Процедура GoogleDrive_СоздатьКомментарий(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GD_File"];
    Комментарий   = "Текст комментария";

    Результат = OPI_GoogleDrive.СоздатьКомментарий(Токен, Идентификатор, Комментарий);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "СоздатьКомментарий", , ПараметрыФункции, Комментарий);

КонецПроцедуры

Процедура GoogleDrive_ПолучитьКомментарий(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GD_File"];
    ИДКомментария = ПараметрыФункции["GD_Comment"];

    Результат = OPI_GoogleDrive.ПолучитьКомментарий(Токен, Идентификатор, ИДКомментария);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ПолучитьКомментарий");

КонецПроцедуры

Процедура GoogleDrive_ПолучитьСписокКомментариев(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GD_File"];

    Результат = OPI_GoogleDrive.ПолучитьСписокКомментариев(Токен, Идентификатор);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "ПолучитьСписокКомментариев");

КонецПроцедуры

Процедура GoogleDrive_УдалитьКомментарий(ПараметрыФункции)

    Токен         = ПараметрыФункции["Google_Token"];
    Идентификатор = ПараметрыФункции["GD_File"];
    ИДКомментария = ПараметрыФункции["GD_Comment"];

    Результат = OPI_GoogleDrive.УдалитьКомментарий(Токен, Идентификатор, ИДКомментария);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "УдалитьКомментарий");

КонецПроцедуры

Процедура GoogleDrive_СоздатьПапку(ПараметрыФункции)

    Токен   = ПараметрыФункции["Google_Token"];
    Каталог = ПараметрыФункции["GD_Catalog"];
    Имя     = "Тестовая папка";

    Результат = OPI_GoogleDrive.СоздатьПапку(Токен, Имя, Каталог);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "СоздатьПапку");

    ИДКаталога = Результат["id"];
    OPI_GoogleDrive.УдалитьОбъект(Токен, ИДКаталога);

    Результат = OPI_GoogleDrive.СоздатьПапку(Токен, Имя);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "GoogleDrive", "СоздатьПапку", "Корень");

    ИДКаталога = Результат["id"];
    OPI_GoogleDrive.УдалитьОбъект(Токен, ИДКаталога);

КонецПроцедуры

#КонецОбласти // GoogleDrive

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции
