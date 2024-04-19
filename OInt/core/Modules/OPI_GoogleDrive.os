﻿// MIT License

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
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область РаботаСФайламиИКаталогами

// Получить информацию об объекте
// Получает информацию о папке или файле по ID
// 
// Параметры:
//  Токен         - Строка - Токен                            - token
//  Идентификатор - Строка - Идентификатор файла или каталога - object
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьИнформациюОбОбъекте(Знач Токен, Знач Идентификатор) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Идентификатор);
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор; 
    
    Параметры = Новый Структура;
    Параметры.Вставить("fields", "*");
    
    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить список каталогов
// Получает список каталогов диска
// 
// Параметры:
//  Токен       - Строка - Токен                                     - token
//  ИмяСодержит - Строка - Отбор по имени                            - querry
//  Подробно    - Булево - Добавляет список файлов к полям каталога  - depth
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Массив соответствий каталогов
Функция ПолучитьСписокКаталогов(Знач Токен, Знач ИмяСодержит = "", Знач Подробно = Ложь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИмяСодержит);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Подробно);
    
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

// Получить список файлов
// Получает список файлов
// 
// Параметры:
//  Токен       - Строка - Токен                          - token
//  ИмяСодержит - Строка - Отбор по имени                 - querry
//  Каталог     - Строка - Отбор по ID каталога родителя  - catalog
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Массив соответствий файлов
Функция ПолучитьСписокФайлов(Знач Токен, Знач ИмяСодержит = "", Знач Каталог = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИмяСодержит);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Каталог);
    
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

// Загрузить файл
// Загружает файл на диск
// 
// Параметры:
//  Токен     - Строка                        - Токен                     - token
//  Файл      - ДвоичныеДанные,Строка         - Загружаемый файл          - file
//  Описание  - Соответствие Из КлючИЗначение - См. ПолучитьОписаниеФайла - props - JSON описания или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач Описание) Экспорт
    Возврат УправлениеФайлом(Токен, Файл, Описание);   
КонецФункции

// Создать папку
// Создает пустой каталог на диске
// 
// Параметры:
//  Токен    - Строка - Токен      - token
//  Имя      - Строка - Имя папки  - title
//  Родитель - Строка - Родитель   - catalog
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция СоздатьПапку(Знач Токен, Знач Имя, Знач Родитель = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Имя);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Родитель);
    
    Описание = Новый Соответствие;
    Описание.Вставить("MIME"    , "application/vnd.google-apps.folder");
    Описание.Вставить("Имя"     , Имя);
    Описание.Вставить("Описание", "");
    Описание.Вставить("Родитель", ?(ЗначениеЗаполнено(Родитель), Родитель, "root"));
    
    Возврат УправлениеФайлом(Токен, , Описание);
    
КонецФункции

// Скачать файл
// Получает файл по ID
// 
// Параметры:
//  Токен          - Строка - Токен                 - token
//  Идентификатор  - Строка - Идентификатор файла   - object
//  ПутьСохранения - Строка - Путь сохранения файла - out 
// 
// Возвращаемое значение:
//  ДвоичныеДанные,Строка - Двоичные данные или путь к файлу при указании параметра ПутьСохранения
Функция СкачатьФайл(Знач Токен, Знач Идентификатор, Знач ПутьСохранения = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Идентификатор);
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор;  
    
    Параметры = Новый Соответствие;
    Параметры.Вставить("alt", "media");
    
    Ответ = OPI_Инструменты.Get(URL, Параметры , Заголовки, ПутьСохранения);
    
    Возврат Ответ;

КонецФункции

