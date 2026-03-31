 // OneScript: ./OInt/tests/Modules/OPI_Тесты.os

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

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("Neocities");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("Neocities");

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

    Результат = OPI_Neocities.ЗагрузитьФайл(Токен, Путь, Данные);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "ЗагрузитьФайл");

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

    Результат = OPI_Neocities.ЗагрузитьФайлы(Токен, СоответствиеФайлов);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "ЗагрузитьФайлы");

КонецПроцедуры

Процедура Neocities_УдалитьВыбранныеФайлы(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];

    Пути = Новый Массив;
    Пути.Добавить("/test/pic1.png");
    Пути.Добавить("/test/gif.gif");
    Пути.Добавить("/pic2.png");

    Результат = OPI_Neocities.УдалитьВыбранныеФайлы(Токен, Пути);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "УдалитьВыбранныеФайлы");

    Результат = OPI_Neocities.УдалитьВыбранныеФайлы(Токен, "/testfolder");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "УдалитьВыбранныеФайлы", "Каталог 1");

    Результат = OPI_Neocities.УдалитьВыбранныеФайлы(Токен, "/test");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "УдалитьВыбранныеФайлы", "Каталог 2");

КонецПроцедуры

Процедура Neocities_ПолучитьСписокФайлов(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];
    Путь  = "test";

    Результат = OPI_Neocities.ПолучитьСписокФайлов(Токен, Путь);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "ПолучитьСписокФайлов");

    Результат = OPI_Neocities.ПолучитьСписокФайлов(Токен);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "ПолучитьСписокФайлов", "Все");

КонецПроцедуры

Процедура Neocities_ПолучитьДанныеОСайте(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];
    Сайт  = "2athenaeum";

    Результат = OPI_Neocities.ПолучитьДанныеОСайте(Токен);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "ПолучитьДанныеОСайте"); // SKIP

    Результат = OPI_Neocities.ПолучитьДанныеОСайте(Токен, Сайт);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "ПолучитьДанныеОСайте", "Сайт");

КонецПроцедуры

Процедура Neocities_ПолучитьТокен(ПараметрыФункции)

    Логин  = ПараметрыФункции["NC_Login"];
    Пароль = ПараметрыФункции["NC_Password"];

    Результат = OPI_Neocities.ПолучитьТокен(Логин, Пароль);

    // END

    Результат["api_key"] = "***";

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "ПолучитьТокен");

КонецПроцедуры

Процедура Neocities_СинхронизироватьКаталоги(ПараметрыФункции)

    Токен = ПараметрыФункции["NC_Token"];

    ЛокальныйКаталог = "C:\test_site";
    УдаленныйКаталог = "test_sync";

    Результат = OPI_Neocities.СинхронизироватьКаталоги(Токен, ЛокальныйКаталог, УдаленныйКаталог);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Neocities", "СинхронизироватьКаталоги");

КонецПроцедуры

#КонецОбласти // Neocities

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции
