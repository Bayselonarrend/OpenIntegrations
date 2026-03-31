// OneScript: ./OInt/tests/Modules/OPIt_RSS.os

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

#Использовать oint
#Использовать asserts
#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("RSS");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("RSS");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область RSS

Процедура RSS_МетодыRSS() Экспорт

    ПараметрыТеста = Новый Структура;

    RSS_СоздатьФидRSS(ПараметрыТеста);
    RSS_ПолучитьСтруктуруЭлементаФидаRSS(ПараметрыТеста);
    RSS_РазобратьФидRSS(ПараметрыТеста);

КонецПроцедуры

Процедура RSS_МетодыAtom() Экспорт

    ПараметрыТеста = Новый Структура;

    RSS_СоздатьФидAtom(ПараметрыТеста);
    RSS_ПолучитьСтруктуруЭлементаФидаAtom(ПараметрыТеста);
    RSS_РазобратьФидAtom(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // RSS

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область RSS

Процедура RSS_СоздатьФидRSS(ПараметрыФункции)

    НазваниеКанала = "Тестовый RSS канал";
    ОписаниеКанала = "Описание тестового RSS канала";
    СсылкаКанала   = "https://example.com";

    МассивЭлементов = Новый Массив;

    СтруктураЭлемента                = OPI_RSS.ПолучитьСтруктуруЭлементаФидаRSS(Истина);
    СтруктураЭлемента["title"]       = "Первый элемент";
    СтруктураЭлемента["description"] = "Описание первого элемента";
    СтруктураЭлемента["link"]        = "https://example.com/item1";
    СтруктураЭлемента["pubDate"]     = OPI_Инструменты.ПолучитьТекущуюДату();
    СтруктураЭлемента["author"]      = "test@example.com";
    СтруктураЭлемента["guid"]        = "item-1";

    МассивЭлементов.Добавить(СтруктураЭлемента);

    СтруктураЭлемента                = OPI_RSS.ПолучитьСтруктуруЭлементаФидаRSS(Истина);
    СтруктураЭлемента["title"]       = "Второй элемент";
    СтруктураЭлемента["description"] = "Описание второго элемента";
    СтруктураЭлемента["link"]        = "https://example.com/item2";
    СтруктураЭлемента["pubDate"]     = OPI_Инструменты.ПолучитьТекущуюДату();
    СтруктураЭлемента["author"]      = "test@example.com";
    СтруктураЭлемента["guid"]        = "item-2";

    МассивЭлементов.Добавить(СтруктураЭлемента);

    Результат = OPI_RSS.СоздатьФидRSS(НазваниеКанала, ОписаниеКанала, СсылкаКанала, МассивЭлементов);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "СоздатьФидRSS", , ПараметрыФункции);

КонецПроцедуры

Процедура RSS_ПолучитьСтруктуруЭлементаФидаRSS(ПараметрыФункции)

    Результат = OPI_RSS.ПолучитьСтруктуруЭлементаФидаRSS();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "ПолучитьСтруктуруЭлементаФидаRSS");

    Результат = OPI_RSS.ПолучитьСтруктуруЭлементаФидаRSS(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "ПолучитьСтруктуруЭлементаФидаRSS", "Пустая");

    Результат = OPI_RSS.ПолучитьСтруктуруЭлементаФидаRSS(Ложь, Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "ПолучитьСтруктуруЭлементаФидаRSS", "Соответствие");

КонецПроцедуры

Процедура RSS_РазобратьФидRSS(ПараметрыФункции)

    ФидXML = ПараметрыФункции["RSS_FeedXML"];

    Результат = OPI_RSS.РазобратьФидRSS(ФидXML);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "РазобратьФидRSS");

    OPI_Инструменты.УдалитьФайлВПопытке(ФидXML, "Не удалось удалить временный файл после теста!");

КонецПроцедуры

Процедура RSS_СоздатьФидAtom(ПараметрыФункции)

    НазваниеФида = "Тестовый Atom фид";
    СсылкаФида   = "https://example.com";
    IDФида       = "https://example.com/feed";

    МассивЭлементов = Новый Массив;

    СтруктураЭлемента              = OPI_RSS.ПолучитьСтруктуруЭлементаФидаAtom(Истина);
    СтруктураЭлемента["title"]     = "Первая запись";
    СтруктураЭлемента["id"]        = "https://example.com/entry1";
    СтруктураЭлемента["link"]      = "https://example.com/entry1";
    СтруктураЭлемента["updated"]   = OPI_Инструменты.ПолучитьТекущуюДату();
    СтруктураЭлемента["summary"]   = "Краткое описание первой записи";
    СтруктураЭлемента["content"]   = "Полное содержимое первой записи";
    СтруктураЭлемента["author"]    = "Автор Первый";
    СтруктураЭлемента["published"] = OPI_Инструменты.ПолучитьТекущуюДату();

    МассивЭлементов.Добавить(СтруктураЭлемента);

    СтруктураЭлемента              = OPI_RSS.ПолучитьСтруктуруЭлементаФидаAtom(Истина);
    СтруктураЭлемента["title"]     = "Вторая запись";
    СтруктураЭлемента["id"]        = "https://example.com/entry2";
    СтруктураЭлемента["link"]      = "https://example.com/entry2";
    СтруктураЭлемента["updated"]   = OPI_Инструменты.ПолучитьТекущуюДату();
    СтруктураЭлемента["summary"]   = "Краткое описание второй записи";
    СтруктураЭлемента["content"]   = "Полное содержимое второй записи";
    СтруктураЭлемента["author"]    = "Автор Второй";
    СтруктураЭлемента["published"] = OPI_Инструменты.ПолучитьТекущуюДату();

    МассивЭлементов.Добавить(СтруктураЭлемента);

    Результат = OPI_RSS.СоздатьФидAtom(НазваниеФида, СсылкаФида, IDФида, МассивЭлементов);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "СоздатьФидAtom", , ПараметрыФункции);

КонецПроцедуры

Процедура RSS_ПолучитьСтруктуруЭлементаФидаAtom(ПараметрыФункции)

    Результат = OPI_RSS.ПолучитьСтруктуруЭлементаФидаAtom();

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "ПолучитьСтруктуруЭлементаФидаAtom");

    Результат = OPI_RSS.ПолучитьСтруктуруЭлементаФидаAtom(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "ПолучитьСтруктуруЭлементаФидаAtom", "Пустая");

    Результат = OPI_RSS.ПолучитьСтруктуруЭлементаФидаAtom(Ложь, Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "ПолучитьСтруктуруЭлементаФидаAtom", "Соответствие");

КонецПроцедуры

Процедура RSS_РазобратьФидAtom(ПараметрыФункции)

    ФидXML = ПараметрыФункции["RSS_AtomFeedXML"];

    Результат = OPI_RSS.РазобратьФидAtom(ФидXML);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "RSS", "РазобратьФидAtom");

    OPI_Инструменты.УдалитьФайлВПопытке(ФидXML, "Не удалось удалить временный файл после теста!");

КонецПроцедуры

#КонецОбласти // RSS

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#Region Alternate

Procedure RSS_RSSMethods() Export
    RSS_МетодыRSS();
EndProcedure

Procedure RSS_AtomMethods() Export
    RSS_МетодыAtom();
EndProcedure

#EndRegion