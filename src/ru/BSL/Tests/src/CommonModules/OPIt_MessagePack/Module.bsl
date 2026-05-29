// OneScript: ./OInt/tests/Modules/OPIt_MessagePack.os

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

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("MessagePack");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("MessagePack");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область MessagePack

Процедура MP_Данные() Экспорт

    MessagePack_СериализоватьДанные();
    MessagePack_ДесериализоватьДанные();

КонецПроцедуры

#КонецОбласти // MessagePack

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область MessagePack

Процедура MessagePack_СериализоватьДанные()

    Результат = OPI_MessagePack.СериализоватьДанные("");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "ПустаяСтрока");

    Результат = OPI_MessagePack.СериализоватьДанные("a");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "СтрокаFixstr");

    Результат = OPI_MessagePack.СериализоватьДанные("Привет");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "СтрокаUTF8");

    Результат = OPI_MessagePack.СериализоватьДанные(0);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "Целое0");

    Результат = OPI_MessagePack.СериализоватьДанные(127);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "Целое127");

    Результат = OPI_MessagePack.СериализоватьДанные(128);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "Uint8");

    Результат = OPI_MessagePack.СериализоватьДанные(-1);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "ОтрицательноеFixint");

    Результат = OPI_MessagePack.СериализоватьДанные(-33);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "Int8");

    Исходное = 0.2;
    Результат = OPI_MessagePack.СериализоватьДанные(Исходное);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "СериализоватьДанные", "Вещественное", Исходное);

КонецПроцедуры

Процедура MessagePack_ДесериализоватьДанные()

    Данные = ПолучитьДвоичныеДанныеИзHexСтроки("00");
    Результат = OPI_MessagePack.ДесериализоватьДанные(Данные);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "ДесериализоватьДанные", "Fixint0");

    Данные = ПолучитьДвоичныеДанныеИзHexСтроки("A161");
    Результат = OPI_MessagePack.ДесериализоватьДанные(Данные);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "ДесериализоватьДанные", "СтрокаFixstr");

    Исходное = 128;
    Двоичные = OPI_MessagePack.СериализоватьДанные(Исходное);
    Результат = OPI_MessagePack.ДесериализоватьДанные(Двоичные);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "ДесериализоватьДанные", "RoundTrip", Исходное);

    Исходное = -33;
    Двоичные = OPI_MessagePack.СериализоватьДанные(Исходное);
    Результат = OPI_MessagePack.ДесериализоватьДанные(Двоичные);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "ДесериализоватьДанные", "RoundTrip", Исходное);

    Исходное = "Привет";
    Двоичные = OPI_MessagePack.СериализоватьДанные(Исходное);
    Результат = OPI_MessagePack.ДесериализоватьДанные(Двоичные);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "ДесериализоватьДанные", "RoundTrip", Исходное);

    Исходное = 0.2;
    Двоичные = OPI_MessagePack.СериализоватьДанные(Исходное);
    Результат = OPI_MessagePack.ДесериализоватьДанные(Двоичные);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "MessagePack", "ДесериализоватьДанные", "RoundTrip", Исходное);

КонецПроцедуры

#КонецОбласти // MessagePack

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли // !OPI