// Скоприровать объект
// Копирует файл или каталог
// 
// Параметры:
//  Токен         - Строка - Токен                     - token
//  Идентификатор - Строка - Идентификатор объекта     - object
//  НовоеИмя      - Строка - Новое имя объекта         - title
//  НовыйРодитель - Строка - Новый каталог размещения  - catalog
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция СкопироватьОбъект(Знач Токен, Знач Идентификатор, Знач НовоеИмя = "", Знач НовыйРодитель = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(НовоеИмя);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Идентификатор);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(НовыйРодитель);
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор + "/copy";    
    
    Параметры = Новый Структура;
    
    Если ЗначениеЗаполнено(НовоеИмя) Тогда
        Параметры.Вставить("name", НовоеИмя);
    КонецЕсли;
    
    Если ЗначениеЗаполнено(НовыйРодитель) Тогда
        
        МассивРодителей = Новый Массив;
        МассивРодителей.Добавить(НовыйРодитель);
        Параметры.Вставить("parents", МассивРодителей);
        
    КонецЕсли;
    
    Ответ = OPI_Инструменты.Post(URL, Параметры , Заголовки, Истина);
    
    Возврат Ответ;

КонецФункции

// Обновить файл
// Обновляет двоичные данные файла
// 
// Параметры:
//  Токен         - Строка - Токен                                     - token
//  Идентификатор - Строка - Идентификатор обновляемого объекта        - object
//  Файл          - ДвоичныеДанные,Строка - Файл источник обновления   - file
//  НовоеИмя      - Строка - Новое имя файла (если необходимо)         - title
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ОбновитьФайл(Знач Токен, Знач Идентификатор, Знач Файл, Знач НовоеИмя = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Идентификатор);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(НовоеИмя);
    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Файл);
    
    Если ЗначениеЗаполнено(НовоеИмя) Тогда
        Описание = Новый Соответствие;
        Описание.Вставить("Имя", НовоеИмя);
    Иначе
        Описание = "";
    КонецЕсли;
    
    Возврат УправлениеФайлом(Токен, Файл, Описание, Идентификатор);
        
КонецФункции

// Удалить объект
// Удаляет файл или каталог по ID
// 
// Параметры:
//  Токен         - Строка - Токен                               - token
//  Идентификатор - Строка - Идентификатор объекта для удаления  - object
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция УдалитьОбъект(Знач Токен, Знач Идентификатор) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Идентификатор);
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор;    
    Ответ     = OPI_Инструменты.Delete(URL, , Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить описание файла !NOCLI
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Описание файла
Функция ПолучитьОписаниеФайла() Экспорт
    
    Описание = Новый Соответствие;
    Описание.Вставить("MIME"        , "image/jpeg");       // MIME-тип загружаемого файла
    Описание.Вставить("Имя"         , "Новый файл.jpg");   // Имя файла с расширением
    Описание.Вставить("Описание"    , "Это новый файл");   // Описание файла
    Описание.Вставить("Родитель"    , "root");             // ID каталога загрузки или "root" для загрузки в корень
    
    Возврат Описание;
    
КонецФункции

#КонецОбласти

#Область РаботаСКомментариями

// Создать комментарий
// Создает комментарий к файлу или каталогу
// 
// Параметры:
//  Токен         - Строка - Токен                                                     - token
//  Идентификатор - Строка - Идентификатор объекта, для которого необходим комментарий - object  
//  Комментарий   - Строка - Текст комментария                                         - text
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция СоздатьКомментарий(Знач Токен, Знач Идентификатор, Знач Комментарий) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Идентификатор);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Комментарий);
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор + "/comments?fields=*"; 
    
    Параметры = Новый Структура;
    Параметры.Вставить("content", Комментарий);
    
    Ответ = OPI_Инструменты.POST(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить комментарий
// Получает комментарий по ID
// 
// Параметры:
//  Токен         - Строка - Токен                                                   - token
//  ИДОбъекта     - Строка - Идентификатор файла или каталога размещения комментария - object
//  ИДКомментария - Строка - Идентификатор комментария                               - comment
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьКомментарий(Знач Токен, Знач ИДОбъекта, Знач ИДКомментария) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИДОбъекта);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИДКомментария);
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + ИДОбъекта + "/comments/" + ИДКомментария; 
    
    Параметры = Новый Структура;
    Параметры.Вставить("fields", "*");
    
    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить список комментариев
