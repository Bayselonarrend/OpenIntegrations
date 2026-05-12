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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingHardcodePath-off
// BSLLS:Typo-off
// BSLLS:DeprecatedMessage-off
// BSLLS:UsingServiceTag-off
// BSLLS:ExecuteExternalCodeInCommonModule-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:MagicNumber-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:MethodSize-off
// BSLLS:IfElseIfEndsWithElse-off
// BSLLS:CognitiveComplexity-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:CommentedCode-off
// BSLLS:CyclomaticComplexity-off
// BSLLS:LineLength-off
// BSLLS:NestedStatements-off
// BSLLS:IfElseDuplicatedCodeBlock-off

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-method
//@skip-check missing-temporary-file-deletion
//@skip-check method-too-many-params
//@skip-check bsl-legacy-check-for-each-statetement-collection
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-expression-type
//@skip-check undefined-variable

// #Использовать "../../../../tools/main"
// #Использовать "../../../../tools/http"
// #Использовать "../../../../api/openai"
// #Использовать "../../../../api/rportal"
// #Использовать asserts

#Область СлужебныйПрограммныйИнтерфейс

Функция СформироватьТестыЯкс(Знач МодульТестов) Экспорт

    ТаблицаТестов = OPI_ПолучениеДанныхТестов.ПолучитьТаблицуТестов(МодульТестов, Истина);

    Набор = ЮТТесты.ДобавитьТестовыйНабор(МодульТестов);

    Для Каждого Тест Из ТаблицаТестов Цикл
        Набор.ДобавитьКлиентскийТест(Тест.Метод, Тест.Синоним);
        Набор.ДобавитьСерверныйТест(Тест.Метод, Тест.Синоним);
    КонецЦикла;

    Возврат "";

КонецФункции

Функция СформироватьТестыЯксCLI(Знач МодульТестов = "") Экспорт

    ТаблицаТестов = OPI_ПолучениеДанныхТестов.ПолучитьТаблицуТестов(МодульТестов);

    Набор = ЮТТесты.ДобавитьТестовыйНабор(МодульТестов + " (CLI)");

    Для Каждого Тест Из ТаблицаТестов Цикл
        Набор.ДобавитьТест(Тест.Метод, Тест.Синоним);
    КонецЦикла;

    Возврат "";

КонецФункции

#КонецОбласти
