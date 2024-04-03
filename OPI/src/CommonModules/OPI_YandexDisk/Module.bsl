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
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off

//@skip-check method-too-many-params

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools" 

#Область ПрограммныйИнтерфейс

#Область РаботаСФайламиИПапками

// Получить информацию о диске
// Получает информацию о текущем диске
// 
// Параметры:
//  Токен - Строка - Токен - token
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ПолучитьИнформациюОДиске(Знач Токен) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    Ответ     = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk", , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Создать папку
// Создает каталог на диске
// 
// Параметры:
//  Токен - Строка - Токен                     - token
//  Путь  - Строка - Путь к созаваемой папке   - path
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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
    
    Если Не ЗначениеЗаполнено(URLОтвета) Тогда
    	Возврат Ответ;	
    КонецЕсли;
     
    Ответ = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить объект
// Получает информацию об объекте диска по заданному пути
// 
// Параметры:
//  Токен - Строка - Токен                  - token
//  Путь  - Строка - Путь к папке или файлу - path
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ПолучитьОбъект(Знач Токен, Знач Путь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    Параметры = Новый Структура;
    Параметры.Вставить("path", Путь);
    
    Ответ     = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources", Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Удалить объект
// Удаляет объект по заданному пути
// 
// Параметры:
//  Токен    - Строка - Токен                              - token
//  Путь     - Строка - Путь к удаляемой папке или файлу   - path
//  ВКорзину - Булево - В корзину                          - can
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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

// Создать копию объекта
// Создает копию объекта по заданному пути и пути к оригиналу
// 
// Параметры:
//  Токен          - Строка - Токен                                                   - token
//  Оригинал       - Строка - Путь к оригинальному файлу или каталогу                 - from
//  Путь           - Строка - Путь назначения для копии                               - to
//  Перезаписывать - Булево - Перезаписывать если файл с таким именем уже существует  - rewrite
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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
    
    Если Не ЗначениеЗаполнено(URLОтвета) Тогда
	    Возврат Ответ;	
    КонецЕсли;
           
    Ответ = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Получить ссылку для скачивания
// Получает ссылку для скачивания файла
// 
// Параметры:
//  Токен - Строка - Токен                         - token
//  Путь  - Строка  - Путь к файлу для скачивания  - parh
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ПолучитьСсылкуДляСкачивания(Знач Токен, Знач Путь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    
    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    Параметры.Вставить("path", Путь);
    
    Ответ = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources/download", Параметры, Заголовки);
    
    Возврат Ответ;
     
КонецФункции

// Получить список файлов
// Получает список файлов с или без отбора по типу
// Список доступных типов: audio, backup, book, compressed, data, development, 
//                         diskimage, document, encoded, executable, flash, font, 
//                         mage, settings, spreadsheet, text, unknown, video, web
//                                  
// Параметры:
//  Токен             - Строка       - Токен                                                - token
//  Количество        - Число,Строка - Количество возвращаемых объектов                     - amount
//  СмещениеОтНачала  - Число        - Смещение для получение объектов не из начала списка  - offset
//  ОтборПоТипу       - Строка       - Отбор по типу файла                                  - type
//  СортироватьПоДате - Булево       - Истина > сортировать по дате, Ложь > по алфавиту     - datesort
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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

// Переместить объект
// Перемещает объект по заданному пути и пути к оригиналу
// 
// Параметры:
//  Токен          - Строка - Токен                                                   - token
//  Оригинал       - Строка - Путь к оригинальному файлу или папке                    - from
//  Путь           - Строка -  Путь-назначение для перемещения                        - to
//  Перезаписывать - Булево - Перезаписывать если файл с таким именем уже существует  - rewrite
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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
    
    Если Не ЗначениеЗаполнено(URLОтвета) Тогда
    	Возврат Ответ;	
    КонецЕсли;
    
    Ответ = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;
  
КонецФункции

// Загрузить файл
// Загружает файл на диск по заданному пути
// 
// Параметры:
//  Токен          - Строка                - Токен                                                      - token
//  Путь           - Строка                - Путь для сохранение файла на Диске                         - path
//  Файл           - Строка,ДвоичныеДанные - Файл для загрузки                                          - file
//  Перезаписывать - Булево                - Перезаписывать, если файл с таким именем уже существует    - rewrite
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex 
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
    
    Если Не ЗначениеЗаполнено(URL) Тогда
    	Возврат Ответ;	
    КонецЕсли;
        
    Ответ  = OPI_Инструменты.PutMultipart(URL, Новый Структура(), Файл, "multipart", Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Загрузить файл по URL
// Загружает файл на диск, забирая его по заданному URL
// 
// Параметры:
//  Токен - Строка - Токен                               - token
//  Путь  - Строка - Путь помещения загруженного файла   - path
//  Адрес - Строка - URL файла                           - url
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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

// Опубликовать объект
// Публикует объект диска в публичный доступ
// 
// Параметры:
//  Токен - Строка - Токен                        - token
//  Путь  - Строка - Путь к публикуемому объекту  - path
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex 
Функция ОпубликоватьОбъект(Знач Токен, Знач Путь) Экспорт
    Возврат ПереключениеОбщегоДоступа(Токен, Путь, Истина);   
КонецФункции

// Отменить публикацию объекта
// Отменяет публикацию ранее опубликованного объекта
// 
// Параметры:
//  Токен - Строка - Токен                                  - token
//  Путь  - Строка - Путь к опубликованному ранее объекту   - path
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ОтменитьПубликациюОбъекта(Знач Токен, Знач Путь) Экспорт
    Возврат ПереключениеОбщегоДоступа(Токен, Путь, Ложь);
КонецФункции

// Получить список опубликованных объектов.
// Получает список опубликованных объектов
// 
// Параметры:
//  Токен            - Строка - Токен                                               - token      
//  Количество       - Число  - Количество возвращаемых объектов                    - amount
//  СмещениеОтНачала - Число  - Смещение для получение объектов не из начала списка - offset
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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

// Получить публичный объект
// Получает информацию об опубликованном объекте по его URL
// 
// Параметры:
//  Токен            - Строка - Токен                                                           - token
//  URL              - Строка - Адрес объекта                                                   - url 
//  Количество       - Число  - Количество возвращаемых вложенных объектов (для каталога)       - amount
//  СмещениеОтНачала - Число  - Смещение для получение вложенных объектов не из начала списка   - offset
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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

// Получить ссылку скачивания публичного объекта
// Получает прямую ссылку для скачивания публичного объекта
// 
// Параметры:
//  Токен - Строка - Токен               - token
//  URL   - Строка - Адрес объекта       - url
//  Путь  - Строка - Путь внутри объекта - path
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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
     
// Сохранить публичный объект на диск
// Сохраняет публичный объект на ваш диск
// 
// Параметры:
//  Токен  - Строка - Токен                                               - token
//  URL    - Строка - Адрес объекта                                       - url
//  Откуда - Строка - Путь внутри публичного каталога (только для папок)  - from
//  Куда   - Строка - Путь сохранения файла                               - to
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
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
    
    Если Не ЗначениеЗаполнено(URLОтвета) Тогда
        Возврат Ответ;	
    КонецЕсли;
        
    Ответ = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
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
    
    Если Не ЗначениеЗаполнено(URLОтвета) Тогда
        Возврат Ответ;	
    КонецЕсли;    
     
    Ответ     = OPI_Инструменты.Get(URLОтвета, , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти