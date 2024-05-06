// Библиотека: Airtable
// Команда CLI: Airtable

// MIT License

// Copyright (c) 2023 Anton Tsitavets

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

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область РаботаСБазами

Функция СоздатьБазу(Знач Токен, Знач РабочееПространство, Знач Наименование, Знач КоллекцияТаблиц) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(КоллекцияТаблиц);
    
    Если Не ТипЗнч(КоллекцияТаблиц) = Тип("Структура")
        И Не ТипЗнч(КоллекцияТаблиц) = Тип("Соответствие") Тогда
        
        ВызватьИсключение "Ошибка в данных коллекции таблиц";
        
    КонецЕсли;
    
    URL           = "https://api.airtable.com/v0/meta/bases";
    Заголовки     = ПолучитьЗаголовокАвторизации(Токен);
    МассивТаблиц  = Новый Массив;
    
    Для Каждого Таблица Из КоллекцияТаблиц Цикл
        
        Описание = СформироватьОписаниеТаблицы(Таблица.Ключ, Таблица.Значение);
        МассивТаблиц.Добавить(Описание);
        
    КонецЦикла;
 
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("name"       , Наименование       , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("tables"     , МассивТаблиц       , "Массив", Параметры);
    OPI_Инструменты.ДобавитьПоле("workspaceId", РабочееПространство, "Строка", Параметры);
     
    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область ФормированиеПолей

Функция ПолучитьПолеСтроковое(Знач Наименование) Экспорт
    Возврат ОписаниеПримитовногоПоля(Наименование, "richText");
КонецФункции

Функция ПолучитьПолеНомера(Знач Наименование, Знач Точность = 0) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьЧисло(Точность);
    
    СтруктураОпций = Новый Структура("precision", Точность);
    Возврат ОписаниеПримитовногоПоля(Наименование, "number", СтруктураОпций);
    
КонецФункции

#КонецОбласти


#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьЗаголовокАвторизации(Знач Токен) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    
    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "Bearer " + Токен);
    
    Возврат Заголовки;
    
КонецФункции

Функция СформироватьОписаниеТаблицы(Знач Наименование, Знач МассивПолей)
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивПолей);
    
    ОписаниеТаблицы = Новый Структура("name,fields", Наименование, МассивПолей);
    
    Возврат ОписаниеТаблицы;
    
КонецФункции

Функция ОписаниеПримитовногоПоля(Знач Наименование, Знач Тип, Знач Опции = "")
    
    СтруктураПоля = Новый Структура();
    OPI_Инструменты.ДобавитьПоле("name"   , Наименование, "Строка"   , СтруктураПоля);
    OPI_Инструменты.ДобавитьПоле("type"   , Тип         , "Строка"   , СтруктураПоля);
    OPI_Инструменты.ДобавитьПоле("options", Опции       , "Коллекция", СтруктураПоля);
    
    Возврат СтруктураПоля;

КонецФункции

#КонецОбласти