// Получает список всех комментариев объекта
// 
// Параметры:
//  Токен     - Строка - Токен                  - token
//  ИДОбъекта - Строка - Идентификатор объекта  - object
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьСписокКомментариев(Знач Токен, Знач ИДОбъекта) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИДОбъекта);
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + ИДОбъекта + "/comments"; 
    
    Параметры = Новый Структура;
    Параметры.Вставить("fields", "*");
    
    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Удалить комментарий
// Удаляет комментарий по ID
// 
// Параметры:
//  Токен         - Строка - Токен                                                    - token
//  ИДОбъекта     - Строка - Идентификатор файла или каталога размещения комментария  - object
//  ИДКомментария - Строка - Идентификатор комментария                                - comment
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция УдалитьКомментарий(Знач Токен, Знач ИДОбъекта, Знач ИДКомментария) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИДОбъекта);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИДКомментария);
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + ИДОбъекта + "/comments/" + ИДКомментария; 
    
    Ответ = OPI_Инструменты.Delete(URL, , Заголовки);
    
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
    Параметры.Вставить("fields", "*");
    
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

Процедура СформироватьПараметрыЗагрузкиФайла(Описание)
    
    СформированноеОписание = Новый Соответствие;
    OPI_Инструменты.УдалитьПустыеПоляКоллекции(Описание);

    СоответствиеПолей = Новый Соответствие;
    СоответствиеПолей.Вставить("MIME"      , "mimeType");
    СоответствиеПолей.Вставить("Имя"       , "name");
    СоответствиеПолей.Вставить("Описание"  , "description");
    СоответствиеПолей.Вставить("Родитель"  , "parents");
    СоответствиеПолей.Вставить("Расширение", "fileExtension");
    
    Для Каждого Элемент Из Описание Цикл
        
        Если Элемент.Ключ = "Родитель" Тогда
            
            ТекущееЗначение = Новый Массив;
            ТекущееЗначение.Добавить(Элемент.Значение);
            
        Иначе
            
            ТекущееЗначение = Элемент.Значение;
            
        КонецЕсли;
        
        ИмяПоля = СоответствиеПолей.Получить(Элемент.Ключ);
        СформированноеОписание.Вставить(ИмяПоля, ТекущееЗначение);
        
    КонецЦикла;
    
    Описание = СформированноеОписание;
    
КонецПроцедуры

Функция УправлениеФайлом(Знач Токен, Знач Файл = "", Знач Описание = "", Знач Идентификатор = "") 
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Идентификатор);
    
    Если ЗначениеЗаполнено(Описание) Тогда
        OPI_ПреобразованиеТипов.ПолучитьКоллекцию(Описание);
    КонецЕсли;
    
    MimeType = "mimeType";
    
    Если ЗначениеЗаполнено(Идентификатор) Тогда
        MIME = ПолучитьИнформациюОбОбъекте(Токен, Идентификатор)[MimeType];
    Иначе
        MIME = Описание["MIME"];
    КонецЕсли;    
    
    Если Не ЗначениеЗаполнено(Описание) Тогда
        Описание = Новый Соответствие;
    КонецЕсли;
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    СформироватьПараметрыЗагрузкиФайла(Описание);
    ОписаниеJSON  = OPI_Инструменты.JSONСтрокой(Описание);
    
    СоответствиеФайла = Новый Соответствие;
    
    Если ЗначениеЗаполнено(Файл) Тогда
              
        OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Файл);     
        СоответствиеФайла.Вставить(Файл, MIME);
        
        Размер      = Файл.Размер();
        РазмерЧасти = 268435456;
        РазмерЧасти = РазмерЧасти + 1;
        
        Если Размер < РазмерЧасти Тогда
            Ответ = ЗагрузитьМалыйФайл(ОписаниеJSON, СоответствиеФайла, Заголовки, Идентификатор);
        Иначе
            Ответ = ЗагрузитьБольшойФайл(Описание, СоответствиеФайла, Заголовки, Идентификатор);
        КонецЕсли;
        
    Иначе
       Ответ = ЗагрузитьМалыйФайл(ОписаниеJSON, СоответствиеФайла, Заголовки, Идентификатор); 
    КонецЕсли;
         
    Возврат Ответ;
    
