// OneScript: ./OInt/tests/Modules/OPIt_Janx.os

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

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("Janx");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("Janx");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область Janx

Процедура Jnx_Данные() Экспорт

    Janx_СериализоватьДанные();
    Janx_ДесериализоватьДанные();

КонецПроцедуры

Процедура Jnx_Бенчмарк() Экспорт

    Janx_Бенчмарк();

КонецПроцедуры

#КонецОбласти // Janx

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область Janx

Процедура Janx_СериализоватьДанные()

    Исходное = "Привет";
    Результат = OPI_Janx.СериализоватьДанные(Исходное);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "СериализоватьДанные", "Строка", Исходное);

    Исходное = 42;
    Результат = OPI_Janx.СериализоватьДанные(Исходное);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "СериализоватьДанные", "Число", Исходное);

    Исходное = ПолучитьДвоичныеДанныеИзСтроки("");
    Результат = OPI_Janx.СериализоватьДанные(Исходное);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "СериализоватьДанные", "ПустойБинарник", Исходное);

    Исходное = ПолучитьДвоичныеДанныеИзHexСтроки("010203");
    Результат = OPI_Janx.СериализоватьДанные(Исходное);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "СериализоватьДанные", "Бинарник", Исходное);

    Карта = Новый Соответствие;
    Карта.Вставить("name", "test");
    Карта.Вставить("body", ПолучитьДвоичныеДанныеИзHexСтроки("DEADBEEF"));
    Результат = OPI_Janx.СериализоватьДанные(Карта);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "СериализоватьДанные", "КартаСБинарником", Карта);

    Массив = Новый Массив;
    Массив.Добавить(1);
    Массив.Добавить(ПолучитьДвоичныеДанныеИзHexСтроки("0A0B"));
    Результат = OPI_Janx.СериализоватьДанные(Массив);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "СериализоватьДанные", "МассивСБинарником", Массив);

КонецПроцедуры

Процедура Janx_ДесериализоватьДанные()

    Исходное = "Привет";
    Двоичные = OPI_Janx.СериализоватьДанные(Исходное);
    Результат = OPI_Janx.ДесериализоватьДанные(Двоичные);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "ДесериализоватьДанные", "Строка", Исходное);

    Исходное = ПолучитьДвоичныеДанныеИзHexСтроки("CAFEBABE");
    Двоичные = OPI_Janx.СериализоватьДанные(Исходное);
    Результат = OPI_Janx.ДесериализоватьДанные(Двоичные);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "ДесериализоватьДанные", "Бинарник", Исходное);

    Исходное = Новый Соответствие;
    Исходное.Вставить("a", 1);
    Исходное.Вставить("b", ПолучитьДвоичныеДанныеИзHexСтроки("FF"));
    Двоичные = OPI_Janx.СериализоватьДанные(Исходное);
    Результат = OPI_Janx.ДесериализоватьДанные(Двоичные);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "ДесериализоватьДанные", "КартаСБинарником", Исходное);

    Двоичные = OPI_Janx.СериализоватьДанные(Исходное);
    Результат = OPI_Janx.ДесериализоватьДанные(Двоичные);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "ДесериализоватьДанные", "Префикс", Двоичные);

КонецПроцедуры

