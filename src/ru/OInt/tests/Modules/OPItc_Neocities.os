// OneScript: ./OInt/tests/Modules/OPItc_Neocities.os

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

#Использовать "../../tools/main"
#Использовать "../../tools/http"
#Использовать "../../api"
#Использовать asserts
#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯксCLI("Neocities");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертсCLI("Neocities");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область Neocities

Процедура НС_РаботаСФайлами() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("NC_Token", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture2", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Gif"     , ПараметрыТеста);

    Neocities_ЗагрузитьФайл(ПараметрыТеста);
    Neocities_ЗагрузитьФайлы(ПараметрыТеста);
    Neocities_ПолучитьСписокФайлов(ПараметрыТеста);
    Neocities_УдалитьВыбранныеФайлы(ПараметрыТеста);
    Neocities_СинхронизироватьКаталоги(ПараметрыТеста);

КонецПроцедуры

Процедура НС_ПолучениеДанных() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("NC_Token"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("NC_Login"   , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("NC_Password", ПараметрыТеста);

    Neocities_ПолучитьДанныеОСайте(ПараметрыТеста);
    Neocities_ПолучитьТокен(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // Neocities

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область Neocities

Процедура Neocities_ЗагрузитьФайл(ПараметрыФункции)

    Токен  = ПараметрыФункции["NC_Token"];
    Данные = ПараметрыФункции["Picture"]; // URL, Путь или Двоичные данные
    Путь   = "testfolder/test_pic.png";

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("path", Путь);
    Опции.Вставить("file", Данные);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "ЗагрузитьФайл", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "ЗагрузитьФайл");

КонецПроцедуры

Процедура Neocities_ЗагрузитьФайлы(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];

    Картинка1 = ПараметрыФункции["Picture"];  // URL, Путь или Двоичные данные
    Картинка2 = ПараметрыФункции["Picture2"]; // URL, Путь или Двоичные данные
    Гифка     = ПараметрыФункции["Gif"];      // URL, Путь или Двоичные данные

    СоответствиеФайлов = Новый Соответствие;
    СоответствиеФайлов.Вставить("test/pic1.png", Картинка1);
    СоответствиеФайлов.Вставить("test/gif.gif" , Картинка2);
    СоответствиеФайлов.Вставить("pic2.png"     , Гифка);

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("files", СоответствиеФайлов);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "ЗагрузитьФайлы", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "ЗагрузитьФайлы");

КонецПроцедуры

Процедура Neocities_УдалитьВыбранныеФайлы(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];

    Пути = Новый Массив;
    Пути.Добавить("/test/pic1.png");
    Пути.Добавить("/test/gif.gif");
    Пути.Добавить("/pic2.png");

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("paths", Пути);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "УдалитьВыбранныеФайлы", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "УдалитьВыбранныеФайлы");

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("paths", "/testfolder");

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "УдалитьВыбранныеФайлы", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "УдалитьВыбранныеФайлы", "Каталог 1");

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("paths", "/test");

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "УдалитьВыбранныеФайлы", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "УдалитьВыбранныеФайлы", "Каталог 2");

КонецПроцедуры

Процедура Neocities_ПолучитьСписокФайлов(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];
    Путь  = "test";

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("path", Путь);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "ПолучитьСписокФайлов", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "ПолучитьСписокФайлов");

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "ПолучитьСписокФайлов", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "ПолучитьСписокФайлов", "Все");

КонецПроцедуры

Процедура Neocities_ПолучитьДанныеОСайте(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];
    Сайт  = "2athenaeum";

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "ПолучитьДанныеОСайте", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "ПолучитьДанныеОСайте"); // SKIP

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("sitename", Сайт);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "ПолучитьДанныеОСайте", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "ПолучитьДанныеОСайте", "Сайт");

КонецПроцедуры

Процедура Neocities_ПолучитьТокен(ПараметрыФункции)

    Логин  = ПараметрыФункции["NC_Login"];
    Пароль = ПараметрыФункции["NC_Password"];

    Опции = Новый Структура;
    Опции.Вставить("login", Логин);
    Опции.Вставить("password", Пароль);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "ПолучитьТокен", Опции);

    // END

    Результат["api_key"] = "***";

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "ПолучитьТокен");

КонецПроцедуры

Процедура Neocities_СинхронизироватьКаталоги(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];

    ЛокальныйКаталог = "C:\test_site";
    УдаленныйКаталог = "test_sync";

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("local", ЛокальныйКаталог);
    Опции.Вставить("remote", УдаленныйКаталог);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("neocities", "СинхронизироватьКаталоги", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Neocities", "СинхронизироватьКаталоги");

КонецПроцедуры

#КонецОбласти // Neocities

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure NC_FilesManagement() Export
    НС_РаботаСФайлами();
EndProcedure

Procedure NC_DataRetrieving() Export
    НС_ПолучениеДанных();
EndProcedure

#EndRegion
