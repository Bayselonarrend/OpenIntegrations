// OneScript: ./OInt/core/Modules/OPI_YandexMetrika.os
// Lib: Yandex Metrika
// CLI: metrika

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
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область УправлениеМетками

// Создать метку
// Создает метку с указанным именем
// 
// Примечание:
// Метод в документации API: [Создание метки](@yandex.ru/dev/metrika/ru/management/openapi/label/createLabel)
//
// Параметры:
//  Токен        - Строка - Токен авторизации  - token
//  Наименование - Строка - Наименование метки - title
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция СоздатьМетку(Знач Токен, Знач Наименование) Экспорт
    
    Заголовки = OPI_YandexID.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://api-metrika.yandex.net/management/v1/labels";
    
    Метка = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("name", Наименование, "Строка", Метка);
    
    Ответ = OPI_Инструменты.Post(URL, Новый Структура("label", Метка), Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Изменить метку
// Изменяет имя метки по ID
// 
// Примечание:
// Метод в документации API: [Изменение метки](@yandex.ru/dev/metrika/ru/management/openapi/label/updateLabel)
//
// Параметры:
//  Токен        - Строка - Токен авторизации      - token
//  IDМетки      - Строка - ID метки для изменения - label
//  Наименование - Строка - Новое наименование     - title
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ИзменитьМетку(Знач Токен, Знач IDМетки, Знач Наименование) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(IDМетки);
    
    Заголовки = OPI_YandexID.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://api-metrika.yandex.net/management/v1/label/" + IDМетки;
    
    Метка = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("name", Наименование, "Строка", Метка);
    
    Ответ = OPI_Инструменты.Put(URL, Новый Структура("label", Метка), Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Получить метку
// Получает метку по ID
// 
// Примечание:
// Метод в документации API: [Информация о метке](@yandex.ru/dev/metrika/ru/management/openapi/label/getLabel)
//
// Параметры:
//  Токен   - Строка - Токен авторизации - token
//  IDМетки - Строка - ID метки          - label
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ПолучитьМетку(Знач Токен, Знач IDМетки) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(IDМетки);
    
    Заголовки = OPI_YandexID.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://api-metrika.yandex.net/management/v1/label/" + IDМетки;
    
    Ответ = OPI_Инструменты.Get(URL, , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Удалить метку
// Удаляет метку по ID
// 
// Примечание:
// Метод в документации API: [Удаление метки](@yandex.ru/dev/metrika/ru/management/openapi/label/deleteLabel)
//
// Параметры:
//  Токен   - Строка - Токен авторизации     - token
//  IDМетки - Строка - ID метки для удаления - label
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция УдалитьМетку(Знач Токен, Знач IDМетки) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(IDМетки);
    
    Заголовки = OPI_YandexID.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://api-metrika.yandex.net/management/v1/label/" + IDМетки;
    
    Ответ = OPI_Инструменты.Delete(URL, , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Получить список меток
// Получает список меток пользователя
// 
// Примечание:
// Метод в документации API: [Список меток пользователя](@yandex.ru/dev/metrika/ru/management/openapi/label/getLabels)
//
// Параметры:
//  Токен - Строка - Токен авторизации - token
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ПолучитьСписокМеток(Знач Токен) Экспорт
    
    Заголовки = OPI_YandexID.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://api-metrika.yandex.net/management/v1/labels";
    
    Ответ = OPI_Инструменты.Get(URL, , Заголовки);
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти

#КонецОбласти
