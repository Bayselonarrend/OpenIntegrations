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

#Область РаботаСФайламиИКаталогами

// Получить информацию об объекте.
// 
// Параметры:
//  Токен - Строка - Токен
//  Идентификатор - Строка - Идентификатор файла/каталога
// 
// Возвращаемое значение:
//  HTTPОтвет - Ответ сервера Google
Функция ПолучитьИнформациюОбОбъекте(Знач Токен, Знач Идентификатор) Экспорт
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор; 
    
    Параметры = Новый Структура;
    Параметры.Вставить("fields", "*");
    
    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить список каталогов.
// 
// Параметры:
//  Токен - Строка - Токен
//  ИмяСодержит - Строка - Отбор по имени
//  Подробно - Булево - Добавляет список файлов к полям каталога
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Массив соответствий каталогов
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

// Получить список файлов.
// 
// Параметры:
//  Токен - Строка - Токен
//  ИмяСодержит - Строка - Отбор по имени
//  Каталог - Строка - Отбор по ID каталога-родителя 
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Массив соответствий файорв
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

// Загрузить файл.
// 
// Параметры:
//  Токен - Строка - Токен
//  Файл - ДвоичныеДанные,Строка - Файл или путь к файлу
//  Описание - Соответствие Из КлючИЗначение - См. ПолучитьОписаниеФайла
// 
// Возвращаемое значение:
//  HTTPОтвет - Ответ сервера Google
Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач Описание) Экспорт    
    Возврат УправлениеФайлом(Токен, Файл, Описание);   
КонецФункции

// Скачать файл.
// 
// Параметры:
//  Токен - Строка - Токен
//  Идентификатор - Строка - Идентификатор файла
// 
// Возвращаемое значение:
//  HTTPОтвет - Ответ сервера Google
Функция СкачатьФайл(Знач Токен, Знач Идентификатор) Экспорт
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор;  
    
    Параметры = Новый Соответствие;
    Параметры.Вставить("alt", "media");
    
    Ответ = OPI_Инструменты.Get(URL, Параметры , Заголовки);
    
    Возврат Ответ;

КонецФункции

// Удалить объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Идентификатор - Строка - Идентификатор объекта для удаления
// 
// Возвращаемое значение:
//  HTTPОтвет - Ответ сервера Google
Функция УдалитьОбъект(Знач Токен, Знач Идентификатор) Экспорт
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор;    
    Ответ     = OPI_Инструменты.Delete(URL, , Заголовки);
    
    Возврат Ответ;

КонецФункции

// Скоприровать объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Идентификатор - Строка - Идентификатор объекта
//  НовоеИмя - Строка - Новое имя объекта
//  НовыйРодитель - Строка - Новый каталог размещения
// 
// Возвращаемое значение:
//  HTTPОтвет - Ответ сервера Google 
Функция СкоприроватьОбъект(Знач Токен, Знач Идентификатор, Знач НовоеИмя = "", Знач НовыйРодитель = "") Экспорт
    
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

// Обновить файл.
// 
// Параметры:
//  Токен - Строка - Токен
//  Идентификатор - Строка - Идентификатор обновляемого объекта
//  Файл - ДвоичныеДанные,Строка - Файл или путь к файлу
//  НовоеИмя - Строка - Новое имя файла (если необходимо)
// 
// Возвращаемое значение:
//  HTTPОтвет - Ответ сервера Google
Функция ОбновитьФайл(Знач Токен, Знач Идентификатор, Знач Файл, Знач НовоеИмя = "") Экспорт
    
    Если ЗначениеЗаполнено(НовоеИмя) Тогда
        Описание = Новый Соответствие;
        Описание.Вставить("Имя", НовоеИмя);
    Иначе
        Описание = "";
    КонецЕсли;
    
    Возврат УправлениеФайлом(Токен, Файл, Описание, Идентификатор);
        
КонецФункции

// Получить описание файла.
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Получить описание файла
Функция ПолучитьОписаниеФайла() Экспорт
    
    Описание = Новый Соответствие;
    Описание.Вставить("MIME"        , "image/jpeg");
    Описание.Вставить("Имя"         , "Новый файл.jpg");
    Описание.Вставить("Описание"    , "Это новый файл");
    Описание.Вставить("Родитель"    , Неопределено);
    
    Возврат Описание;
    
КонецФункции

#КонецОбласти

#Область РаботаСКомментариями

Функция СоздатьКомментарий(Знач Токен, Знач Идентификатор, Знач Комментарий) Экспорт
    
    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/drive/v3/files/" + Идентификатор + "/comments?fields=*"; 
    
    Параметры = Новый Структура;
    Параметры.Вставить("content", Комментарий);
    
    Ответ = OPI_Инструменты.POST(URL, Параметры, Заголовки);
    
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

    СоотвтетствиеПолей = Новый Соответствие;
    СоотвтетствиеПолей.Вставить("MIME"      , "mimeType");
    СоотвтетствиеПолей.Вставить("Имя"       , "name");
    СоотвтетствиеПолей.Вставить("Описание"  , "description");
    СоотвтетствиеПолей.Вставить("Родитель"  , "parents");
    СоотвтетствиеПолей.Вставить("Расширение", "fileExtension");
    
    Для Каждого Элемент Из Описание Цикл
        
        Если Элемент.Ключ = "Родитель" Тогда
            
            ТекущееЗначение = Новый Массив;
            ТекущееЗначение.Добавить(Элемент.Значение);
            
        Иначе
            
            ТекущееЗначение = Элемент.Значение;
            
        КонецЕсли;
        
        ИмяПоля = СоотвтетствиеПолей.Получить(Элемент.Ключ);
        СформированноеОписание.Вставить(ИмяПоля, ТекущееЗначение);
        
    КонецЦикла;
    
    Описание = СформированноеОписание;
    
КонецПроцедуры

Функция УправлениеФайлом(Знач Токен, Знач Файл, Знач Описание = "", Знач Идентификатор = "") 
    
    Если ЗначениеЗаполнено(Идентификатор) Тогда
        MIME = ПолучитьИнформациюОбОбъекте(Токен, Идентификатор)["mimeType"];
    Иначе
        MIME = Описание["MIME"];
    КонецЕсли;    
    
    Если Не ЗначениеЗаполнено(Описание) Тогда
        Описание = Новый Соответствие;
    КонецЕсли;
    
    Заголовки     = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL           = "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart";
    
    Если ТипЗнч(Файл) <> Тип("ДвоичныеДанные") Тогда
        Файл = Новый ДвоичныеДанные(Файл);
    КонецЕсли;
    
    СоответствиеФайла = Новый Соответствие;
    СоответствиеФайла.Вставить(Файл, MIME);
        
    СформироватьПараметрыЗагрузкиФайла(Описание);
    Описание = OPI_Инструменты.JSONСтрокой(Описание);
    
    Если ЗначениеЗаполнено(Идентификатор) Тогда
        URL   = СтрЗаменить(URL, "/files", "/files/" + Идентификатор);
        Ответ = OPI_Инструменты.PatchMultipartRelated(URL, Описание, СоответствиеФайла, Заголовки);
    Иначе
        Ответ = OPI_Инструменты.PostMultipartRelated(URL, Описание, СоответствиеФайла, Заголовки);
    КонецЕсли;
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти
