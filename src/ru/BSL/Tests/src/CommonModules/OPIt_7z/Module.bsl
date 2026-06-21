// OneScript: ./OInt/tests/Modules/OPIt_7z.os

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

// #Использовать oint
// #Использовать asserts
// #Использовать "internal"

#Если Не ВебКлиент Тогда // !OPI

// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("7z");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("7z");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область Архивация

Процедура Z7_Архивация() Экспорт

    Z7_ПолучитьСтруктуруНастроекАрхивации();

    КаталогБазы = КаталогВременныхФайлов()
        + "\opi_sevenz_"
        + Формат(ТекущаяУниверсальнаяДатаВМиллисекундах(), "ЧГ=0");

    СоздатьКаталог(КаталогБазы);

    КаталогИсточник        = Путь7z(КаталогБазы, "src");
    КаталогНазначение      = Путь7z(КаталогБазы, "out");
    КаталогНазначениеБуфер = Путь7z(КаталогБазы, "out_buffer");
    ПутьАрхива             = Путь7z(КаталогБазы, "archive.7z");
    ПутьАрхиваОписание     = Путь7z(КаталогБазы, "archive_desc.7z");

    СоздатьКаталог(КаталогИсточник);
    СоздатьКаталог(КаталогНазначение);
    СоздатьКаталог(КаталогНазначениеБуфер);

    ОжидаемыеФайлы = Новый Соответствие;

    ОжидаемыеФайлы.Вставить("readme.txt", "OpenIntegrations root");
    ПолучитьДвоичныеДанныеИзСтроки("OpenIntegrations root", "UTF-8").Записать(Путь7z(КаталогИсточник, "readme.txt"));

    СоздатьКаталог(Путь7z(КаталогИсточник, "docs"));
    ОжидаемыеФайлы.Вставить("docs\note.txt", "Nested documentation");
    ПолучитьДвоичныеДанныеИзСтроки("Nested documentation", "UTF-8").Записать(Путь7z(КаталогИсточник, "docs\note.txt"));

    СоздатьКаталог(Путь7z(КаталогИсточник, "data\nested"));
    ОписаниеБинарника = Новый Структура("binary, hex", Истина, "0102030405");
    ОжидаемыеФайлы.Вставить("data\nested\payload.bin", ОписаниеБинарника);
    ПолучитьДвоичныеДанныеИзHexСтроки("0102030405").Записать(Путь7z(КаталогИсточник, "data\nested\payload.bin"));

    СоздатьКаталог(Путь7z(КаталогИсточник, "config"));
    ОжидаемыеФайлы.Вставить("config\settings.json", "{""enabled"": true}");
    ПолучитьДвоичныеДанныеИзСтроки("{""enabled"": true}", "UTF-8").Записать(Путь7z(КаталогИсточник, "config\settings.json"));

    ЗаписиОписания = Новый Массив;

    ЭлементReadme = Новый Соответствие;
    ЭлементReadme.Вставить("name"      , "readme.txt");
    ЭлементReadme.Вставить("directory" , Ложь);
    ЭлементReadme.Вставить("from_path" , Истина);
    ЭлементReadme.Вставить("path"      , Путь7z(КаталогИсточник, "readme.txt"));
    ЗаписиОписания.Добавить(ЭлементReadme);

    ЗаписиDocs  = Новый Массив;
    ЭлементNote = Новый Соответствие;
    ЭлементNote.Вставить("name"      , "note.txt");
    ЭлементNote.Вставить("directory" , Ложь);
    ЭлементNote.Вставить("from_path" , Истина);
    ЭлементNote.Вставить("path"      , Путь7z(КаталогИсточник, "docs\note.txt"));
    ЗаписиDocs.Добавить(ЭлементNote);

    ЭлементDocs = Новый Соответствие;
    ЭлементDocs.Вставить("name"      , "docs");
    ЭлементDocs.Вставить("directory" , Истина);
    ЭлементDocs.Вставить("entries"   , ЗаписиDocs);
    ЗаписиОписания.Добавить(ЭлементDocs);

    ЗаписиData     = Новый Массив;
    ЭлементPayload = Новый Соответствие;
    ЭлементPayload.Вставить("name"      , "payload.bin");
    ЭлементPayload.Вставить("directory" , Ложь);
    ЭлементPayload.Вставить("from_path" , Истина);
    ЭлементPayload.Вставить("path"      , Путь7z(КаталогИсточник, "data\nested\payload.bin"));
    ЗаписиData.Добавить(ЭлементPayload);

    ЭлементData   = Новый Соответствие;
    ЭлементData.Вставить("name"      , "data");
    ЭлементData.Вставить("directory" , Истина);
    ЗаписиNested  = Новый Массив;
    ЭлементNested = Новый Соответствие;
    ЭлементNested.Вставить("name"      , "nested");
    ЭлементNested.Вставить("directory" , Истина);
    ЭлементNested.Вставить("entries"   , ЗаписиData);
    ЗаписиNested.Добавить(ЭлементNested);
    ЭлементData.Вставить("entries"   , ЗаписиNested);
    ЗаписиОписания.Добавить(ЭлементData);

    ЗаписиConfig    = Новый Массив;
    ЭлементSettings = Новый Соответствие;
    ЭлементSettings.Вставить("name"      , "settings.json");
    ЭлементSettings.Вставить("directory" , Ложь);
    ЭлементSettings.Вставить("from_path" , Истина);
    ЭлементSettings.Вставить("path"      , Путь7z(КаталогИсточник, "config\settings.json"));
    ЗаписиConfig.Добавить(ЭлементSettings);

    ЭлементConfig = Новый Соответствие;
    ЭлементConfig.Вставить("name"      , "config");
    ЭлементConfig.Вставить("directory" , Истина);
    ЭлементConfig.Вставить("entries"   , ЗаписиConfig);
    ЗаписиОписания.Добавить(ЭлементConfig);

    ОписаниеАрхива = Новый Соответствие;
    ОписаниеАрхива.Вставить("entries", ЗаписиОписания);

    Параметры = Новый Структура;
    Параметры.Вставить("SevenZ_BaseDir"        , КаталогБазы);
    Параметры.Вставить("SevenZ_SourceDir"      , КаталогИсточник);
    Параметры.Вставить("SevenZ_ArchivePath"    , ПутьАрхива);
    Параметры.Вставить("SevenZ_ArchiveDescPath", ПутьАрхиваОписание);
    Параметры.Вставить("SevenZ_DestDir"        , КаталогНазначение);
    Параметры.Вставить("SevenZ_DestBufferDir"  , КаталогНазначениеБуфер);
    Параметры.Вставить("SevenZ_Description"    , ОписаниеАрхива);
    Параметры.Вставить("SevenZ_ExpectedFiles"  , ОжидаемыеФайлы);

    ЗаписатьПараметры7z(Параметры);

    Z7_АрхивироватьКаталог(Параметры);
    Z7_РазархивироватьКаталог(Параметры);

    OPI_Инструменты.УдалитьФайлВПопытке(КаталогБазы, "Не удалось удалить каталог теста 7z");

КонецПроцедуры

#КонецОбласти // Архивация

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область Архивация

Процедура Z7_ПолучитьСтруктуруНастроекАрхивации()

    Результат = OPI_7z.ПолучитьСтруктуруНастроекАрхивации();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "ПолучитьСтруктуруНастроекАрхивации");

    Результат = OPI_7z.ПолучитьСтруктуруНастроекАрхивации(Истина);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "ПолучитьСтруктуруНастроекАрхивации", "Пустая");

    Результат = OPI_7z.ПолучитьСтруктуруНастроекАрхивации(Ложь, Истина);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "ПолучитьСтруктуруНастроекАрхивации", "КакСоответствие");

КонецПроцедуры

Процедура Z7_АрхивироватьКаталог(Параметры)

    КаталогИсточник = Параметры["SevenZ_SourceDir"];
    ПутьАрхива      = Параметры["SevenZ_ArchivePath"];

    Результат = OPI_7z.АрхивироватьКаталог(КаталогИсточник, ПутьАрхива);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "АрхивироватьКаталог", , ПутьАрхива);

    Результат = OPI_7z.АрхивироватьКаталог(КаталогИсточник);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "АрхивироватьКаталог", "ВПамять");

    Описание       = Параметры["SevenZ_Description"];
    ПутьАрхиваDesc = Параметры["SevenZ_ArchiveDescPath"];

    Результат = OPI_7z.АрхивироватьКаталог(Описание, ПутьАрхиваDesc);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "АрхивироватьКаталог", "ИзОписания", ПутьАрхиваDesc);

    Результат = OPI_7z.АрхивироватьКаталог(Описание);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "АрхивироватьКаталог", "ИзОписанияВПамять");

КонецПроцедуры

Процедура Z7_РазархивироватьКаталог(Параметры)

    ПутьАрхива             = Параметры["SevenZ_ArchivePath"];
    КаталогНазначение      = Параметры["SevenZ_DestDir"];
    КаталогНазначениеБуфер = Параметры["SevenZ_DestBufferDir"];
    ОжидаемыеФайлы         = Параметры["SevenZ_ExpectedFiles"];

    Результат = OPI_7z.РазархивироватьКаталог(ПутьАрхива, КаталогНазначение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "РазархивироватьКаталог", , КаталогНазначение, ОжидаемыеФайлы);

    Результат = OPI_7z.РазархивироватьКаталог(ПутьАрхива);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "РазархивироватьКаталог", "ВОписание", "", ОжидаемыеФайлы);

    АрхивДвоичные = Новый ДвоичныеДанные(ПутьАрхива);

    Результат = OPI_7z.РазархивироватьКаталог(АрхивДвоичные, КаталогНазначениеБуфер);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "РазархивироватьКаталог", "ИзПамяти", КаталогНазначениеБуфер, ОжидаемыеФайлы);

    Результат = OPI_7z.РазархивироватьКаталог(АрхивДвоичные);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "7z", "РазархивироватьКаталог", "ВОписаниеИзПамяти", "", ОжидаемыеФайлы);

КонецПроцедуры

#КонецОбласти // Архивация

#КонецОбласти // АтомарныеТесты

Процедура ЗаписатьПараметры7z(Параметры)

    OPI_ПолучениеДанныхТестов.ЗаписатьПараметр("SevenZ_BaseDir"    , Параметры["SevenZ_BaseDir"]);
    OPI_ПолучениеДанныхТестов.ЗаписатьПараметр("SevenZ_SourceDir"  , Параметры["SevenZ_SourceDir"]);
    OPI_ПолучениеДанныхТестов.ЗаписатьПараметр("SevenZ_ArchivePath", Параметры["SevenZ_ArchivePath"]);
    OPI_ПолучениеДанныхТестов.ЗаписатьПараметр("SevenZ_DestDir"    , Параметры["SevenZ_DestDir"]);

КонецПроцедуры

Функция Путь7z(БазовыйКаталог, ОтносительныйПуть)

    Возврат СтрШаблон("%1/%2", БазовыйКаталог, ОтносительныйПуть);

КонецФункции

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли // !OPI
