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
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off

//@skip-check method-too-many-params

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools" 

#Область ПрограммныйИнтерфейс

#Область РаботаСФайламиИПапками

// Получить информацию о диске.
// 
// Параметры:
//  Токен - Строка - Токен
// 
// Возвращаемое значение:
//  ДвоичныеДанные, Неопределено, Строка, Произвольный - Ответ сервера Yandex
Функция ПолучитьИнформациюОДиске(Знач Токен) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    Ответ     = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk", , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Создать папку.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к созаваемой папке
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex
Функция СоздатьПапку(Знач Токен, Знач Путь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    URL       = "https://cloud-api.yandex.net/v1/disk/resources";
    Href      = "href";
    
    Параметры = Новый Структура;
    Параметры.Вставить("path", Путь);
    
    Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры);    
    Ответ     = OPI_Инструменты.Put(URL + Параметры, , Заголовки, Ложь);
    
    URLОтвета = Ответ[Href];   
    Ответ     = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к папке или файлу, о котором необходимо получить информацию
// 
// Возвращаемое значение:
//  ДвоичныеДанные, Неопределено, Строка, Произвольный - Ответ сервера Yandex
Функция ПолучитьОбъект(Знач Токен, Знач Путь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    Параметры = Новый Структура;
    Параметры.Вставить("path", Путь);
    
    Ответ     = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources", Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Удалить объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к удаляемой папке или файлу
//  ВКорзину - Булево - В корзину
// 
// Возвращаемое значение:
//  ДвоичныеДанные, Неопределено, Строка, Произвольный - Ответ сервера Yandex
Функция УдалитьОбъект(Знач Токен, Знач Путь, Знач ВКорзину = Истина) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ВКорзину);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    Параметры.Вставить("path"       , Путь);
    Параметры.Вставить("permanently", Не ВКорзину);
    
    Ответ     = OPI_Инструменты.Delete("https://cloud-api.yandex.net/v1/disk/resources", Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Создать копию объекта.
// 
// Параметры:
//  Токен - Строка - Токен
//  Оригинал - Строка - Путь к оригинальному файлу или каталогу
//  Путь - Строка - Путь-назначение для копии
//  Перезаписывать - Булево - Перезаписывать если файл с таким именем уже существует
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex
Функция СоздатьКопиюОбъекта(Знач Токен, Знач Оригинал, Знач Путь, Знач Перезаписывать = Ложь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Оригинал);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Перезаписывать);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    URL       = "https://cloud-api.yandex.net/v1/disk/resources/copy";
    Href      = "href";
    
    Параметры = Новый Структура;
    Параметры.Вставить("from"       , Оригинал);
    Параметры.Вставить("path"       , Путь);
    Параметры.Вставить("overwrite"  , Перезаписывать);
    
    Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры); 
    Ответ     = OPI_Инструменты.Post(URL + Параметры, , Заголовки, Ложь);
    
    URLОтвета = Ответ[Href];    
    Ответ     = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Получить ссылку для скачивания.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к файлу для скачивания
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex
Функция ПолучитьСсылкуДляСкачивания(Знач Токен, Знач Путь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    Параметры.Вставить("path", Путь);
    
    Ответ = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources/download", Параметры, Заголовки);
    
    Возврат Ответ;
     
КонецФункции

// Получить список файлов.
// 
// Параметры:
//  Токен - Строка - Токен
//  Количество - Число,Строка - Количество возвращаемых объектов
//  СмещениеОтНачала - Число - Смещение для получение объектов не из начала списка
//  ОтборПоТипу - Строка - Отбор по типу файла
//      Список доступных вариантов: audio, backup, book, compressed, data, development, 
//                                  diskimage, document, encoded, executable, flash, font, 
//                                  image, settings, spreadsheet, text, unknown, video, web
//  СортироватьПоДате - Булево - Истина - сортировать по дате, Ложь - по алфавиту
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex 
Функция ПолучитьСписокФайлов(Знач Токен
    , Знач Количество = 0
    , Знач СмещениеОтНачала = 0
    , Знач ОтборПоТипу = ""
    , Знач СортироватьПоДате = Ложь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Количество);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(СмещениеОтНачала);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ОтборПоТипу);
    OPI_ПреобразованиеТипов.ПолучитьБулево(СортироватьПоДате);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    
    Если ЗначениеЗаполнено(Количество) Тогда
        Параметры.Вставить("limit", OPI_Инструменты.ЧислоВСтроку(Количество));
    КонецЕсли;
    
    Если ЗначениеЗаполнено(СмещениеОтНачала) Тогда
        Параметры.Вставить("offset", OPI_Инструменты.ЧислоВСтроку(СмещениеОтНачала));
    КонецЕсли;
    
    Если ЗначениеЗаполнено(ОтборПоТипу) Тогда
        Параметры.Вставить("media_type", ОтборПоТипу);
    КонецЕсли;
    
    Если СортироватьПоДате Тогда
        Назначение = "last-uploaded";
    Иначе
        Назначение = "files";
    КонецЕсли;
    
    Ответ = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources/" + Назначение, Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Переместить объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Оригинал - Строка - Путь к оригинальному файлу или папке