КонецФункции

Функция ЗагрузитьМалыйФайл(Знач Описание, Знач СоответствиеФайла, Знач Заголовки, Знач Идентификатор = "")
    
    URL = "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart";
    
    Если ЗначениеЗаполнено(Идентификатор) Тогда
        URL   = СтрЗаменить(URL, "/files", "/files/" + Идентификатор);
        Ответ = OPI_Инструменты.PatchMultipartRelated(URL, Описание, СоответствиеФайла, Заголовки);
    Иначе
        Ответ = OPI_Инструменты.PostMultipartRelated(URL, Описание, СоответствиеФайла, Заголовки);
    КонецЕсли;

    Возврат Ответ;
    
КонецФункции

Функция ЗагрузитьБольшойФайл(Знач Описание, Знач СоответствиеФайла, Знач Заголовки, Знач Идентификатор = "")
    
    Для Каждого Файл Из СоответствиеФайла Цикл
        Двоичные = Файл.Ключ;
        Прервать;
    КонецЦикла;
    
    URL = "https://www.googleapis.com/upload/drive/v3/files?uploadType=resumable";
    
    Если ЗначениеЗаполнено(Идентификатор) Тогда
        URL   = СтрЗаменить(URL, "/files", "/files/" + Идентификатор);
        Ответ = OPI_Инструменты.Patch(URL, Описание, Заголовки, Истина, Истина);
    Иначе
        Ответ = OPI_Инструменты.Post(URL, Описание, Заголовки, Истина, Истина);
    КонецЕсли;
         
    АдресЗагрузки = Ответ.Заголовки["Location"];
    
    Если Не ЗначениеЗаполнено(АдресЗагрузки) Тогда
        OPI_Инструменты.ОбработатьОтвет(Ответ);
        Возврат Ответ;
    КонецЕсли;
       
	ОтветЗагрузки = ЗагрузитьФайлЧастями(Двоичные, АдресЗагрузки);
	Ответ         = ?(ЗначениеЗаполнено(ОтветЗагрузки), ОтветЗагрузки, Ответ);
    
    OPI_Инструменты.ОбработатьОтвет(Ответ);
    Возврат Ответ;
   
КонецФункции

