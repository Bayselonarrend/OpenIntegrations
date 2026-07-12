// OneScript: ./OInt/tests/Modules/OPIt_RAR.os

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

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("RAR");

КонецПроцедуры

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("RAR");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область Разархивирование

Процедура ZRAR_Разархивирование() Экспорт

    КаталогБазы = КаталогВременныхФайлов()
        + "\opi_rar_"
        + Формат(ТекущаяУниверсальнаяДатаВМиллисекундах(), "ЧГ=0");

    СоздатьКаталог(КаталогБазы);

    КаталогНазначение      = ПутьRAR(КаталогБазы, "out");
    КаталогНазначениеБуфер = ПутьRAR(КаталогБазы, "out_buffer");
    ПутьАрхива             = ПутьRAR(КаталогБазы, "archive.rar");

    СоздатьКаталог(КаталогНазначение);
    СоздатьКаталог(КаталогНазначениеБуфер);

    ЗаписатьТестовыйАрхивRAR(ПутьАрхива);

    ОжидаемыеФайлы = ОжидаемыеФайлыТестовогоАрхиваRAR();

    Параметры = Новый Структура;
    Параметры.Вставить("RAR_ArchivePath"  , ПутьАрхива);
    Параметры.Вставить("RAR_DestDir"      , КаталогНазначение);
    Параметры.Вставить("RAR_DestBufferDir", КаталогНазначениеБуфер);
    Параметры.Вставить("RAR_ExpectedFiles", ОжидаемыеФайлы);

    ZRAR_РазархивироватьКаталог(Параметры);

    OPI_Инструменты.УдалитьФайлВПопытке(КаталогБазы, "Не удалось удалить каталог теста rar");

КонецПроцедуры

#КонецОбласти // Разархивирование

#Область ПолучениеМетаданных

Процедура ZRAR_ПолучениеМетаданных() Экспорт

    КаталогБазы = КаталогВременныхФайлов()
        + "\opi_rar_meta_"
        + Формат(ТекущаяУниверсальнаяДатаВМиллисекундах(), "ЧГ=0");

    СоздатьКаталог(КаталогБазы);

    ПутьАрхива = ПутьRAR(КаталогБазы, "archive.rar");

    ЗаписатьТестовыйАрхивRAR(ПутьАрхива);

    ОжидаемыеФайлы = ОжидаемыеФайлыТестовогоАрхиваRAR();

    Параметры = Новый Структура;
    Параметры.Вставить("RAR_ArchivePath"  , ПутьАрхива);
    Параметры.Вставить("RAR_ExpectedFiles", ОжидаемыеФайлы);

    ZRAR_ПолучитьСписокФайлов(Параметры);
    ZRAR_ПолучитьМетаданные(Параметры);

    OPI_Инструменты.УдалитьФайлВПопытке(КаталогБазы, "Не удалось удалить каталог теста rar");

КонецПроцедуры

#КонецОбласти // ПолучениеМетаданных

#Область ЧастичнаяРаспаковка

Процедура ZRAR_ЧастичнаяРаспаковка() Экспорт

    КаталогБазы = КаталогВременныхФайлов()
        + "\opi_rar_partial_"
        + Формат(ТекущаяУниверсальнаяДатаВМиллисекундах(), "ЧГ=0");

    СоздатьКаталог(КаталогБазы);

    КаталогНазначение      = ПутьRAR(КаталогБазы, "out");
    КаталогНазначениеБуфер = ПутьRAR(КаталогБазы, "out_buffer");
    ПутьАрхива             = ПутьRAR(КаталогБазы, "archive.rar");

    СоздатьКаталог(КаталогНазначение);
    СоздатьКаталог(КаталогНазначениеБуфер);

    ЗаписатьТестовыйАрхивRAR(ПутьАрхива);

    ОжидаемыеЧастичные = Новый Соответствие;
    ОжидаемыеЧастичные.Вставить("readme.txt"   , "OpenIntegrations root");
    ОжидаемыеЧастичные.Вставить("docs\note.txt", "Nested documentation");

    ПутиЧастичные = Новый Массив;
    ПутиЧастичные.Добавить("readme.txt");
    ПутиЧастичные.Добавить("docs/note.txt");

    Параметры = Новый Структура;
    Параметры.Вставить("RAR_ArchivePath"     , ПутьАрхива);
    Параметры.Вставить("RAR_DestDir"         , КаталогНазначение);
    Параметры.Вставить("RAR_DestBufferDir"   , КаталогНазначениеБуфер);
    Параметры.Вставить("RAR_PartialPaths"    , ПутиЧастичные);
    Параметры.Вставить("RAR_PartialExpected" , ОжидаемыеЧастичные);

    ZRAR_РазархивироватьФайлы(Параметры);

    OPI_Инструменты.УдалитьФайлВПопытке(КаталогБазы, "Не удалось удалить каталог теста rar");

КонецПроцедуры

#КонецОбласти // ЧастичнаяРаспаковка

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область Разархивирование

Процедура ZRAR_РазархивироватьКаталог(Параметры)

    OPI_ПолучениеДанныхТестов.ДополнитьПараметрыАрхива(Параметры, "RAR");

    ПутьАрхива             = Параметры["RAR_ArchivePath"];
    КаталогНазначение      = Параметры["RAR_DestDir"];
    КаталогНазначениеБуфер = Параметры["RAR_DestBufferDir"];
    ОжидаемыеФайлы         = Параметры["RAR_ExpectedFiles"];

    Результат = OPI_RAR.РазархивироватьКаталог(ПутьАрхива, КаталогНазначение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "РазархивироватьКаталог", , КаталогНазначение, ОжидаемыеФайлы);

    Результат = OPI_RAR.РазархивироватьКаталог(ПутьАрхива);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "РазархивироватьКаталог", "ВОписание", "", ОжидаемыеФайлы);

    АрхивДвоичные = Новый ДвоичныеДанные(ПутьАрхива);

    Результат = OPI_RAR.РазархивироватьКаталог(АрхивДвоичные, КаталогНазначениеБуфер);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "РазархивироватьКаталог", "ИзПамяти", КаталогНазначениеБуфер, ОжидаемыеФайлы);

    Результат = OPI_RAR.РазархивироватьКаталог(АрхивДвоичные);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "РазархивироватьКаталог", "ВОписаниеИзПамяти", "", ОжидаемыеФайлы);

КонецПроцедуры

#КонецОбласти // Разархивирование

#Область ПолучениеМетаданных

Процедура ZRAR_ПолучитьСписокФайлов(Параметры)

    ПутьАрхива     = Параметры["RAR_ArchivePath"];
    ОжидаемыеФайлы = Параметры["RAR_ExpectedFiles"];

    Результат = OPI_RAR.ПолучитьСписокФайлов(ПутьАрхива);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "ПолучитьСписокФайлов", , ОжидаемыеФайлы);

    АрхивДвоичные = Новый ДвоичныеДанные(ПутьАрхива);

    Результат = OPI_RAR.ПолучитьСписокФайлов(АрхивДвоичные);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "ПолучитьСписокФайлов", "ИзПамяти", ОжидаемыеФайлы);

КонецПроцедуры

Процедура ZRAR_ПолучитьМетаданные(Параметры)

    ПутьАрхива     = Параметры["RAR_ArchivePath"];
    ОжидаемыеФайлы = Параметры["RAR_ExpectedFiles"];

    Результат = OPI_RAR.ПолучитьМетаданные(ПутьАрхива);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "ПолучитьМетаданные", , ОжидаемыеФайлы);

    АрхивДвоичные = Новый ДвоичныеДанные(ПутьАрхива);

    Результат = OPI_RAR.ПолучитьМетаданные(АрхивДвоичные);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "ПолучитьМетаданные", "ИзПамяти", ОжидаемыеФайлы);

КонецПроцедуры

#КонецОбласти // ПолучениеМетаданных

#Область ЧастичнаяРаспаковка

Процедура ZRAR_РазархивироватьФайлы(Параметры)

    OPI_ПолучениеДанныхТестов.ДополнитьПараметрыАрхива(Параметры, "RAR");

    ПутьАрхива             = Параметры["RAR_ArchivePath"];
    КаталогНазначение      = Параметры["RAR_DestDir"];
    КаталогНазначениеБуфер = Параметры["RAR_DestBufferDir"];
    ПутиЧастичные          = Параметры["RAR_PartialPaths"];
    ОжидаемыеФайлы         = Параметры["RAR_PartialExpected"];

    Результат = OPI_RAR.РазархивироватьФайлы(ПутьАрхива, ПутиЧастичные, КаталогНазначение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "РазархивироватьФайлы", , КаталогНазначение, ОжидаемыеФайлы);

    Результат = OPI_RAR.РазархивироватьФайлы(ПутьАрхива, ПутиЧастичные);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "РазархивироватьФайлы", "ВОписание", "", ОжидаемыеФайлы);

    АрхивДвоичные = Новый ДвоичныеДанные(ПутьАрхива);

    Результат = OPI_RAR.РазархивироватьФайлы(АрхивДвоичные, ПутиЧастичные, КаталогНазначениеБуфер);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "РазархивироватьФайлы", "ИзПамяти", КаталогНазначениеБуфер, ОжидаемыеФайлы);

    Результат = OPI_RAR.РазархивироватьФайлы(АрхивДвоичные, ПутиЧастичные);
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RAR", "РазархивироватьФайлы", "ВОписаниеИзПамяти", "", ОжидаемыеФайлы);

КонецПроцедуры

#КонецОбласти // ЧастичнаяРаспаковка

#КонецОбласти // АтомарныеТесты

Функция ПутьRAR(КаталогБазы, Имя)

    Возврат КаталогБазы + "\" + Имя;

КонецФункции

Процедура ЗаписатьТестовыйАрхивRAR(ПутьАрхива)

    ДвоичныеАрхива = Base64Значение(
        "UmFyIRoHAQDz4YLrCwEFBwAGAQGAgIAAPwEcmSYCAwuVAASVACC2PvOwgAAACnJlYWRtZS50eHQKAwKYhLY0Cg7dAU9wZW5JbnRlZ3JhdGlvbnMgcm9vdPjThn0pAgMLlAAElAAgnCAeeIAAAA1kb2NzL25vdGUudHh0CgMCqNK2NAoO3QFOZXN0ZWQgZG9jdW1lbnRhdGlvbnjXZDAzAgMLhQAEhQAg9JkLR4AAABdkYXRhL25lc3RlZC9wYXlsb2FkLmJpbgoDAvyVtzQKDt0BAQIDBAXtztZoMAIDC5EABJEAIOUyvtyAAAAUY29uZmlnL3NldHRpbmdzLmpzb24KAwJRC7g0Cg7dAXsiZW5hYmxlZCI6IHRydWV9fUJWaSECAwsAAQAQgAAAC2RhdGEvbmVzdGVkCgMC/JW3NAoO3QFtWRJmGgIDCwABABCAAAAEZG9jcwoDAqjStjQKDt0BAaE80hoCAwsAAQAQgAAABGRhdGEKAwLb/bQ0Cg7dAfV599YcAgMLAAEAEIAAAAZjb25maWcKAwJRC7g0Cg7dAR13VlEDBQQA");

    ДвоичныеАрхива.Записать(ПутьАрхива);

КонецПроцедуры

Функция ОжидаемыеФайлыТестовогоАрхиваRAR()

    ОжидаемыеФайлы = Новый Соответствие;

    ОжидаемыеФайлы.Вставить("readme.txt"   , "OpenIntegrations root");
    ОжидаемыеФайлы.Вставить("docs\note.txt", "Nested documentation");

    ОписаниеБинарника = Новый Структура("binary, hex", Истина, "0102030405");
    ОжидаемыеФайлы.Вставить("data\nested\payload.bin", ОписаниеБинарника);
    ОжидаемыеФайлы.Вставить("config\settings.json"   , "{""enabled"": true}");

    Возврат ОжидаемыеФайлы;

КонецФункции

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure ZRAR_Unarchiving() Export
    ZRAR_Разархивирование();
EndProcedure

Procedure ZRAR_GetMetadata() Export
    ZRAR_ПолучениеМетаданных();
EndProcedure

Procedure ZRAR_PartialUnpacking() Export
    ZRAR_ЧастичнаяРаспаковка();
EndProcedure

#EndRegion