//  Путь - Строка -  Путь-назначение для перемещения
//  Перезаписывать - Булево - Перезаписывать если файл с таким именем уже существует
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex 
Функция ПереместитьОбъект(Знач Токен, Знач Оригинал, Знач Путь, Знач Перезаписывать = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Оригинал);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Перезаписывать);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    URL       = "https://cloud-api.yandex.net/v1/disk/resources/move";
    Href      = "href";
    
    Параметры = Новый Структура;
    Параметры.Вставить("from"       , Оригинал);
    Параметры.Вставить("path"       , Путь);
    Параметры.Вставить("overwrite"  , Перезаписывать);
    
    Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры); 
    Ответ     = OPI_Инструменты.Post(URL + Параметры, , Заголовки, Ложь);  
    URLОтвета = Ответ[Href]; 
    
    Ответ     = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;
  
КонецФункции

// Получить ссылку загрузки файла.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь для сохранение файла на Диске
//  Файл - Строка,ДвоичныеДанные - Файл для загрузки
//  Перезаписывать - Булево - Перезаписывать, если файл с таким именем уже существует
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex   
Функция ЗагрузитьФайл(Знач Токен, Знач Путь, Знач Файл, Знач Перезаписывать = Ложь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Перезаписывать);
    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Файл);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    Href      = "href";   
    Файл      = Новый Структура("file", Файл);
    
    Параметры = Новый Структура;
    Параметры.Вставить("path"       , Путь);
    Параметры.Вставить("overwrite"  , Перезаписывать);
    
    Ответ  = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources/upload", Параметры, Заголовки);
    URL    = Ответ[Href];
    Ответ  = OPI_Инструменты.PutMultipart(URL, Новый Структура(), Файл, "multipart", Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Загрузить файл по URL.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь помещения загруженного файла
//  Адрес - Строка - URL файла
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, Неопределено, HTTPОтвет - Ответ сервера Yandex
Функция ЗагрузитьФайлПоURL(Знач Токен, Знач Путь, Знач Адрес) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Адрес);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    URL       = "https://cloud-api.yandex.net/v1/disk/resources/upload";
    
    Параметры = Новый Структура;
    Параметры.Вставить("url" , КодироватьСтроку(Адрес, СпособКодированияСтроки.URLВКодировкеURL));
    Параметры.Вставить("path", Путь);
    
    Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры); 
    Ответ     = OPI_Инструменты.Post(URL + Параметры, , Заголовки, Ложь);
 
    Возврат Ответ;
    
КонецФункции

#КонецОбласти

#Область УправлениеПубличнымДоступом

// Опубликовать объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к публикуемому объекту
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex 
Функция ОпубликоватьОбъект(Знач Токен, Знач Путь) Экспорт
    Возврат ПереключениеОбщегоДоступа(Токен, Путь, Истина);   
КонецФункции

// Отменить публикацию объекта.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к опубликованному ранее объекту
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex 
Функция ОтменитьПубликациюОбъекта(Знач Токен, Знач Путь) Экспорт
    Возврат ПереключениеОбщегоДоступа(Токен, Путь, Ложь);
КонецФункции