Функция ЗагрузитьФайлЧастями(Знач Двоичные, Знач АдресЗагрузки)
	
	Ответ            = "";
	РазмерЧасти      = 268435456;
	ПрочитаноБайт    = 0;
    ТекущаяПозиция   = 0;
    ОбщийРазмер      = Двоичные.Размер();
    СтрОбщийРазмер   = OPI_Инструменты.ЧислоВСтроку(ОбщийРазмер);
    
    Пока ПрочитаноБайт < ОбщийРазмер Цикл
        
        ЧтениеДанных     = Новый ЧтениеДанных(Двоичные);
        ПрочитаноБайт    = ЧтениеДанных.Пропустить(ТекущаяПозиция);
        Результат        = ЧтениеДанных.Прочитать(РазмерЧасти);
        ТекущиеДанные    = Результат.ПолучитьДвоичныеДанные();
        РазмерТекущих    = ТекущиеДанные.Размер();
        СледующаяПозиция = ТекущаяПозиция + РазмерТекущих - 1; 
        
        Если Не ЗначениеЗаполнено(ТекущиеДанные) Тогда
            Прервать;
        КонецЕсли;
        
        ЗаголовокПотока = "bytes "
            + OPI_Инструменты.ЧислоВСтроку(ТекущаяПозиция)
            + "-" 
            + OPI_Инструменты.ЧислоВСтроку(СледующаяПозиция) 
            + "/" 
            + СтрОбщийРазмер;
            
        ДопЗаголовки     = Новый Соответствие;
        ДопЗаголовки.Вставить("Content-Length", OPI_Инструменты.ЧислоВСтроку(РазмерТекущих));
        ДопЗаголовки.Вставить("Content-Range" , ЗаголовокПотока); 
        ДопЗаголовки.Вставить("Content-Type"  , "application/octet-stream");
        
        Ответ = OPI_Инструменты.Put(АдресЗагрузки, ТекущиеДанные, ДопЗаголовки, Ложь, Истина);
        
		РезультатПроверки = ПроверитьЗагрузкуЧасти(Ответ, СтрОбщийРазмер, ДопЗаголовки, АдресЗагрузки, ТекущаяПозиция);
		
		Если ЗначениеЗаполнено(РезультатПроверки) Тогда
			Возврат РезультатПроверки;
		КонецЕсли;
        
        КБайт = 1024;
        МБайт = КБайт * КБайт;
		Сообщить(OPI_Инструменты.ИнформацияОПрогрессе(ТекущаяПозиция, ОбщийРазмер, "МБ", МБайт));
        
        ВыполнитьСборкуМусора();
        ОсвободитьОбъект(ТекущиеДанные);
        
    КонецЦикла;
    
    Возврат Ответ;
    
КонецФункции

Функция ПроверитьЗагрузкуЧасти(Ответ, СтрОбщийРазмер, ДопЗаголовки, АдресЗагрузки, ТекущаяПозиция)
	
    НачалоКодовОшибок = 400;
    КонецКодовПадений = 600;
    НачалоКодовУспеха = 200;
    КонецКодовУспеха  = 300;
    Перенаправление   = 308;
    
    Если Ответ.КодСостояния >= НачалоКодовОшибок И Ответ.КодСостояния < КонецКодовПадений Тогда
         
        ЗаголовокПотока = "bytes */" + СтрОбщийРазмер;
        ДопЗаголовки.Вставить("Content-Range" , ЗаголовокПотока);
        
        ОтветПроверки = OPI_Инструменты.Put(АдресЗагрузки, "", ДопЗаголовки, Ложь, Истина);
        
        Если ОтветПроверки.КодСостояния >= НачалоКодовУспеха И ОтветПроверки.КодСостояния < КонецКодовУспеха Тогда
        	
            OPI_Инструменты.ОбработатьОтвет(ОтветПроверки);
            Возврат ОтветПроверки;
            
        ИначеЕсли ОтветПроверки.КодСостояния = Перенаправление Тогда
        	
            ЗагруженныеДанные = Ответ.Заголовки["Range"];
            
        Иначе
        	
            OPI_Инструменты.ОбработатьОтвет(Ответ);
        	Возврат Ответ;
        	
        КонецЕсли;
        
    Иначе
        ЗагруженныеДанные = Ответ.Заголовки["Range"];
    КонецЕсли;
        
    Если Не ЗначениеЗаполнено(ЗагруженныеДанные) Тогда
        OPI_Инструменты.ОбработатьОтвет(Ответ);
        Возврат Ответ;
    КонецЕсли;
    
    ЗагруженныеДанные = СтрЗаменить(ЗагруженныеДанные, "bytes=", "");
    МассивИнформации  = СтрРазделить(ЗагруженныеДанные, "-", Ложь);
    НеобходимоЧастей  = 2;
    
    Если Не МассивИнформации.Количество() = НеобходимоЧастей Тогда
    	OPI_Инструменты.ОбработатьОтвет(Ответ);
        Возврат Ответ;
    КонецЕсли;
    
    ТекущаяПозиция = Число(МассивИнформации[1]) + 1;
    
    Возврат "";
        
КонецФункции

#КонецОбласти
