// OneScript: ./OInt/api/metrika/Modules/OPI_RSS.os
// Lib: RSS
// CLI: rss

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
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Использовать "../../../tools/main"
#Использовать "../../../tools/http"

#Область ПрограммныйИнтерфейс

#Область ОсновныеМетоды

// Создать фид RSS
// Создает текст RSS фида
//
// Параметры:
//  НазваниеКанала - Строка              - Название канала                                     - name
//  ОписаниеКанала - Строка              - Описание канала                                     - descr
//  СсылкаКанала   - Строка              - Ссылка канала                                       - link
//  Элементы       - Массив Из Структура - Элементы фида. См. ПолучитьСтруктуруЭлементаФидаRSS - items
//  ДатаОбновления - Дата, Неопределено  - Дата обновления. Текущая, если не заполнено         - date
//
// Возвращаемое значение:
//  Строка - XML фид канала
Функция СоздатьФидRSS(Знач НазваниеКанала
    , Знач ОписаниеКанала
    , Знач СсылкаКанала
    , Знач Элементы
    , Знач ДатаОбновления = Неопределено) Экспорт

    //@skip-check use-non-recommended-method
    ДатаОбновления = ?(ДатаОбновления = Неопределено
        , OPI_Инструменты.ПолучитьТекущуюДату()
        , ДатаОбновления);

    OPI_ПреобразованиеТипов.ПолучитьСтроку(НазваниеКанала);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ОписаниеКанала);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(СсылкаКанала);
    OPI_ПреобразованиеТипов.ПолучитьМассив(Элементы);
    OPI_ПреобразованиеТипов.ПолучитьДату(ДатаОбновления);

    ЗаписьXML = Новый ЗаписьXML;
    ЗаписьXML.УстановитьСтроку("UTF-8");

    ЗаписьXML.ЗаписатьОбъявлениеXML();
    ЗаписьXML.ЗаписатьНачалоЭлемента("rss");
    ЗаписьXML.ЗаписатьАтрибут("version", "2.0");

    ЗаписьXML.ЗаписатьНачалоЭлемента("channel");
    ЗаписатьЭлементXML(ЗаписьXML, "title"      , НазваниеКанала);
    ЗаписатьЭлементXML(ЗаписьXML, "link"       , СсылкаКанала);
    ЗаписатьЭлементXML(ЗаписьXML, "description", ОписаниеКанала);

    ДатаRFC822 = OPI_Инструменты.ДатаRFC822(ДатаОбновления);
    ЗаписатьЭлементXML(ЗаписьXML, "lastBuildDate", ДатаRFC822);

    Для Каждого Элемент Из Элементы Цикл
        ЗаписатьЭлементФида(ЗаписьXML, Элемент);
    КонецЦикла;

    ЗаписьXML.ЗаписатьКонецЭлемента();
    ЗаписьXML.ЗаписатьКонецЭлемента();

    Фид = ЗаписьXML.Закрыть();

    Возврат Фид;

КонецФункции

// Получить структуру элемента фида RSS
// Получает структуру параметров элемента RSS фида
//
// Параметры:
//  Пустая          - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//  КакСоответствие - Булево - Истина > возвращает поля как соответствие                                        - map
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей элемента фида
Функция ПолучитьСтруктуруЭлементаФидаRSS(Знач Пустая = Ложь, Знач КакСоответствие = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);
    OPI_ПреобразованиеТипов.ПолучитьБулево(КакСоответствие);

    Если КакСоответствие Тогда
        СтруктураЭлемента = Новый Соответствие;
    Иначе
        СтруктураЭлемента = Новый Структура;
    КонецЕсли;

    СтруктураЭлемента.Вставить("title"       , "<заголовок элемента>");
    СтруктураЭлемента.Вставить("description" , "<описание/содержимое элемента>");
    СтруктураЭлемента.Вставить("link"        , "<URL элемента>");
    СтруктураЭлемента.Вставить("pubDate"     , "<дата публикации>");
    СтруктураЭлемента.Вставить("author"      , "<email автора>");
    СтруктураЭлемента.Вставить("guid"        , "<уникальный идентификатор элемента>");

    Если Пустая Тогда
        СтруктураЭлемента = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураЭлемента);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураЭлемента;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЗаписатьЭлементXML(ЗаписьXML, ИмяЭлемента, Значение)

    Если ЗначениеЗаполнено(Значение) Тогда
        ЗаписьXML.ЗаписатьНачалоЭлемента(ИмяЭлемента);
        ЗаписьXML.ЗаписатьТекст(Значение);
        ЗаписьXML.ЗаписатьКонецЭлемента();
    КонецЕсли;

КонецПроцедуры

Процедура ЗаписатьЭлементФида(ЗаписьXML, Элемент)

    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Элемент);

    ЗаписьXML.ЗаписатьНачалоЭлемента("item");

    Для Каждого ПолеДанных Из Элемент Цикл

        ТекущийКлюч     = ПолеДанных.Ключ;
        ТекущееЗначение = ПолеДанных.Значение;

        Если ТипЗнч(ТекущееЗначение) = Тип("Дата") Тогда
            ТекущееЗначение = OPI_Инструменты.ДатаRFC822(ТекущееЗначение);
        Иначе
            OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущееЗначение, Ложь);
        КонецЕсли;

        Если ТекущийКлюч = "guid" Тогда
            ЗаписьXML.ЗаписатьНачалоЭлемента("guid");
            ЗаписьXML.ЗаписатьАтрибут("isPermaLink", "false");
            ЗаписьXML.ЗаписатьТекст(ТекущееЗначение);
            ЗаписьXML.ЗаписатьКонецЭлемента();
        Иначе
            ЗаписатьЭлементXML(ЗаписьXML, ТекущийКлюч, ТекущееЗначение);
        КонецЕсли;

    КонецЦикла;

    ЗаписьXML.ЗаписатьКонецЭлемента();

КонецПроцедуры

#КонецОбласти

#Region Alternate

Function CreateFeedRSS(Val ChannelTitle, Val ChannelDescription, Val ChannelLink, Val Items, Val UpdateDate = Undefined) Export
    Return СоздатьФидRSS(ChannelTitle, ChannelDescription, ChannelLink, Items, UpdateDate);
EndFunction

Function GetFeedItemStructureRSS(Val Clear = False, Val AsMap = False) Export
    Return ПолучитьСтруктуруЭлементаФидаRSS(Clear, AsMap);
EndFunction

#EndRegion