// Получить список опубликованных объектов.
// 
// Параметры:
//  Токен - Строка - Токен
//  Количество - Число - Количество возвращаемых объектов
//  СмещениеОтНачала - Число - Смещение для получение объектов не из начала списка
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex 
Функция ПолучитьСписокОпубликованныхОбъектов(Знач Токен, Знач Количество = 0, Знач СмещениеОтНачала = 0) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Количество);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(СмещениеОтНачала);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    
    Если ЗначениеЗаполнено(Количество) Тогда
        Параметры.Вставить("limit", Количество);
    КонецЕсли;
    
    Если ЗначениеЗаполнено(СмещениеОтНачала) Тогда
        Параметры.Вставить("offset", СмещениеОтНачала);
    КонецЕсли;
        
    Ответ = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources/public", Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Получить публичный объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  URL - Строка - Адрес объекта
//  Количество - Число - Количество возвращаемых вложенных объектов (для каталога)
//  СмещениеОтНачала - Число - Смещение для получение вложенных объектов не из начала списка
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, Неопределено - Ответ сервера Yandex 
Функция ПолучитьПубличныйОбъект(Знач Токен, Знач URL, Знач Количество = 0, Знач СмещениеОтНачала = 0) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Количество);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(СмещениеОтНачала);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    
    Если ЗначениеЗаполнено(Количество) Тогда
        Параметры.Вставить("limit", OPI_Инструменты.ЧислоВСтроку(Количество));
    КонецЕсли;
    
    Если ЗначениеЗаполнено(СмещениеОтНачала) Тогда
        Параметры.Вставить("offset", OPI_Инструменты.ЧислоВСтроку(СмещениеОтНачала));
    КонецЕсли;
    
    Параметры.Вставить("public_key", URL);
        
    Ответ = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/public/resources", Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Получить ссылку скачивания публичного объекта.
// 
// Параметры:
//  Токен - Строка - Токен
//  URL - Строка - Адрес объекта
//  Путь - Строка - Путь
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, Неопределено - Ответ сервера Yandex 
Функция ПолучитьСсылкуСкачиванияПубличногоОбъекта(Знач Токен, Знач URL, Знач Путь = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    
    Если ЗначениеЗаполнено(Путь) Тогда
        Параметры.Вставить("path", Путь);
    КонецЕсли;
        
    Параметры.Вставить("public_key", URL);
        
    Ответ = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/public/resources/download", Параметры, Заголовки);
    
    Возврат Ответ; 
    
КонецФункции
     
// Сохранить публичный объект на диск.
// 
// Параметры:
//  Токен - Строка - Токен
//  URL - Строка - Адрес объекта
//  Откуда - Строка - Путь внутри публичного каталога (только для папок)
//  Куда - Строка - Путь сохранения файла
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, Неопределено, HTTPОтвет - Ответ сервера Yandex 
Функция СохранитьПубличныйОбъектНаДиск(Знач Токен, Знач URL, Откуда = "", Куда = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Откуда);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Куда);
    
    Заголовки  = ЗаголовокАвторизации(Токен);
    Адрес      = "https://cloud-api.yandex.net/v1/disk/public/resources/save-to-disk";
    Href       = "href";
    
    Параметры = Новый Структура;
    Параметры.Вставить("public_key", URL);
    
    Если ЗначениеЗаполнено(Откуда) Тогда
        Параметры.Вставить("path", Откуда);
    КонецЕсли;
    
    Если ЗначениеЗаполнено(Куда) Тогда
        Параметры.Вставить("save_path", Куда);
    КонецЕсли;
    
    Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры); 
    Ответ     = OPI_Инструменты.Post(Адрес + Параметры, , Заголовки, Ложь);
    
    URLОтвета = Ответ[Href]; 
    Ответ     = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;
    
КонецФункции
 
#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ЗаголовокАвторизации(Знач Токен)
    
    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "OAuth " + Токен);
    
    Возврат Заголовки;
    
КонецФункции

Функция ПереключениеОбщегоДоступа(Знач Токен, Знач Путь, Знач ОбщийДоступ) 
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ОбщийДоступ);
    
    Заголовки  = ЗаголовокАвторизации(Токен);
    Назначение = ?(ОбщийДоступ, "publish", "unpublish");
    Href       = "href";
  
    URL       = "https://cloud-api.yandex.net/v1/disk/resources/" + Назначение;
    
    Параметры = Новый Структура;
    Параметры.Вставить("path", Путь);
    
    Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры); 
    Ответ     = OPI_Инструменты.Put(URL + Параметры, , Заголовки, Ложь);
    
    URLОтвета = Ответ[Href];
    
    Ответ     = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти
