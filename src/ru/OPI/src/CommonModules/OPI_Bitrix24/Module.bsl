// OneScript: ./OInt/core/Modules/OPI_Bitrix24.os
// Lib: Bitrix24
// CLI: bitrix24

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UnreachableCode-off
// BSLLS:CommentedCode-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область НастройкиИАдминистрирование

// Получить ссылку авторизации приложения
// Формирует ссылку для авторизации через браузер
// 
// Параметры:
//  Домен    - Строка - Адрес битрикс вида portal.bitrix24.com
//  ClientID - Строка - Client ID из настроек приложения
// 
// Возвращаемое значение:
//  Строка - URL для перехода в браузере
Функция ПолучитьСсылкуАвторизацииПриложения(Знач Домен, Знач ClientID) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Домен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientID);
    
    Если Не СтрНачинаетсяС(Домен, "http") Тогда
        URL = "https://" + Домен;
    КонецЕсли;
    
    Если Не СтрЗаканчиваетсяНа(URL, "/") Тогда
        URL = URL + "/";
    КонецЕсли;
    
    URL = URL + "oauth/authorize/?client_id=" + ClientID;
    
    Возврат URL;
        
КонецФункции

// Получить токен
// Получает токен по коду авторизации
// 
// Параметры:
//  ClientID     - Строка - Client ID из настроек приложения
//  ClientSecret - Строка - Client secret из настроек приложения
//  Code         - Строка - Code из авторизации через браузер
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24
Функция ПолучитьТокен(Знач ClientID, Знач ClientSecret, Знач Code) Экспорт
    
    URL = "https://oauth.bitrix.info/oauth/token/";
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("grant_type"   , "authorization_code", "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("client_id"    , ClientID            , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("client_secret", ClientSecret        , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("code"         , Code                , "Строка", Параметры);  
    
    Ответ = OPI_Инструменты.Get(URL, Параметры);
    
    Возврат Ответ;
    
КонецФункции

// Обновить токен
// Обновляет токен по Refresh токену
// 
// Параметры:
//  ClientID     - Строка - Client ID из настроек приложения
//  ClientSecret - Строка - Client secret из настроек приложения
//  Refresh      - Строка - Refresh токен
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24
Функция ОбновитьТокен(Знач ClientID, Знач ClientSecret, Знач Refresh) Экспорт
    
    URL = "https://oauth.bitrix.info/oauth/token/";
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("grant_type"   , "refresh_token"     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("client_id"    , ClientID            , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("client_secret", ClientSecret        , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("refresh_token", Refresh             , "Строка", Параметры);  
    
    Ответ = OPI_Инструменты.Get(URL, Параметры);
    
    Возврат Ответ;

Конецфункции

// Серверное время
// Получает текущее серверное время
// 
// Параметры:
//  URL   - Строка - URL внешнего веб-хука или адрес Bitrix24 при использовании токена
//  Токен - Строка - Токен авторизации, если используется не веб-хук 
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24
Функция СерверноеВремя(Знач URL, Знач Токен = "") Экспорт
	
	Параметры = НормализоватьАвторизацию(URL, Токен, "server.time");
	Ответ     = OPI_Инструменты.Get(URL, Параметры);
	
	Возврат Ответ;
		
КонецФункции

#КонецОбласти

#Область ЖиваяЛента

// Создать новость.
// 
// Параметры:
//  URL       - Строка - URL внешнего веб-хука или адрес Bitrix24 при использовании токена
//  Текст     - Строка - Текст новости
//  Видмость  - Строка - Массив/Один получатель (UA все, SG<X> раб. группа, U<X> пользователь, DR<X> отдел, G<X> группа)
//  Файлы     - Строка - Данные вложений, где ключ > имя файла, значение > путь к файлу иди двоичные данные
//  Заголовок - Строка -  Заголовок
//  Токен     - Строка - Токен авторизации, если используется не веб-хук
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24
Функция СоздатьНовость(Знач URL
	, Знач Текст
	, Знач Видмость = "UA"
	, Знач Файлы = ""
	, Знач Заголовок = ""
	, Знач Токен = "") Экспорт
    
    Параметры = НормализоватьАвторизацию(URL, Токен, "log.blogpost.add");
    OPI_Инструменты.ДобавитьПоле("POST_MESSAGE", Текст    , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("POST_TITLE"  , Заголовок, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("DEST"        , Видмость , "Массив", Параметры);
    
    Если ЗначениеЗаполнено(Файлы) Тогда
        
        OPI_ПреобразованиеТипов.ПолучитьКоллекцию(Файлы);
        
        МассивФайлов = НормализоватьФайлы(Файлы);
        
        Если Не МассивФайлов.Количество() = 0 Тогда
            Параметры.Вставить("FILES", МассивФайлов);
        КонецЕсли;
        
    Конецесли;
    
    Ответ = OPI_Инструменты.Post(URL, Параметры);
    
    Возврат Ответ;
    
КонецФункции

// Удалить новость.
// 
// Параметры:
//  URL       - Строка        - URL внешнего веб-хука или адрес Bitrix24 при использовании токена
//  IDНовости - Строка, Число - ID новости для удаления
//  Токен     - Строка        - Токен авторизации, если используется не веб-хук
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24
Функция УдалитьНовость(Знач URL, Знач IDНовости, Знач Токен = "") Экспорт
    
    Параметры = НормализоватьАвторизацию(URL, Токен, "log.blogpost.delete");
    OPI_Инструменты.ДобавитьПоле("POST_ID", IDНовости, "Строка", Параметры);
    
    Ответ = OPI_Инструменты.Post(URL, Параметры);
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Функция НормализоватьАвторизацию(URL, Знач Токен, Знач Метод = "")
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    
    Параметры             = Новый Структура;
    ЭтоАвторизацияТокеном = ЗначениеЗаполнено(Токен);
    
	МассивЛишнихЭлементов = Новый Массив;
	МассивЛишнихЭлементов.Добавить("https://");
	МассивЛишнихЭлементов.Добавить("http://");
	МассивЛишнихЭлементов.Добавить("www.");
	
	Для Каждого УдаляемыйЭлемент Из МассивЛишнихЭлементов Цикл
		URL = СтрЗаменить(URL, УдаляемыйЭлемент, "");
	КонецЦикла;
	
	URL = СокрЛП(URL);
	
	Если Не СтрЗаканчиваетсяНа(URL, "/") Тогда
		URL = URL + "/";
    КонецЕсли;
    
    Если ЭтоАвторизацияТокеном Тогда
        
        Если Не СтрЗаканчиваетсяНа(URL, "rest/") Тогда
    		URL = URL + "rest/";
        КонецЕсли;
        
        Параметры.Вставить("auth", Токен);
        
    КонецЕсли;
	
	Если ЗначениеЗаполнено(Метод) Тогда
		URL = URL + СокрЛП(Метод);
    КонецЕсли;
    
    Возврат Параметры;

КонецФункции

Функция НормализоватьФайлы(Знач Файлы)
    
    НормализованныеФайлы = Новый Массив;

    Если Не ТипЗнч(Файлы) = Тип("Соответствие") Тогда
        Возврат НормализованныеФайлы; 
    КонецЕсли;
    
    Для Каждого Файл Из Файлы Цикл
        
        ТекущийМассив = Новый Массив;
        ТекущийФайл   = Файл.Значение;
        ТекущееИмя    = Файл.Ключ;
        
        OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(ТекущийФайл);
        OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущееИмя);
        
        ТекущийМассив.Добавить(ТекущееИмя);
        ТекущийМассив.Добавить(Base64Строка(ТекущийФайл));
        
        НормализованныеФайлы.Добавить(ТекущийМассив);
        
    КонецЦикла;
    
    Возврат НормализованныеФайлы;
    
КонецФункции

#КонецОбласти
