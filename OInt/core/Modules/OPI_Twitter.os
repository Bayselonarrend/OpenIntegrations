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
// Если в не знаете с чего начать, то стоит найти метод ПолучитьСтандартныеПараметры()
// и почитать комментарии

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off

//@skip-check method-too-many-params

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область ДанныеИНастройка

// Получить ссылку для авторизации
// Формирует ссылку для авторизации через браузер
// 
// Параметры:
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Строка -  URL для перехода в браузере
Функция ПолучитьСсылкуАвторизации(Параметры = "") Экспорт
    
    Параметры_ = ПолучитьСтандартныеПараметры(Параметры);
    
    ПараметрыURL = Новый Структура;
        
    ПараметрыURL.Вставить("response_type"        , "code");
    ПараметрыURL.Вставить("client_id"            , Параметры_["client_id"]);
    ПараметрыURL.Вставить("redirect_uri"         , Параметры_["redirect_uri"]);
    ПараметрыURL.Вставить("scope"                , Параметры_["scope"]);
    ПараметрыURL.Вставить("state"                , "state");
    ПараметрыURL.Вставить("code_challenge"       , "challenge");
    ПараметрыURL.Вставить("code_challenge_method", "plain");
        
    ПараметрыURL = OPI_Инструменты.ПараметрыЗапросаВСтроку(ПараметрыURL);
    Линк = "https://twitter.com/i/oauth2/authorize" + ПараметрыURL;
        
    Возврат Линк;
    
КонецФункции

// Получить токен
// Получает токен по коду, полученному при авторизации по ссылке из ПолучитьСсылкуАвторизации
// 
// Параметры:
//  Код        - Строка              - Код, полученный из авторизации См.ПолучитьСсылкуАвторизации - code
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter
Функция ПолучитьТокен(Знач Код, Знач Параметры = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Код);
        
    Параметры_ = ПолучитьСтандартныеПараметры(Параметры);

    ПараметрыЗапроса = Новый Структура;
    ПараметрыЗапроса.Вставить("code"         , Код);
    ПараметрыЗапроса.Вставить("grant_type"   , "authorization_code");
    ПараметрыЗапроса.Вставить("client_id"    , Параметры_["client_id"]);
    ПараметрыЗапроса.Вставить("redirect_uri" , Параметры_["redirect_uri"]);
    ПараметрыЗапроса.Вставить("code_verifier", "challenge");
    
    Ответ = OPI_Инструменты.Post("https://api.twitter.com/2/oauth2/token"
        , ПараметрыЗапроса, , Ложь);
        
    Возврат Ответ;
    
КонецФункции

// Обновить токен 
// Обновляет v2 токен при помощи refresh_token
// 
// Параметры:
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter
Функция ОбновитьТокен(Знач Параметры = "") Экспорт
    
    Параметры_ = ПолучитьСтандартныеПараметры(Параметры);
    Refresh    = "refresh_token";
    
    ПараметрыЗапроса = Новый Структура;
    ПараметрыЗапроса.Вставить(Refresh        , Параметры_[Refresh]);
    ПараметрыЗапроса.Вставить("grant_type"   , Refresh);
    ПараметрыЗапроса.Вставить("client_id"    , Параметры_["client_id"]);
    
    Ответ = OPI_Инструменты.Post("https://api.twitter.com/2/oauth2/token"
    , ПараметрыЗапроса, , Ложь);
    
    Возврат Ответ;

КонецФункции

// !NOCLI
// Метод для вставки в http-сервис, адрес которого указывается в redirect_uri
// Вызывает метод получения токена, так как для получения токена из кода, приходящего
// на redirect_uri после авторизации через браузер есть всего 30 секунд
// 
// Параметры:
//  Запрос - HTTPСервисЗапрос - Запрос, приходящий на http-сервис
// 
// Возвращаемое значение:
//  HTTPОтвет, Произвольный, ДвоичныеДанные - Результат чтения JSON ответа сервера
Функция ОбработкаВходящегоЗапросаПослеАвторизации(Запрос) Экспорт
    
    Код         = Запрос.ПараметрыЗапроса["code"];    
    ОтветТокен  = ПолучитьТокен(Код);
    
    // BSLLS:CommentedCode-off
    // Предпочтительное хранение токенов
    // Константы.TwitterRefresh.Установить(ОтветТокен["refresh_token"]);
    // Константы.TwitterToken.Установить(ОтветТокен["access_token"]);
    // BSLLS:CommentedCode-on
    
    Возврат ОтветТокен;

КонецФункции

#КонецОбласти

#Область Твиты

// !NOCLI
// Создать произвольный твит
// 
// Параметры:
//  Текст - Строка        -  Текст твита
//  МассивМедиа           -  Массив из Строка,ДвоичныеДанные -  Массив двоичных данных или путей к файлам
//  МассивВариантовОпроса - Массив из Строка -  Массив вариантов опроса, если необходимо
//  ДлительностьОпроса    - Строка,Число -  Длительность опроса, если необходимо (опрос без длительности не создается)
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter
Функция СоздатьПроизвольныйТвит(Знач Текст = ""
    , Знач МассивМедиа = ""
    , Знач МассивВариантовОпроса = ""
    , Знач ДлительностьОпроса = ""
    , Знач Параметры = "") Экспорт 
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Текст);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ДлительностьОпроса);
    
    Если ЗначениеЗаполнено(МассивМедиа) Тогда
        OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивМедиа);
    КонецЕсли;
    
    Если ЗначениеЗаполнено(МассивВариантовОпроса) Тогда
        OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивВариантовОпроса);
    КонецЕсли;
    
    Параметры_         = ПолучитьСтандартныеПараметры(Параметры);
    URL                = "https://api.twitter.com/2/tweets";
    Массив             = "Массив";    
    Поля               = Новый Соответствие;
    
    Если ЗначениеЗаполнено(Текст) Тогда
        Поля.Вставить("text", Текст);
    КонецЕсли;
    
    Если ТипЗнч(МассивВариантовОпроса) = Тип(Массив) И ЗначениеЗаполнено(ДлительностьОпроса) Тогда
        
        ДлительностьОпроса = Число(ДлительностьОпроса);
        
        Если МассивВариантовОпроса.Количество() > 0 Тогда
        	
        	СтруктураВарианта = Новый Структура("options,duration_minutes", МассивВариантовОпроса, ДлительностьОпроса);
            Поля.Вставить("poll", СтруктураВарианта);
            
        КонецЕсли;
        
    КонецЕсли;
    
    Если ТипЗнч(МассивМедиа) = Тип(Массив) Тогда
        Если МассивМедиа.Количество() > 0 Тогда
            Поля.Вставить("media", Новый Структура("media_ids", МассивМедиа));
        КонецЕсли;
    КонецЕсли;
    
    Авторизация = СоздатьЗаголовокАвторизацииV2(Параметры_);
    Ответ       = OPI_Инструменты.Post(URL, Поля, Авторизация);

    Возврат Ответ;
    
КонецФункции

// Создать текстовый твит
// Создает твит без вложений
// 
// Параметры:
//  Текст      - Строка              - Текст твита                     - text
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter
Функция СоздатьТекстовыйТвит(Знач Текст, Знач Параметры = "") Экспорт
    Возврат СоздатьПроизвольныйТвит(Текст, , , , Параметры);    
КонецФункции

// Создать твит картинки
// Создает твит с картинкой вложением
// 
// Параметры:
//  Текст          - Строка                          - Текст твита            - text
//  МассивКартинок - Массив из Строка,ДвоичныеДанные - Массив файлов картинок - pictures
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter
Функция СоздатьТвитКартинки(Знач Текст, Знач МассивКартинок, Знач Параметры = "") Экспорт
    
    МассивМедиа = ЗагрузитьМассивВложений(МассивКартинок, "tweet_image", Параметры);
    Возврат СоздатьПроизвольныйТвит(Текст, МассивМедиа, , , Параметры);    
    
КонецФункции

// Создать твит гифки
// Создает твит с вложением-гифкой
// 
// Параметры:
//  Текст       - Строка                          - Текст твита         - text
//  МассивГифок - Массив из Строка,ДвоичныеДанные - Массив файлов гифок - gifs
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter
Функция СоздатьТвитГифки(Знач Текст, Знач МассивГифок, Знач Параметры = "") Экспорт
    
    МассивМедиа = ЗагрузитьМассивВложений(МассивГифок, "tweet_gif", Параметры);
    Возврат СоздатьПроизвольныйТвит(Текст, МассивМедиа, , , Параметры);    
    
КонецФункции

// Создать твит видео
// Создает твит с видеовложением
// 
// Параметры:
//  Текст       - Строка                          - Текст твита         - text
//  МассивВидео - Массив из Строка,ДвоичныеДанные - Массив файлов видео - videos
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter
Функция СоздатьТвитВидео(Знач Текст, Знач МассивВидео, Знач Параметры = "") Экспорт
    
    МассивМедиа = ЗагрузитьМассивВложений(МассивВидео, "tweet_video", Параметры);
    Возврат СоздатьПроизвольныйТвит(Текст, МассивМедиа, , , Параметры);
    
КонецФункции

// Создать твит опрос
// Создает твит с опросом
// 
// Параметры:
//  Текст           - Строка           - Текст твита               - text
//  МассивВариантов - Массив из Строка - Массив вариантов опроса   - options
//  Длительность    - Строка,Число     - Длительность опроса       - duration
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter
Функция СоздатьТвитОпрос(Знач Текст, Знач МассивВариантов, Знач Длительность, Знач Параметры = "") Экспорт
    Возврат СоздатьПроизвольныйТвит(Текст, , МассивВариантов, Длительность, Параметры);    
КонецФункции

// Загрузить массив вложений !NOCLI
// Загружает файлы на сервер и возвращает их ID
// 
// Параметры:
//  МассивФайлов - Массив из Строка, ДвоичныеДанные -  Массив файлов
//  ТипВложений - Строка -  Тип вложений
//  Параметры  - Структура из Строка - См.ПолучитьСтандартныеПараметры - auth - JSON авторизации или путь к .json
// 
// Возвращаемое значение:
//  Массив Из Строка -  Массив ID медиа
Функция ЗагрузитьМассивВложений(Знач МассивФайлов, Знач ТипВложений, Знач Параметры = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ТипВложений);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивФайлов);
    
    МассивМедиа = Новый Массив;
    Параметры_  = ПолучитьСтандартныеПараметры(Параметры);
    MIS         = "media_id_string";
    
    Если ЗначениеЗаполнено(МассивФайлов) Тогда
                 
        Для Каждого ФайлОтправки Из МассивФайлов Цикл
                       
            OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(ФайлОтправки);
            
            Ответ   = ЗагрузитьМедиафайл(ФайлОтправки, ТипВложений, Параметры_);
            IDМедиа = Ответ[MIS];
            
            Если Не ЗначениеЗаполнено(IDМедиа) Тогда
                Возврат Ответ;
            КонецЕсли;
            
            МассивМедиа.Добавить(IDМедиа);
            
        КонецЦикла;
    
    КонецЕсли;
        
    Возврат МассивМедиа;
    
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ЗагрузитьМедиафайл(Знач Файл, Знач Тип, Знач Параметры) 
   
    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Файл);
   
    MediaKey         = "media_key";
    ProcessingInfo   = "processing_info";
    MIS              = "media_id_string";
    Command          = "command";
    ВидЗапроса       = "POST";
    Единица          = 1024;
    Количество       = 4;
    
    СоответствиеMIME = Новый Соответствие;
    СоответствиеMIME.Вставить("tweet_image", "image/jpeg");
    СоответствиеMIME.Вставить("tweet_video", "video/mp4");
    СоответствиеMIME.Вставить("tweet_gif"  , "image/gif");
      
    Параметры_ = ПолучитьСтандартныеПараметры(Параметры);
    URL        = "https://upload.twitter.com/1.1/media/upload.json";
    Размер     = Файл.Размер();
    
    Если Тип = "tweet_image" Тогда 
        
        Поля = Новый Структура;
        Поля.Вставить("media_data"    , Base64Строка(Файл));
        Поля.Вставить("media_category", Тип);
        
        Авторизация = СоздатьЗаголовокАвторизацииV1(Параметры_, Поля, ВидЗапроса, URL);
            
        Ответ = OPI_Инструменты.Post(URL, Поля, Авторизация, Ложь);
        
    Иначе
        
        РазмерЧасти  = Количество * Единица * Единица;
        МассивЧтения = РазделитьДвоичныеДанные(Файл, РазмерЧасти);
        
        Поля = Новый Структура;
        Поля.Вставить(Command          , "INIT");
        Поля.Вставить("total_bytes"    , OPI_Инструменты.ЧислоВСтроку(Размер));
        Поля.Вставить("media_type"     , СоответствиеMIME.Получить(Тип));
        Поля.Вставить("media_category" , Тип);
        
        Авторизация = СоздатьЗаголовокАвторизацииV1(Параметры_, Поля, ВидЗапроса, URL);

        ОтветИнициализации = OPI_Инструменты.Post(URL, Поля, Авторизация, Ложь);
        KeyИнициализации   = ОтветИнициализации[MediaKey];
        IDИнициализации    = ОтветИнициализации[MIS];
        
        Если Не ЗначениеЗаполнено(KeyИнициализации) Или Не ЗначениеЗаполнено(IDИнициализации) Тогда
        	Возврат ОтветИнициализации; 	
        КонецЕсли;
        
        Счетчик = 0;
        
        Для Каждого Часть Из МассивЧтения Цикл
            
            Поля = Новый Структура;
            Поля.Вставить(Command           , "APPEND");
            Поля.Вставить("media_key"       , KeyИнициализации);
            Поля.Вставить("segment_index"   , OPI_Инструменты.ЧислоВСтроку(Счетчик));
            Поля.Вставить("media"           , Часть);

            Авторизация = СоздатьЗаголовокАвторизацииV1(Параметры_, Новый Структура, ВидЗапроса, URL);
            
            OPI_Инструменты.PostMultipart(URL, Поля, , , Авторизация);
            
            Счетчик = Счетчик + 1;
        КонецЦикла;
        
        Поля = Новый Структура;
        Поля.Вставить(Command   , "FINALIZE");
        Поля.Вставить("media_id", IDИнициализации);
        
		СтатусОбработки = ПолучитьСтатусОбработки(Параметры_, Поля, URL);
		
		Если Не ТипЗнч(СтатусОбработки) = Тип("Строка") Тогда
			Возврат СтатусОбработки;
		КонецЕсли;
                
        Поля = Новый Структура;
        
        Поля.Вставить(Command   , "STATUS");
        Поля.Вставить("media_id", IDИнициализации);

        Пока Строка(СтатусОбработки) = "pending" Или Строка(СтатусОбработки) = "in_progress" Цикл
             
            Авторизация     = СоздатьЗаголовокАвторизацииV1(Параметры_, Поля, "GET", URL);        
            Ответ           = OPI_Инструменты.Get(URL, Поля, Авторизация);     
            Информация      = Ответ[ProcessingInfo];
    
            Если Не ЗначениеЗаполнено(Информация) Тогда
            	Возврат Ответ;
            КонецЕсли;
            
            СтатусОбработки = Информация["state"];
            
            Если Не ЗначениеЗаполнено(СтатусОбработки) Тогда
            	Возврат Ответ;
            КонецЕсли;
           
        КонецЦикла;
        
        Если СтатусОбработки = "failed" Тогда
            ВызватьИсключение "Твиттер не смог обработать загруженное вами видео";
        КонецЕсли;
        
     КонецЕсли;
    
    Возврат Ответ;
    
