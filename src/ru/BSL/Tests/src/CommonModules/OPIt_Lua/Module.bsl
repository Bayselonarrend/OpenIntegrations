// OneScript: ./OInt/tests/Modules/OPIt_Lua.os

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

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("Lua");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("Lua");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область Lua

Процедура Lua_ОсновныеМетоды() Экспорт

    Lua_СоздатьVM();
    Lua_ЭтоVM();

КонецПроцедуры

Процедура Lua_РаботаСоСкриптами() Экспорт

    Lua_ВыполнитьКодИзСтроки();
    Lua_ВыполнитьКодИзФайла();
    Lua_ВызватьФункцию();

КонецПроцедуры

Процедура Lua_РаботаСБайткодом() Экспорт

    Lua_СкомпилироватьКодИзСтроки();
    Lua_СкомпилироватьКодИзФайла();
    Lua_ВыполнитьБайтКод();
    Lua_ВыполнитьБайтКодФайла();

КонецПроцедуры

Процедура Lua_РасширеннаяПроверка() Экспорт

    OPI_ПолучениеДанныхТестов.УстановитьПризнакТестаCLI(Ложь);

    Если OPI_ПолучениеДанныхТестов.ЭтоТестCLI() Тогда
        Сообщить("CLI SKIP");
        Возврат;
    КонецЕсли;

    Lua_Расширенная_ОшибкаВыполненияКода();
    Lua_Расширенная_ПолучитьЛогБезИнициализации();
    Lua_Расширенная_ПолучитьЛогПриВыполнении();

КонецПроцедуры

#КонецОбласти // Lua

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область Lua

Процедура Lua_СоздатьVM()

    Результат = OPI_Lua.СоздатьVM("Lua54");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "СоздатьVM", "Lua54");

    Результат = OPI_Lua.СоздатьVM("LuaJIT");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "СоздатьVM", "LuaJIT");

КонецПроцедуры

Процедура Lua_ЭтоVM()

    VM54 = OPI_Lua.СоздатьVM("Lua54");

    Результат = OPI_Lua.ЭтоVM(VM54);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "ЭтоVM", "Lua54"); // SKIP

    Результат = OPI_Lua.ЭтоVM("not a vm");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "ЭтоVM", "Ложь");

КонецПроцедуры

Процедура Lua_ВыполнитьКодИзСтроки()

    Результат = OPI_Lua.ВыполнитьКодИзСтроки("Lua54", "return 42");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "ВыполнитьКодИзСтроки");

КонецПроцедуры

Процедура Lua_ВыполнитьКодИзФайла()

    ФайлСкрипта = ПолучитьИмяВременногоФайла("lua");
    Запись      = Новый ЗаписьТекста(ФайлСкрипта, КодировкаТекста.UTF8);
    Запись.Записать("return 7");
    Запись.Закрыть();

    Результат = OPI_Lua.ВыполнитьКодИзФайла("Lua54", ФайлСкрипта);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "ВыполнитьКодИзФайла");

КонецПроцедуры

Процедура Lua_ВызватьФункцию()

    VM = OPI_Lua.СоздатьVM("Lua54");

    OPI_Lua.ВыполнитьКодИзСтроки(VM, "function add(a, b) return a + b end");

    Параметры = Новый Массив;
    Параметры.Добавить(1);
    Параметры.Добавить(2);

    Результат = OPI_Lua.ВызватьФункцию(VM, "add", Параметры);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "ВызватьФункцию");

КонецПроцедуры

Процедура Lua_СкомпилироватьКодИзСтроки()

    Результат = OPI_Lua.СкомпилироватьКодИзСтроки("Lua54", "return 1");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "СкомпилироватьКодИзСтроки");

КонецПроцедуры

Процедура Lua_СкомпилироватьКодИзФайла()

    ФайлСкрипта = ПолучитьИмяВременногоФайла("lua");
    Запись      = Новый ЗаписьТекста(ФайлСкрипта, КодировкаТекста.UTF8);
    Запись.Записать("return 3");
    Запись.Закрыть();

    Результат = OPI_Lua.СкомпилироватьКодИзФайла("Lua54", ФайлСкрипта);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "СкомпилироватьКодИзФайла");

КонецПроцедуры

Процедура Lua_ВыполнитьБайтКод()

    БайтКод   = OPI_Lua.СкомпилироватьКодИзСтроки("Lua54", "return 11");
    Результат = OPI_Lua.ВыполнитьБайтКод("Lua54", БайтКод);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "ВыполнитьБайтКод");

КонецПроцедуры

Процедура Lua_ВыполнитьБайтКодФайла()

    ФайлСкрипта = ПолучитьИмяВременногоФайла("lua");
    Запись      = Новый ЗаписьТекста(ФайлСкрипта, КодировкаТекста.UTF8);
    Запись.Записать("return 13");
    Запись.Закрыть();

    ФайлБайтКода = ПолучитьИмяВременногоФайла("bin");
    БайтКод      = OPI_Lua.СкомпилироватьКодИзФайла("Lua54", ФайлСкрипта);

    ЗаписьБин = Новый ЗаписьДвоичныхДанных(ФайлБайтКода);
    ЗаписьБин.Записать(БайтКод);
    ЗаписьБин.Закрыть();

    Результат = OPI_Lua.ВыполнитьБайтКодФайла("Lua54", ФайлБайтКода);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "ВыполнитьБайтКодФайла");

КонецПроцедуры

#Область РасширеннаяПроверка

Процедура Lua_Расширенная_ОшибкаВыполненияКода()

    Компонента = OPI_Компоненты.ПолучитьКомпоненту("Lua54");
    Результат  = OPI_Компоненты.ДесериализоватьJanx(Компонента.ExecuteString("syntax error !!!"));

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "Расширенная_ОшибкаВыполненияКода");

КонецПроцедуры

Процедура Lua_Расширенная_ПолучитьЛогБезИнициализации()

    Компонента = OPI_Lua.СоздатьVM("Lua54");
    Результат  = OPI_Компоненты.ДесериализоватьJanx(Компонента.GetLogs(10));

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "Расширенная_ПолучитьЛогБезИнициализации");

КонецПроцедуры

Процедура Lua_Расширенная_ПолучитьЛогПриВыполнении()

    ФайлЛога             = ПолучитьИмяВременногоФайла("txt");
    НастройкиЛогирования = OPI_Компоненты.ПолучитьНастройкиЛогирования(Истина, 100, ФайлЛога);

    VM = OPI_Lua.СоздатьVM("Lua54", НастройкиЛогирования);

    OPI_Lua.ВыполнитьКодИзСтроки(VM, "return 1");

    Результат = OPI_Компоненты.ДесериализоватьJanx(VM.GetLogs(10));

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Lua", "Расширенная_ПолучитьЛогПриВыполнении", , ФайлЛога);

КонецПроцедуры

#КонецОбласти // РасширеннаяПроверка

#КонецОбласти // Lua

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли // !OPI