Процедура Janx_Бенчмарк()

    Элементы     = Новый Массив;
    ЭлементыJson = Новый Массив;

    Для Индекс = 0 По 499 Цикл

        Элемент = Новый Структура;
        Элемент.Вставить("index", Индекс);
        Элемент.Вставить("flag", Индекс % 2 = 0);
        Элемент.Вставить("title", "item_" + Индекс);
        Элемент.Вставить("ratio", Индекс / 3.0);
        Элемент.Вставить("payload", ПолучитьДвоичныеДанныеИзHexСтроки("0102030405060708090A0B0C0D0E0F"));

        Если Индекс % 7 = 0 Тогда
            Элемент.Вставить("note", Неопределено);
        КонецЕсли;

        СписокЧисел = Новый Массив;

        Для ПодИндекс = 0 По 7 Цикл
            СписокЧисел.Добавить(Индекс * 10 + ПодИндекс);
        КонецЦикла;

        Элемент.Вставить("values", СписокЧисел);

        Атрибуты = Новый Соответствие;
        Атрибуты.Вставить("group", "g" + (Индекс % 10));
        Атрибуты.Вставить("enabled", Индекс % 3 <> 0);

        Если Индекс % 5 = 0 Тогда
            Атрибуты.Вставить("extra", Неопределено);
        КонецЕсли;

        Элемент.Вставить("attrs", Атрибуты);
        Элементы.Добавить(Элемент);

        ЭлементJson = Новый Структура;
        ЭлементJson.Вставить("index", Индекс);
        ЭлементJson.Вставить("flag", Индекс % 2 = 0);
        ЭлементJson.Вставить("title", "item_" + Индекс);
        ЭлементJson.Вставить("ratio", Индекс / 3.0);

        Если Индекс % 7 = 0 Тогда
            ЭлементJson.Вставить("note", Неопределено);
        КонецЕсли;

        ЭлементJson.Вставить("values", СписокЧисел);
        ЭлементJson.Вставить("attrs", Атрибуты);
        ЭлементыJson.Добавить(ЭлементJson);

    КонецЦикла;

    Исходное = Новый Структура;
    Исходное.Вставить("version", 1);
    Исходное.Вставить("label", "benchmark");
    Исходное.Вставить("root", Неопределено);
    Исходное.Вставить("items", Элементы);

    ИсходноеJson = Новый Структура;
    ИсходноеJson.Вставить("version", 1);
    ИсходноеJson.Вставить("label", "benchmark");
    ИсходноеJson.Вставить("root", Неопределено);
    ИсходноеJson.Вставить("items", ЭлементыJson);

    Результат = Новый Структура;

    Начало = ТекущаяУниверсальнаяДатаВМиллисекундах();
    JsonСтрока = OPI_Инструменты.JSONСтрокой(ИсходноеJson, "Нет", Ложь);
    Результат.Вставить("JsonСериализацияМс", ТекущаяУниверсальнаяДатаВМиллисекундах() - Начало);
    Результат.Вставить("JsonСтрока", JsonСтрока);

    Начало = ТекущаяУниверсальнаяДатаВМиллисекундах();
    JsonВосстановленное = OPI_Инструменты.JsonВСтруктуру(JsonСтрока, Истина);
    Результат.Вставить("JsonДесериализацияМс", ТекущаяУниверсальнаяДатаВМиллисекундах() - Начало);
    Результат.Вставить("JsonВосстановленное", JsonВосстановленное);

    Начало = ТекущаяУниверсальнаяДатаВМиллисекундах();
    JanxДанные = OPI_Janx.СериализоватьДанные(Исходное);
    Результат.Вставить("JanxСериализацияМс", ТекущаяУниверсальнаяДатаВМиллисекундах() - Начало);
    Результат.Вставить("JanxДанные", JanxДанные);

    Начало = ТекущаяУниверсальнаяДатаВМиллисекундах();
    JanxВосстановленное = OPI_Janx.ДесериализоватьДанные(JanxДанные);
    Результат.Вставить("JanxДесериализацияМс", ТекущаяУниверсальнаяДатаВМиллисекундах() - Начало);
    Результат.Вставить("JanxВосстановленное", JanxВосстановленное);

    Начало = ТекущаяУниверсальнаяДатаВМиллисекундах();
    JanxДанныеБезBin = OPI_Janx.СериализоватьДанные(ИсходноеJson);
    Результат.Вставить("JanxСериализацияБезBinМс", ТекущаяУниверсальнаяДатаВМиллисекундах() - Начало);
    Результат.Вставить("JanxДанныеБезBin", JanxДанные);

    Начало = ТекущаяУниверсальнаяДатаВМиллисекундах();
    JanxВосстановленноеБезBin = OPI_Janx.ДесериализоватьДанные(JanxДанныеБезBin);
    Результат.Вставить("JanxДесериализацияБезBinМс", ТекущаяУниверсальнаяДатаВМиллисекундах() - Начало);
    Результат.Вставить("JanxВосстановленноеБезBin", JanxВосстановленное);
    
    БуферJanx = ПолучитьБуферДвоичныхДанныхИзДвоичныхДанных(JanxДанные);
    РазмерJSONJanx = БуферJanx.Получить(0) * 16777216
        + БуферJanx.Получить(1) * 65536
        + БуферJanx.Получить(2) * 256
        + БуферJanx.Получить(3);
    Результат.Вставить("РазмерAppendix", JanxДанные.Размер() - 4 - РазмерJSONJanx);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Janx", "Бенчмарк", , Исходное);

КонецПроцедуры

#КонецОбласти // Janx

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли // !OPI