КонецФункции

Функция ПолучитьСтандартныеПараметры(Знач Параметры = "")
    
    // Здесь собрано определение данных, необходимых для работы.
    // Для Twitter это довольно значительный набор, что обсуловлено наличием сразу 2-х API,
    // которые, при этом, созданы не для разныз задач, но просто являются версиями друг друга.
    // Актуальной версией API является v2 и она требует получения временных токенов. Несмотря на то,
    // что Twitter настаивает на использовании этой актуальной версии, они как-то умудрились не перенести
    // механизм загрузки файлов и некоторые другие из старой версии - v1.1. Поэтому что-то нужно делать 
    // на версии 1.1, а что-то на 2: вплоть до того что они убрали возможность постить твиты из v1.1,
    // но только через нее в твит можно добавить картинку. При этом способы авторизации и токены у них разные
    
    // Мировая гигокорпорация Илона Маска, кстати, напоминаю ;)
    
    // P.S Далее часто упоминается "страница настроек Twitter Developer" - это 
    // https://developer.twitter.com/en/portal/dashboard и выбор конкретного проекта из списка (значек c ключем)
    
    Параметры_ = Новый Соответствие; 
    Разрешения = "tweet.read tweet.write tweet.moderate.write users.read "
        + "follows.read follows.write offline.access space.read mute.read "
        + "mute.write like.read like.write list.read list.write block.read "
        + "block.write bookmark.read bookmark.write";    
               
    // Данные для API v2
        
    // redirect_uri  - URL вашего http-сервиса (или другого обработчика запросов) для авторизации
    // scope         - набор разрешений для получаемого ключа. Может быть любой, но offline.access обязателен
    // client_id     - Из OAuth 2.0 Client ID and Client Secret страницы настроек Twitter Developer
    // client_secret - Из OAuth 2.0 Client ID and Client Secret страницы настроек Twitter Developer
    // access_token  - ПолучитьСсылкуАвторизации() -> Браузер -> code придет на redirect_uri -> ПолучитьТокен(code)
    // refresh_token - Приходит вместе с access_token и используется для его обновления (время жизни access_token - 2 ч)
    //                 Обновление происходит методом ОбновитьТокен с новыми access_token и refresh_token. 
    //                 При следующем обновлении нужно использовать уже новый refresh_token, так что захардкодить 
    //                 не получится (access_token тоже не получится) 
    
    //           |--> ОбновитьТокен() ->|access_token  --> Используется в т-нии 2-х часов для запросов
    //           |                      |refresh_token --|
    //           |--------[через 2 ч.]-------------------|
     
    // Данные для API v1.1
    
    // oauth_token           - из Authentication Tokens -> Access Token and Secret страницы настроек Twitter Developer 
    // oauth_token_secret    - из Authentication Tokens -> Access Token and Secret страницы настроек Twitter Developer
    // oauth_consumer_key    - из Consumer Keys -> Access Token and Secret страницы настроек Twitter Developer
    // oauth_consumer_secret - из Consumer Keys -> Access Token and Secret страницы настроек Twitter Developer
    
    // Эти токены обновлять не надо
    
    Параметры_.Вставить("redirect_uri"         , "");
    Параметры_.Вставить("scope"                , Разрешения);
    Параметры_.Вставить("client_id"            , "");
    Параметры_.Вставить("client_secret"        , "");
    Параметры_.Вставить("access_token"         , ""); // Должно быть нечто вроде Константы.TwitterToken.Получить()
    Параметры_.Вставить("refresh_token"        , ""); // Должно быть нечто вроде Константы.TwitterRefresh.Получить()
    Параметры_.Вставить("oauth_token"          , "");
    Параметры_.Вставить("oauth_token_secret"   , "");
    Параметры_.Вставить("oauth_consumer_key"   , "");
    Параметры_.Вставить("oauth_consumer_secret", "");
    
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(Параметры);
    
    Если ТипЗнч(Параметры) = Тип("Структура") Или ТипЗнч(Параметры) = Тип("Соответствие") Тогда
        Для Каждого ПереданныйПараметр Из Параметры Цикл
            Параметры_.Вставить(ПереданныйПараметр.Ключ, OPI_Инструменты.ЧислоВСтроку(ПереданныйПараметр.Значение));
        КонецЦикла;
    КонецЕсли;

    Возврат Параметры_;

