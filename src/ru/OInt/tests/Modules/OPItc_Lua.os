// OneScript: ./OInt/tests/Modules/OPItc_Lua.os

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

#Использовать "../../tools/main"
#Использовать "../../tools/http"
#Использовать "../../api"
#Использовать asserts
#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯксCLI("Lua");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертсCLI("Lua");

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

    OPI_ПолучениеДанныхТестов.УстановитьПризнакТестаCLI(Истина);

    Если OPI_ПолучениеДанныхТестов.ЭтоТестCLI() Тогда
        Сообщить("CLI SKIP");
        Возврат;
    КонецЕсли;

    Lua_Расширенная_ОшибкаВыполненияКода();
    Lua_Расширенная_ПолучитьЛогБезИнициализации();
    Lua_Расширенная_ПолучитьЛогПриВыполнении();
    Lua_Расширенная_ПередатьСложныеДанные();
    Lua_Расширенная_ПередатьМассивСмешанныхТипов();

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

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "СоздатьVM", "Lua54");

    Результат = OPI_Lua.СоздатьVM("LuaJIT");

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "СоздатьVM", "LuaJIT");

КонецПроцедуры

Процедура Lua_ЭтоVM()

    VM54 = OPI_Lua.СоздатьVM("Lua54");

    Результат = OPI_Lua.ЭтоVM(VM54);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "ЭтоVM", "Lua54"); // SKIP

    Результат = OPI_Lua.ЭтоVM("not a vm");

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "ЭтоVM", "Ложь");

КонецПроцедуры

Процедура Lua_ВыполнитьКодИзСтроки()

    Опции = Новый Структура;
    Опции.Вставить("lua", "Lua54");
    Опции.Вставить("code", "return 42");

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "ВыполнитьКодИзСтроки", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "ВыполнитьКодИзСтроки");

КонецПроцедуры

Процедура Lua_ВыполнитьКодИзФайла()

    ФайлСкрипта = ПолучитьИмяВременногоФайла("lua");
    ПолучитьДвоичныеДанныеИзСтроки("return 7").Записать(ФайлСкрипта);

    Опции = Новый Структура;
    Опции.Вставить("lua", "Lua54");
    Опции.Вставить("path", ФайлСкрипта);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "ВыполнитьКодИзФайла", Опции);

    OPI_Инструменты.УдалитьФайлВПопытке(ФайлСкрипта, "Не удалось удалить временный файл после теста!");

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "ВыполнитьКодИзФайла");

КонецПроцедуры

Процедура Lua_ВызватьФункцию()

    VM = OPI_Lua.СоздатьVM("Lua54");

    OPI_Lua.ВыполнитьКодИзСтроки(VM, "function add(a, b) return a + b end");

    Параметры = Новый Массив;
    Параметры.Добавить(1);
    Параметры.Добавить(2);

    Опции = Новый Структура;
    Опции.Вставить("lua", VM);
    Опции.Вставить("func", "add");
    Опции.Вставить("params", Параметры);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "ВызватьФункцию", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "ВызватьФункцию");

КонецПроцедуры

Процедура Lua_СкомпилироватьКодИзСтроки()

    Опции = Новый Структура;
    Опции.Вставить("lua", "Lua54");
    Опции.Вставить("code", "return 1");

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "СкомпилироватьКодИзСтроки", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "СкомпилироватьКодИзСтроки");

КонецПроцедуры

Процедура Lua_СкомпилироватьКодИзФайла()

    ФайлСкрипта = ПолучитьИмяВременногоФайла("lua");
    ПолучитьДвоичныеДанныеИзСтроки("return 3").Записать(ФайлСкрипта);

    Опции = Новый Структура;
    Опции.Вставить("lua", "Lua54");
    Опции.Вставить("path", ФайлСкрипта);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "СкомпилироватьКодИзФайла", Опции);

    OPI_Инструменты.УдалитьФайлВПопытке(ФайлСкрипта, "Не удалось удалить временный файл после теста!");

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "СкомпилироватьКодИзФайла");

КонецПроцедуры

Процедура Lua_ВыполнитьБайтКод()

    Опции = Новый Структура;
    Опции.Вставить("lua", "Lua54");
    Опции.Вставить("code", "return 11");

    БайтКод = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "СкомпилироватьКодИзСтроки", Опции);
    Результат = OPI_Lua.ВыполнитьБайтКод("Lua54", БайтКод);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "ВыполнитьБайтКод");

КонецПроцедуры

Процедура Lua_ВыполнитьБайтКодФайла()

    ФайлСкрипта = ПолучитьИмяВременногоФайла("lua");
    ПолучитьДвоичныеДанныеИзСтроки("return 13").Записать(ФайлСкрипта);

    ФайлБайтКода = ПолучитьИмяВременногоФайла("bin");
    Опции = Новый Структура;
    Опции.Вставить("lua", "Lua54");
    Опции.Вставить("path", ФайлСкрипта);

    БайтКод = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "СкомпилироватьКодИзФайла", Опции);
    БайтКод.Записать(ФайлБайтКода);

    Опции = Новый Структура;
    Опции.Вставить("lua", "Lua54");
    Опции.Вставить("path", ФайлБайтКода);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "ВыполнитьБайтКодФайла", Опции);

    OPI_Инструменты.УдалитьФайлВПопытке(ФайлСкрипта , "Не удалось удалить временный файл после теста!");
    OPI_Инструменты.УдалитьФайлВПопытке(ФайлБайтКода, "Не удалось удалить временный файл после теста!");

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "ВыполнитьБайтКодФайла");

КонецПроцедуры

#Область РасширеннаяПроверка

Процедура Lua_Расширенная_ОшибкаВыполненияКода()

    Компонента = OPI_Компоненты.ПолучитьКомпоненту("Lua54");
    Результат  = OPI_Компоненты.ДесериализоватьJanx(Компонента.ExecuteString("syntax error !!!"));

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "Расширенная_ОшибкаВыполненияКода");

КонецПроцедуры

Процедура Lua_Расширенная_ПолучитьЛогБезИнициализации()

    Компонента = OPI_Lua.СоздатьVM("Lua54");
    Результат  = OPI_Компоненты.ДесериализоватьJanx(Компонента.GetLogs(10));

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "Расширенная_ПолучитьЛогБезИнициализации");

КонецПроцедуры

Процедура Lua_Расширенная_ПолучитьЛогПриВыполнении()

    ФайлЛога             = ПолучитьИмяВременногоФайла("txt");
    НастройкиЛогирования = OPI_Компоненты.ПолучитьНастройкиЛогирования(Истина, 100, ФайлЛога);

    VM = OPI_Lua.СоздатьVM("Lua54", НастройкиЛогирования);

    OPI_Lua.ВыполнитьКодИзСтроки(VM, "return 1");

    Результат = OPI_Компоненты.ДесериализоватьJanx(VM.GetLogs(10));

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "Расширенная_ПолучитьЛогПриВыполнении", , ФайлЛога);

КонецПроцедуры

Процедура Lua_Расширенная_ПередатьСложныеДанные()

    VM = OPI_Lua.СоздатьVM("Lua54");

    OPI_Lua.ВыполнитьКодИзСтроки(VM, "function echo(v) return v end");

    Исходное = OPI_ПолучениеДанныхТестов.ПолучитьТестовуюКоллекциюJanx("LuaСложныеДанные");

    Параметры = Новый Массив;
    Параметры.Добавить(Исходное);

    Опции = Новый Структура;
    Опции.Вставить("lua", VM);
    Опции.Вставить("func", "echo");
    Опции.Вставить("params", Параметры);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "ВызватьФункцию", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "Расширенная_ПередатьСложныеДанные", , Исходное);

КонецПроцедуры

Процедура Lua_Расширенная_ПередатьМассивСмешанныхТипов()

    VM = OPI_Lua.СоздатьVM("Lua54");

    OPI_Lua.ВыполнитьКодИзСтроки(VM, "function echo(v) return v end");

    Исходное = OPI_ПолучениеДанныхТестов.ПолучитьТестовуюКоллекциюJanx("LuaМассивСмешанный");

    Параметры = Новый Массив;
    Параметры.Добавить(Исходное);

    Опции = Новый Структура;
    Опции.Вставить("lua", VM);
    Опции.Вставить("func", "echo");
    Опции.Вставить("params", Параметры);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("lua", "ВызватьФункцию", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "Lua", "Расширенная_ПередатьМассивСмешанныхТипов", , Исходное);

КонецПроцедуры

#КонецОбласти // РасширеннаяПроверка

#КонецОбласти // Lua

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure Lua_CommonMethods() Export
    Lua_ОсновныеМетоды();
EndProcedure

Procedure Lua_WorkingWithScripts() Export
    Lua_РаботаСоСкриптами();
EndProcedure

Procedure Lua_BytecodeManagement() Export
    Lua_РаботаСБайткодом();
EndProcedure

Procedure Lua_ExtendedCheck() Export
    Lua_РасширеннаяПроверка();
EndProcedure

#EndRegion
