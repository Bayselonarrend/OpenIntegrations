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

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область РаботаСФайлами

Функция ПолучитьСписокКаталогов(Знач Токен, Знач ИмяСодержит = "", Знач Подробно = Ложь) Экспорт
    
    Заголовки      = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    МассивОбъектов = Новый Массив;
    Отбор          = Новый Массив;
    
    Отбор.Добавить("mimeType = 'application/vnd.google-apps.folder'");
    
    Если ЗначениеЗаполнено(ИмяСодержит) Тогда
        Отбор.Добавить("name contains '" + ИмяСодержит + "'");
    КонецЕсли;
    
    ПолучитьСписокОбъектовРекурсивно(Заголовки, МассивОбъектов, Подробно, Отбор);
    
    Если Подробно Тогда
        РазложитьОбъектыПодробно(Токен, МассивОбъектов);    
    КонецЕсли;
    
    Возврат МассивОбъектов;
    
КонецФункции

Функция ПолучитьСписокФайлов(Знач Токен, Знач ИмяСодержит = "", Знач Каталог = "") Экспорт
    
    Заголовки      = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    МассивОбъектов = Новый Массив;
    Отбор          = Новый Массив;
    
    Отбор.Добавить("mimeType != 'application/vnd.google-apps.folder'");
    
    Если ЗначениеЗаполнено(ИмяСодержит) Тогда
        Отбор.Добавить("name contains '" + ИмяСодержит + "'");
    КонецЕсли;
    
    Если ЗначениеЗаполнено(Каталог) Тогда
        Отбор.Добавить("'" + Каталог + "' in parents");
    КонецЕсли;
    
    ПолучитьСписокОбъектовРекурсивно(Заголовки, МассивОбъектов, , Отбор);
    
    Возврат МассивОбъектов;

КонецФункции

Функция ПолучитьИнформациюОбОбъекте(Знач Токен, Знач Идентификатор) Экспорт
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор;    
    Ответ     = OPI_Инструменты.Get(URL, , Заголовки);
    
    Возврат Ответ;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПолучитьСписокОбъектовРекурсивно(Знач Заголовки, МассивОбъектов, Подробно = Ложь, Отбор = "", Страница = "") 
    
    URL       = "https://www.googleapis.com/drive/v3/files";
    Files     = "files";
    NPT       = "nextPageToken";
    Параметры = Новый Структура;
    
    Если ЗначениеЗаполнено(Страница) Тогда
        Параметры.Вставить("pageToken", Страница);
    КонецЕсли;
    
    Если ЗначениеЗаполнено(Отбор) И ТипЗнч(Отбор) = Тип("Массив") Тогда     
        ОтборСтрока = СтрСоединить(Отбор, " and ");
        Параметры.Вставить("q", ОтборСтрока);       
    КонецЕсли;
    
    Результат = OPI_Инструменты.Get(URL, Параметры, Заголовки);
        
    Объекты  = Результат[Files];
    Страница = Результат[NPT];
        
    Для Каждого ТекущийОбъект Из Объекты Цикл
         МассивОбъектов.Добавить(ТекущийОбъект);
    КонецЦикла;    
    
    Если Объекты.Количество() > 0 И ЗначениеЗаполнено(Страница) Тогда
        ПолучитьСписокОбъектовРекурсивно(Заголовки, МассивОбъектов, Подробно, Отбор, Страница); 
    КонецЕсли;
          
КонецПроцедуры

Процедура РазложитьОбъектыПодробно(Знач Токен, МассивОбъектов) 
       
    Для Каждого ТекущийОбъект Из МассивОбъектов Цикл
        
        МассивФайлов = Новый Массив;
        ТекущийИД    = ТекущийОбъект["id"];
        
        Результат    = ПолучитьСписокФайлов(Токен, , ТекущийИД);
        
        Для Каждого Файл Из Результат Цикл
            МассивФайлов.Добавить(Файл);    
        КонецЦикла;
        
        ТекущийОбъект.Вставить("files", МассивФайлов);
         
    КонецЦикла;
       
КонецПроцедуры

#КонецОбласти
