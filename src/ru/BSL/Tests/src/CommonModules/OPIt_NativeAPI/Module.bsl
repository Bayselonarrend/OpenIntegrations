// OneScript: ./OInt/tests/Modules/OPIt_NativeAPI.os

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MethodSize-off
// BSLLS:NumberOfOptionalParams-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check module-unused-local-variable

#Если Не ВебКлиент Тогда // !OPI

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("NativeAPI");

КонецПроцедуры

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("NativeAPI");

КонецФункции

#Область ЗапускаемыеТесты

Процедура NativeAPI_ОсновныеМетоды() Экспорт

    NativeAPI_ПолучитьНастройкиЛогирования();
    NativeAPI_ОткрытьКомпоненту();
    NativeAPI_ЭтоХост();
    NativeAPI_ПолучитьЛог();

КонецПроцедуры

Процедура NativeAPI_РаботаСБиблиотекой() Экспорт

    NativeAPI_ОткрытьКомпоненту();
    NativeAPI_ПолучитьИменаКлассов();

КонецПроцедуры

Процедура NativeAPI_РаботаСЭкземпляром() Экспорт

    NativeAPI_ОткрытьКомпоненту();
    NativeAPI_СоздатьЭкземпляр();
    NativeAPI_ПолучитьМетаданные();
    NativeAPI_ПолучитьСвойства();
    NativeAPI_ВызватьМетод();
    NativeAPI_ПолучитьСвойство();
    NativeAPI_УстановитьСвойство();
    NativeAPI_УничтожитьЭкземпляр();

КонецПроцедуры

#КонецОбласти

#Область АтомарныеТесты

Процедура NativeAPI_ПолучитьНастройкиЛогирования()

    Результат = OPI_NativeAPI.ПолучитьНастройкиЛогирования(Истина, 100, ПолучитьИмяВременногоФайла());

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьНастройкиЛогирования");

    Результат = OPI_NativeAPI.ПолучитьНастройкиЛогирования(Ложь, , ПолучитьИмяВременногоФайла());

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьНастройкиЛогирования", "Файл");

    Результат = OPI_NativeAPI.ПолучитьНастройкиЛогирования(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьНастройкиЛогирования", "Память");

КонецПроцедуры

Процедура NativeAPI_ОткрытьКомпоненту()

    Путь = OPI_ПолучениеДанныхТестов.ПолучитьПутьКБиблиотекеКомпоненты("Cryptography");
    Результат = OPI_NativeAPI.ОткрытьКомпоненту(Путь);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ОткрытьКомпоненту");

    OPI_ПолучениеДанныхТестов.ЗаписатьПараметр("NativeAPI_Host", Результат);

КонецПроцедуры

Процедура NativeAPI_ЭтоХост()

    Хост = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Результат = OPI_NativeAPI.ЭтоХост(Хост);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ЭтоХост");

    Результат = OPI_NativeAPI.ЭтоХост("not a host");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ЭтоХост", "Ложь");

КонецПроцедуры

Процедура NativeAPI_ПолучитьЛог()

    ФайлЛога             = ПолучитьИмяВременногоФайла("txt");
    НастройкиЛогирования = OPI_NativeAPI.ПолучитьНастройкиЛогирования(Истина, 100, ФайлЛога);
    Путь                 = OPI_ПолучениеДанныхТестов.ПолучитьПутьКБиблиотекеКомпоненты("Cryptography");
    Хост                 = OPI_NativeAPI.ОткрытьКомпоненту(Путь, НастройкиЛогирования);

    Результат = OPI_NativeAPI.ПолучитьЛог(Хост);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьЛог", , ФайлЛога);

    Результат = OPI_NativeAPI.ПолучитьЛог(Хост, Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьЛог", "КакСтрока", ФайлЛога);

КонецПроцедуры

Процедура NativeAPI_ПолучитьИменаКлассов()

    Хост = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Результат = OPI_NativeAPI.ПолучитьИменаКлассов(Хост);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьИменаКлассов");

    Путь = OPI_ПолучениеДанныхТестов.ПолучитьПутьКБиблиотекеКомпоненты("Cryptography");
    Результат = OPI_NativeAPI.ПолучитьИменаКлассов(Путь);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьИменаКлассов", "Путь");

КонецПроцедуры

Процедура NativeAPI_СоздатьЭкземпляр()

    Хост = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Результат = OPI_NativeAPI.СоздатьЭкземпляр(Хост, "Main");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "СоздатьЭкземпляр");

    OPI_ПолучениеДанныхТестов.ЗаписатьПараметр("NativeAPI_Instance", Результат);

КонецПроцедуры

Процедура NativeAPI_УничтожитьЭкземпляр()

    Хост      = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Экземпляр = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Instance");
    Результат = OPI_NativeAPI.УничтожитьЭкземпляр(Хост, Экземпляр);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "УничтожитьЭкземпляр");

КонецПроцедуры

Процедура NativeAPI_ПолучитьМетаданные()

    Хост      = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Экземпляр = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Instance");
    Результат = OPI_NativeAPI.ПолучитьМетаданные(Хост, Экземпляр);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьМетаданные");

    Путь = OPI_ПолучениеДанныхТестов.ПолучитьПутьКБиблиотекеКомпоненты("Cryptography");
    Результат = OPI_NativeAPI.ПолучитьМетаданные(Путь, "Main");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьМетаданные", "Путь");

КонецПроцедуры

Процедура NativeAPI_ПолучитьСвойства()

    Хост      = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Экземпляр = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Instance");
    Результат = OPI_NativeAPI.ПолучитьСвойства(Хост, Экземпляр);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьСвойства");

КонецПроцедуры

Процедура NativeAPI_ВызватьМетод()

    Хост      = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Экземпляр = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Instance");
    Параметры = Новый Массив;
    Параметры.Добавить(Новый ДвоичныеДанные("key"));
    Параметры.Добавить(Новый ДвоичныеДанные("data"));

    Результат = OPI_NativeAPI.ВызватьМетод(Хост, Экземпляр, "HmacSha256", Параметры);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ВызватьМетод");

    Результат = OPI_NativeAPI.ВызватьМетод(Хост, Экземпляр, "Version", Новый Массив);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ВызватьМетод", "Version");

    Путь = OPI_ПолучениеДанныхТестов.ПолучитьПутьКБиблиотекеКомпоненты("Cryptography");
    Результат = OPI_NativeAPI.ВызватьМетод(Путь, "Main", "Version", Новый Массив);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ВызватьМетод", "Класс");

КонецПроцедуры

Процедура NativeAPI_ПолучитьСвойство()

    Хост      = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Экземпляр = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Instance");
    Результат = OPI_NativeAPI.ПолучитьСвойство(Хост, Экземпляр, "MissingProperty");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "ПолучитьСвойство");

КонецПроцедуры

Процедура NativeAPI_УстановитьСвойство()

    Хост      = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Host");
    Экземпляр = OPI_ПолучениеДанныхТестов.ПолучитьПараметр("NativeAPI_Instance");
    Результат = OPI_NativeAPI.УстановитьСвойство(Хост, Экземпляр, "MissingProperty", "value");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "NativeAPI", "УстановитьСвойство");

КонецПроцедуры

#КонецОбласти

#КонецЕсли // !OPI
