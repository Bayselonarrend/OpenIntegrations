// OneScript: ./OInt/tests/Modules/OPItc_Ntfy.os

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
#Использовать "../../formats"
#Использовать asserts
#Использовать "internal"

// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯксCLI("Ntfy");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертсCLI("Ntfy");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область Ntfy

Процедура Ntfy_Публикация() Экспорт

    ПараметрыТеста = OPI_ПолучениеДанныхТестов.ПолучитьТестовыеДанные();
    Ntfy_ПолучитьСтруктуруПараметровСообщения(ПараметрыТеста);
    Ntfy_ОтправитьСообщение(ПараметрыТеста);

КонецПроцедуры

Процедура Ntfy_ПолучениеИУправление() Экспорт

    ПараметрыТеста = OPI_ПолучениеДанныхТестов.ПолучитьТестовыеДанные();
    Ntfy_ПолучитьСтруктуруПараметровФильтра(ПараметрыТеста);
    Ntfy_ПолучитьСообщения(ПараметрыТеста);
    Ntfy_УдалитьСообщение(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // Ntfy

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область Ntfy

Процедура Ntfy_ПолучитьСтруктуруПараметровСообщения(ПараметрыФункции)

    Опции = Новый Структура;

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ПолучитьСтруктуруПараметровСообщения", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Ntfy", "ПолучитьСтруктуруПараметровСообщения");

    // END

    Опции = Новый Структура;
    Опции.Вставить("empty", Истина);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ПолучитьСтруктуруПараметровСообщения", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Ntfy", "ПолучитьСтруктуруПараметровСообщения", "Пустая");

КонецПроцедуры

Процедура Ntfy_ОтправитьСообщение(ПараметрыФункции)

    URL   = ПараметрыФункции["NTFY_URL"];
    Топик = ПараметрыФункции["NTFY_Topic"];
    Токен = ПараметрыФункции["NTFY_Token"];
    Текст = "OpenIntegrations test message";

    Опции = Новый Структура;
    Опции.Вставить("empty", Истина);

    Параметры = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ПолучитьСтруктуруПараметровСообщения", Опции);
    Параметры.Title    = "OpenIntegrations";
    Параметры.Priority = "default";
    Параметры.Tags     = "white_check_mark";

    Опции = Новый Структура;
    Опции.Вставить("url", URL);
    Опции.Вставить("topic", Топик);
    Опции.Вставить("message", Текст);
    Опции.Вставить("token", Токен);
    Опции.Вставить("options", Параметры);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ОтправитьСообщение", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Ntfy", "ОтправитьСообщение");

    // END

КонецПроцедуры

Процедура Ntfy_ПолучитьСтруктуруПараметровФильтра(ПараметрыФункции)

    Опции = Новый Структура;

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ПолучитьСтруктуруПараметровФильтра", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Ntfy", "ПолучитьСтруктуруПараметровФильтра");

    // END

    Опции = Новый Структура;
    Опции.Вставить("empty", Истина);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ПолучитьСтруктуруПараметровФильтра", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Ntfy", "ПолучитьСтруктуруПараметровФильтра", "Пустая");

КонецПроцедуры

Процедура Ntfy_ПолучитьСообщения(ПараметрыФункции)

    URL   = ПараметрыФункции["NTFY_URL"];
    Топик = ПараметрыФункции["NTFY_Topic"];
    Токен = ПараметрыФункции["NTFY_Token"];

    Опции = Новый Структура;
    Опции.Вставить("empty", Истина);

    Фильтр = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ПолучитьСтруктуруПараметровФильтра", Опции);
    Фильтр.limit = "5";

    Опции = Новый Структура;
    Опции.Вставить("url", URL);
    Опции.Вставить("topic", Топик);
    Опции.Вставить("token", Токен);
    Опции.Вставить("filter", Фильтр);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ПолучитьСообщения", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Ntfy", "ПолучитьСообщения");

    // END

КонецПроцедуры

Процедура Ntfy_УдалитьСообщение(ПараметрыФункции)

    URL   = ПараметрыФункции["NTFY_URL"];
    Топик = ПараметрыФункции["NTFY_Topic"];
    Токен = ПараметрыФункции["NTFY_Token"];
    Текст = "OpenIntegrations delete test";

    Опции = Новый Структура;
    Опции.Вставить("url", URL);
    Опции.Вставить("topic", Топик);
    Опции.Вставить("message", Текст);
    Опции.Вставить("token", Токен);

    Отправка = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "ОтправитьСообщение", Опции);
    ID       = Отправка["id"];

    Опции = Новый Структура;
    Опции.Вставить("url", URL);
    Опции.Вставить("topic", Топик);
    Опции.Вставить("id", ID);
    Опции.Вставить("token", Токен);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("ntfy", "УдалитьСообщение", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Ntfy", "УдалитьСообщение");

    // END

КонецПроцедуры

#КонецОбласти // Ntfy

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure Ntfy_Publication() Export
    Ntfy_Публикация();
EndProcedure

Procedure Ntfy_ManagementAndRetrieval() Export
    Ntfy_ПолучениеИУправление();
EndProcedure

#EndRegion
