// OneScript: ./OInt/tests/Modules/OPItc_7z.os

// MIT License

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
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

//#Использовать "../../tools/main"
//#Использовать "../../tools/http"
//#Использовать "../../api"
//#Использовать asserts
//#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯксCLI("7z");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертсCLI("7z");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область 7z

Процедура Z7_Архивация() Экспорт

    Z7_ПолучитьСтруктуруНастроекАрхивации();

    Параметры = ПодготовитьПараметрыТеста7z();

    Z7_АрхивироватьКаталог(Параметры);
    Z7_РазархивироватьКаталог(Параметры);

    OPI_Инструменты.УдалитьФайлВПопытке(Параметры["BaseDir"], "Не удалось удалить каталог теста 7z");

КонецПроцедуры

#КонецОбласти // 7z

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область 7z

Процедура Z7_ПолучитьСтруктуруНастроекАрхивации()

    Опции = Новый Структура;

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("7z", "ПолучитьСтруктуруНастроекАрхивации", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "7z", "ПолучитьСтруктуруНастроекАрхивации");

    Опции = Новый Структура;
    Опции.Вставить("empty", Истина);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("7z", "ПолучитьСтруктуруНастроекАрхивации", Опции);
    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "7z", "ПолучитьСтруктуруНастроекАрхивации", "Пустая");

    Опции = Новый Структура;
    Опции.Вставить("map", Истина);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("7z", "ПолучитьСтруктуруНастроекАрхивации", Опции);
    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "7z", "ПолучитьСтруктуруНастроекАрхивации", "КакСоответствие");

КонецПроцедуры

Процедура Z7_АрхивироватьКаталог(Параметры)

    КаталогИсточник = Параметры["SourceDir"];
    ПутьАрхива      = Параметры["ArchivePath"];

    Опции = Новый Структура;
    Опции.Вставить("src" , КаталогИсточник);
    Опции.Вставить("dest", ПутьАрхива);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("7z", "АрхивироватьКаталог", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "7z", "АрхивироватьКаталог", , ПутьАрхива);

КонецПроцедуры

Процедура Z7_РазархивироватьКаталог(Параметры)

    ПутьАрхива        = Параметры["ArchivePath"];
    КаталогНазначение = Параметры["DestDir"];
    ОжидаемыйФайл     = Параметры["ExpectedFile"];
    ОжидаемыйТекст    = Параметры["ExpectedText"];

    Опции = Новый Структура;
    Опции.Вставить("src" , ПутьАрхива);
    Опции.Вставить("dest", КаталогНазначение);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("7z", "РазархивироватьКаталог", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "7z", "РазархивироватьКаталог", , ОжидаемыйФайл, ОжидаемыйТекст);

КонецПроцедуры

#КонецОбласти // 7z

#КонецОбласти // АтомарныеТесты

Функция ПодготовитьПараметрыТеста7z()

    База              = ПолучитьИмяВременногоФайла("7z");
    КаталогБазы       = Новый Файл(База).Путь;
    КаталогИсточник   = КаталогБазы + "\src";
    КаталогНазначение = КаталогБазы + "\out";
    ПутьАрхива        = КаталогБазы + "\archive.7z";
    ИмяФайла          = "sample.txt";
    ТекстФайла        = "OpenIntegrations 7z test";

    СоздатьКаталог(КаталогИсточник);

    ПутьФайла = КаталогИсточник + "\" + ИмяФайла;
    Запись    = Новый ЗаписьТекста(ПутьФайла, КодировкаТекста.UTF8);
    Запись.Записать(ТекстФайла);
    Запись.Закрыть();

    Параметры = Новый Структура;
    Параметры.Вставить("BaseDir"     , КаталогБазы);
    Параметры.Вставить("SourceDir"   , КаталогИсточник);
    Параметры.Вставить("ArchivePath" , ПутьАрхива);
    Параметры.Вставить("DestDir"     , КаталогНазначение);
    Параметры.Вставить("ExpectedFile", КаталогНазначение + "\" + ИмяФайла);
    Параметры.Вставить("ExpectedText", ТекстФайла);

    Возврат Параметры;

КонецФункции

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли // !OPI