КонецФункции

Функция СоздатьЗаголовокАвторизацииV1(Знач Параметры, Знач Поля, Знач ВидЗапроса, Знач URL)
    
    ТекущаяДата          = OPI_Инструменты.ПолучитьТекущуюДату();
    ЗаголовокАвторизации = "";
    МетодХэширования     = "HMAC-SHA1";
    ВерсияАпи            = "1.0";
    СтрокаСигнатуры      = "";
    Подпись              = "";
    OCK                  = "oauth_consumer_key";
    OTK                  = "oauth_token";
    ТекущаяДатаUNIX      = OPI_Инструменты.UNIXTime(ТекущаяДата);
    ТекущаяДатаUNIX      = OPI_Инструменты.ЧислоВСтроку(ТекущаяДатаUNIX);
    ТаблицаПараметров    = Новый ТаблицаЗначений;
    ТаблицаПараметров.Колонки.Добавить("Ключ");
    ТаблицаПараметров.Колонки.Добавить("Значение");
        
    Для Каждого Поле Из Поля Цикл 
        
        НоваяСтрока = ТаблицаПараметров.Добавить();    
        НоваяСтрока.Ключ     = Поле.Ключ;
        НоваяСтрока.Значение = Поле.Значение;
        
    КонецЦикла;
    
    НоваяСтрока = ТаблицаПараметров.Добавить();
    НоваяСтрока.Ключ     = OCK;
    НоваяСтрока.Значение = Параметры[OCK];
    
    НоваяСтрока = ТаблицаПараметров.Добавить();
    НоваяСтрока.Ключ     = OTK;
    НоваяСтрока.Значение = Параметры[OTK];
    
    НоваяСтрока = ТаблицаПараметров.Добавить();
    НоваяСтрока.Ключ     = "oauth_version";
    НоваяСтрока.Значение = ВерсияАпи;
    
    НоваяСтрока = ТаблицаПараметров.Добавить();
    НоваяСтрока.Ключ     = "oauth_signature_method";
    НоваяСтрока.Значение = МетодХэширования;

    НоваяСтрока = ТаблицаПараметров.Добавить();
    НоваяСтрока.Ключ     = "oauth_timestamp";
    НоваяСтрока.Значение = ТекущаяДатаUNIX;

    НоваяСтрока = ТаблицаПараметров.Добавить();
    НоваяСтрока.Ключ     = "oauth_nonce";
    НоваяСтрока.Значение = ТекущаяДатаUNIX;

    Для Каждого СтрокаТаблицы Из ТаблицаПараметров Цикл
        
        СтрокаТаблицы.Ключ     = КодироватьСтроку(СтрокаТаблицы.Ключ, СпособКодированияСтроки.КодировкаURL);
        СтрокаТаблицы.Значение = КодироватьСтроку(СтрокаТаблицы.Значение, СпособКодированияСтроки.КодировкаURL);
        
    КонецЦикла;
    
    ТаблицаПараметров.Сортировать("Ключ");
    
    Для Каждого СтрокаТаблицы Из ТаблицаПараметров Цикл
        
        СтрокаСигнатуры = СтрокаСигнатуры 
            + СтрокаТаблицы.Ключ 
            + "="
            + СтрокаТаблицы.Значение
            + "&";
            
    КонецЦикла;
    
    СтрокаСигнатуры = Лев(СтрокаСигнатуры, СтрДлина(СтрокаСигнатуры) - 1);
    СтрокаСигнатуры = вРег(ВидЗапроса) 
        + "&" 
        + КодироватьСтроку(URL, СпособКодированияСтроки.КодировкаURL)
        + "&"
        + КодироватьСтроку(СтрокаСигнатуры, СпособКодированияСтроки.КодировкаURL);
        
    Подпись = КодироватьСтроку(Параметры["oauth_consumer_secret"], СпособКодированияСтроки.КодировкаURL)
        + "&" 
        + КодироватьСтроку(Параметры["oauth_token_secret"], СпособКодированияСтроки.КодировкаURL);
             
    Сигнатура = OPI_Криптография.HMAC(ПолучитьДвоичныеДанныеИзСтроки(Подпись)
        , ПолучитьДвоичныеДанныеИзСтроки(СтрокаСигнатуры)
        , ХешФункция.SHA1
        , 64);
        
    Сигнатура = КодироватьСтроку(Base64Строка(Сигнатура), СпособКодированияСтроки.КодировкаURL);
    
    Разделитель          = """,";
    ЗаголовокАвторизации = ЗаголовокАвторизации 
        + "OAuth "
        + "oauth_consumer_key="""      + Параметры[OCK]        + Разделитель
        + "oauth_token="""             + Параметры[OTK]        + Разделитель
        + "oauth_signature_method="""  + МетодХэширования      + Разделитель
        + "oauth_timestamp="""         + ТекущаяДатаUNIX       + Разделитель
        + "oauth_nonce="""             + ТекущаяДатаUNIX       + Разделитель
        + "oauth_version="""           + ВерсияАпи             + Разделитель
        + "oauth_signature="""         + Сигнатура;
        
        СоответствиеЗаголовка = Новый Соответствие;
        СоответствиеЗаголовка.Вставить("authorization", ЗаголовокАвторизации);
        
    Возврат СоответствиеЗаголовка;
        
КонецФункции

Функция СоздатьЗаголовокАвторизацииV2(Знач Параметры)
    
    СоответствиеВозврата = Новый Соответствие;
    СоответствиеВозврата.Вставить("Authorization", "Bearer " + Параметры["access_token"]);
    
    Возврат СоответствиеВозврата;
    
КонецФункции

Функция ПолучитьСтатусОбработки(Знач Параметры, Знач Поля, Знач URL)

	ProcessingInfo   = "processing_info";
    Авторизация = СоздатьЗаголовокАвторизацииV1(Параметры, Поля, "POST", URL);
    
    Ответ = OPI_Инструменты.Post(URL, Поля, Авторизация, Ложь);

    
    Информация = Ответ[ProcessingInfo];
    
    Если Не ЗначениеЗаполнено(Информация) Тогда
    	Возврат Ответ;
    КонецЕсли;
    
    СтатусОбработки = Информация["state"];
    
    Если Не ЗначениеЗаполнено(СтатусОбработки) Тогда
    	Возврат Ответ;
    Иначе
    	Возврат СтатусОбработки;
    КонецЕсли;	
    
КонецФункции

#КонецОбласти
