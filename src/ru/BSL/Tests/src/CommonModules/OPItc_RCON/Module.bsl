// OneScript: ./OInt/tests/Modules/OPItc_RCON.os

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

//#Использовать "../../tools/main"
//#Использовать "../../tools/http"
//#Использовать "../../api"
//#Использовать asserts
//#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯксCLI("RCON");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертсCLI("RCON");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область RCON

Процедура RC_ВыполнениеКоманд() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RCON_URL"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("RCON_Password", ПараметрыТеста);

    RCON_СформироватьПараметрыСоединения(ПараметрыТеста);
    RCON_ОткрытьСоединение(ПараметрыТеста);
    RCON_ВыполнитьКоманду(ПараметрыТеста);
    RCON_ЭтоКоннектор(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // RCON

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область RCON

Процедура RCON_СформироватьПараметрыСоединения(ПараметрыФункции)

    URL           = ПараметрыФункции["RCON_URL"];
    Пароль        = ПараметрыФункции["RCON_Password"];
    ТаймаутЗаписи = 20;
    ТаймаутЧтения = 20;

    Опции = Новый Структура;
    Опции.Вставить("url", URL);
    Опции.Вставить("pass", Пароль);
    Опции.Вставить("rtout", ТаймаутЧтения);
    Опции.Вставить("wtout", ТаймаутЗаписи);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("rcon", "СформироватьПараметрыСоединения", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "RCON", "СформироватьПараметрыСоединения");

КонецПроцедуры

Процедура RCON_ОткрытьСоединение(ПараметрыФункции)

    URL           = ПараметрыФункции["RCON_URL"];
    Пароль        = ПараметрыФункции["RCON_Password"];
    ТаймаутЗаписи = 20;
    ТаймаутЧтения = 20;

    Опции = Новый Структура;
    Опции.Вставить("url", URL);
    Опции.Вставить("pass", Пароль);
    Опции.Вставить("rtout", ТаймаутЧтения);
    Опции.Вставить("wtout", ТаймаутЗаписи);

    ПараметрыСоединения = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("rcon", "СформироватьПараметрыСоединения", Опции);
    Результат           = OPI_RCON.ОткрытьСоединение(ПараметрыСоединения);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "RCON", "ОткрытьСоединение");

КонецПроцедуры

Процедура RCON_ВыполнитьКоманду(ПараметрыФункции)

    URL           = ПараметрыФункции["RCON_URL"];
    Пароль        = ПараметрыФункции["RCON_Password"];
    ТаймаутЗаписи = 20;
    ТаймаутЧтения = 20;

    Опции = Новый Структура;
    Опции.Вставить("url", URL);
    Опции.Вставить("pass", Пароль);
    Опции.Вставить("rtout", ТаймаутЧтения);
    Опции.Вставить("wtout", ТаймаутЗаписи);

    ПараметрыСоединения = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("rcon", "СформироватьПараметрыСоединения", Опции);
    Соединение          = OPI_RCON.ОткрытьСоединение(ПараметрыСоединения);

    Команда   = "list";
    Опции = Новый Структура;
    Опции.Вставить("exec", Команда);
    Опции.Вставить("conn", Соединение);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("rcon", "ВыполнитьКоманду", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "RCON", "ВыполнитьКоманду");

    Команда   = "list";
    Опции = Новый Структура;
    Опции.Вставить("exec", Команда);
    Опции.Вставить("conn", ПараметрыСоединения);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("rcon", "ВыполнитьКоманду", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "RCON", "ВыполнитьКоманду", "Без соединения");

КонецПроцедуры

Процедура RCON_ЭтоКоннектор(ПараметрыФункции)

    URL           = ПараметрыФункции["RCON_URL"];
    Пароль        = ПараметрыФункции["RCON_Password"];
    ТаймаутЗаписи = 20;
    ТаймаутЧтения = 20;

    Опции = Новый Структура;
    Опции.Вставить("url", URL);
    Опции.Вставить("pass", Пароль);
    Опции.Вставить("rtout", ТаймаутЧтения);
    Опции.Вставить("wtout", ТаймаутЗаписи);

    ПараметрыСоединения = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("rcon", "СформироватьПараметрыСоединения", Опции);
    Соединение          = OPI_RCON.ОткрытьСоединение(ПараметрыСоединения);
    Результат           = OPI_RCON.ЭтоКоннектор(Соединение);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "RCON", "ЭтоКоннектор");

КонецПроцедуры

#КонецОбласти // RCON

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure RC_CommandsExecution() Export
    RC_ВыполнениеКоманд();
EndProcedure

#EndRegion
