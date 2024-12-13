// OneScript: ./OInt/core/Modules/OPI_TCP.os
// Lib: TCP
// CLI: tcp

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
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область TCPКлиент

// !NOCLI
// Открыть соединение
// Создает TCP/TLS соединение
//
// Параметры:
//  Адрес - Строка - Адрес и порт для подключения                 - address
//  SSL   - Булево - Признак использования защищенного соединения - ssl
//
// Возвращаемое значение:
//  Неопределено, Произвольный -  Возвращает объект TCP клиента при успешном подключении или неопределено
Функция ОткрытьСоединение(Знач Адрес, Знач SSL = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Адрес);
    OPI_ПреобразованиеТипов.ПолучитьБулево(SSL);

    TCPКлиент = OPI_Инструменты.ПолучитьКомпоненту("TCPClient");

    TCPКлиент.Address = Адрес;
    TCPКлиент.SSL     = SSL;

    Успех = TCPКлиент.Connect();

    Возврат ?(Успех, TCPКлиент, Неопределено);

КонецФункции

// !NOCLI
// Закрыть соединение
// Явно закрывает созданное ранее соединение
//
// Параметры:
//  Соединение - Произвольный - Соединение, см. ОткрытьСоединение - tcp
//
// Возвращаемое значение:
//  Булево - всегда возвращает Истина
Функция ЗакрытьСоединение(Знач Соединение) Экспорт
    Возврат Соединение.Disconnect();
КонецФункции

// !NOCLI
// Получить данные
// Читает данные из указанного соединения
//
// Примечание:
// При установке параметров Таймаут и Размер в 0, чтение производится до окончания сообщения
//
// Параметры:
//  Соединение - Произвольный - Соединение, см. ОткрытьСоединение                 - tcp
//  Таймаут    - Число        - Время чтения данных (сек). 0 > до конца сообщения - timeout
//  Размер     - Число        - Максимальный размер данных. 0 > без ограничений   - size
//
// Возвращаемое значение:
//  ДвоичныеДанные - Полученные данные
Функция ПолучитьДанные(Знач Соединение, Знач Таймаут = 0, Знач Размер = 0) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьЧисло(Таймаут);
    OPI_ПреобразованиеТипов.ПолучитьЧисло(Размер);

    Возврат Соединение.Read(1024, 150, Таймаут, Размер);

КонецФункции

// Подключиться и получить данные
// Создает соединение и читает данные до конца или по ограничениям
//
// Примечание:
// При установке параметров Таймаут и Размер в 0, чтение производится до окончания сообщения
//
// Параметры:
//  Адрес     - Строка - Адрес и порт для подключения                       - address
//  SSL       - Булево - Признак использования защищенного соединения       - ssl
//  Таймаут   - Число  - Время чтения данных (сек). 0 > до конца сообщения  - timeout
//  Размер    - Число  - Максимальный размер данных. 0 > без ограничений    - size
//  Строкой   - Булево - Истина > возвращает строку, Ложь > двоичные данные - string
//  Кодировка - Строка - Кодировка получаемых данных                        - enc
//
// Возвращаемое значение:
//  Строка, ДвоичныеДанные -  Полученные данные
Функция ПодключитьсяИПолучитьДанные(Знач Адрес
    , Знач SSL = Ложь
    , Знач Таймаут = 0
    , Знач Размер = 0
    , Знач Строкой = Истина
    , Знач Кодировка = "UTF-8") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Строкой);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Кодировка);
    OPI_ПреобразованиеТипов.ПолучитьЧисло(Размер);
    OPI_ПреобразованиеТипов.ПолучитьЧисло(Таймаут);

    Соединение = ОткрытьСоединение(Адрес, SSL);

    Если Не ЗначениеЗаполнено(Соединение) Тогда
        ВызватьИсключение "Не удалось создать Соединение";
    КонецЕсли;

    Сообщение = ПолучитьДанные(Соединение, Таймаут, Размер);

    Если Строкой Тогда
        Сообщение = ПолучитьСтрокуИзДвоичныхДанных(Сообщение);
    КонецЕсли;

    ЗакрытьСоединение(Соединение);

    Возврат Сообщение;

КонецФункции

#КонецОбласти

#КонецОбласти
