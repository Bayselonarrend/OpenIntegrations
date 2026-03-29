// OneScript: ./OInt/api/tcp/Modules/OPI_WebSocket.os
// Lib: WebSocket
// CLI: ws
// Keywords: websocket, ws

// DocsCategory: Exchange
// DocsNameRU: WebSocket
// DocsNameEN: WebSocket

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:DuplicateStringLiteral-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Использовать "../../../tools/main"
#Использовать "../../../tools/http"

#Область ПрограммныйИнтерфейс

#Область МетодыКлиента

// Это объект клиента !NOCLI
// Проверяет, что значение является объектом внешней компоненты клиента WebSocket
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоОбъектКлиента(Знач Значение) Экспорт

    Возврат Строка(ТипЗнч(Значение)) = "AddIn.OPI_WSClient.Main";

КонецФункции

#КонецОбласти

#Область МетодыСервера

// Запустить сервер !NOCLI
// Запускает ожидание сообщений на указанном порту
//
// Параметры:
//  Порт        - Число                      - Порт сервера                                              - port
//  РазмерПула  - Число                      - Максимальное число одновременно поддерживаемых соединений - psize
//  Логирование - Структура Из КлючИЗначение - Настройки логирования. См. ПолучитьНастройкиЛогирования   - log
//
// Возвращаемое значение:
//  Произвольный - Объект сервера или соответствие с информацией об ошибке
Функция ЗапуститьСервер(Знач Порт, Знач РазмерПула = 100, Знач Логирование = Неопределено) Экспорт

    Возврат OPI_УниверсальныйСервер.ЗапуститьСервер(OPI_WebSocket, Порт, РазмерПула, Логирование);

КонецФункции

// Остановить сервер !NOCLI
// Завершает работу сервера
//
// Параметры:
//  ОбъектСервера - Произвольный - Объект компоненты запущенного сервера - srv
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения
Функция ОстановитьСервер(Знач ОбъектСервера) Экспорт

    Возврат OPI_УниверсальныйСервер.ОстановитьСервер(OPI_WebSocket, ОбъектСервера);

КонецФункции

// Получить данные очередного соединения !NOCLI
// Получает данные из буфера очередного активного соединения в очереди, где есть данные входящие данные
//
// Параметры:
//  ОбъектСервера      - Произвольный - Объект компоненты запущенного сервера                   - srv
//  Таймаут            - Число        - Период ожидания новых данных, если очередь пуста (в мс) - tout
//  МаксимальныйРазмер - Число        - Максимальный размер данных для получения                - msize
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения
Функция ПолучитьДанныеОчередногоСоединения(Знач ОбъектСервера, Знач Таймаут = 1000, Знач МаксимальныйРазмер = 8192) Экспорт

    Возврат OPI_УниверсальныйСервер.ПолучитьДанныеОчередногоСоединения(OPI_WebSocket
        , ОбъектСервера
        , Таймаут
        , МаксимальныйРазмер);

КонецФункции

// Получить данные соединения !NOCLI
// Получает данные из буфера конкретного соединения по ID
//
// Параметры:
//  ОбъектСервера      - Произвольный - Объект компоненты запущенного сервера                   - srv
//  IDСоединения       - Строка       - Идентификатор соединения                                - id
//  Таймаут            - Число        - Период ожидания новых данных, если очередь пуста (в мс) - tout
//  МаксимальныйРазмер - Число        - Максимальный размер данных для получения                - msize
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения
Функция ПолучитьДанныеСоединения(Знач ОбъектСервера
    , Знач IDСоединения
    , Знач Таймаут = 1000
    , Знач МаксимальныйРазмер = 8192) Экспорт

    Возврат OPI_УниверсальныйСервер.ПолучитьДанныеСоединения(OPI_WebSocket
        , ОбъектСервера
        , IDСоединения
        , Таймаут
        , МаксимальныйРазмер);

КонецФункции

// Отправить данные !NOCLI
// Отправляет данные в указанное соединение
//
// Параметры:
//  ОбъектСервера - Произвольный           - Объект компоненты запущенного сервера - srv
//  IDСоединения  - Строка                 - Идентификатор соединения              - id
//  Данные        - Строка, ДвоичныеДанные - Данные для отправки                   - data
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения
Функция ОтправитьДанные(Знач ОбъектСервера, Знач IDСоединения, Знач Данные) Экспорт

    Возврат OPI_УниверсальныйСервер.ОтправитьДанные(OPI_WebSocket, ОбъектСервера, IDСоединения, Данные);

КонецФункции

// Закрыть входящее соединение !NOCLI
// Закрывает входящее соединение сервера по ID
//
// Параметры:
//  ОбъектСервера - Произвольный - Объект компоненты запущенного сервера - srv
//  IDСоединения  - Строка       - Идентификатор соединения              - id
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения
Функция ЗакрытьВходящееСоединение(Знач ОбъектСервера, Знач IDСоединения) Экспорт

    Возврат OPI_УниверсальныйСервер.ЗакрытьВходящееСоединение(OPI_WebSocket, ОбъектСервера, IDСоединения);

КонецФункции

// Получить список соединений !NOCLI
// Получает список соединений
//
// Примечание:
// В списке выводятся активные соединения и закрытые соединения с необработанными данными в буфере
//
// Параметры:
//  ОбъектСервера - Произвольный - Объект компоненты запущенного сервера - srv
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения
Функция ПолучитьСписокСоединений(Знач ОбъектСервера) Экспорт

    Возврат OPI_УниверсальныйСервер.ПолучитьСписокСоединений(OPI_WebSocket, ОбъектСервера);

КонецФункции

// Получить лог !NOCLI
// Получает данные лога сервера (при включенном логировании в память)
//
// Параметры:
//  ОбъектСервера - Произвольный - Объект компоненты запущенного сервера                      - srv
//  КакСтрока     - Булево       - Истина > возвращает лог одной строкой, Ложь > как массив   - str
//  ЧислоСобытий  - Число        - Число последних событий для получения. 0 > без ограничений - count
//
// Возвращаемое значение:
//  Строка, Соответствие Из КлючИЗначение - Лог как строка или соответствие с полным результатом выполнения
Функция ПолучитьЛог(Знач ОбъектСервера, Знач КакСтрока = Ложь, Знач ЧислоСобытий = 100) Экспорт

    Возврат OPI_УниверсальныйСервер.ПолучитьЛог(OPI_WebSocket
        , ОбъектСервера
        , КакСтрока
        , ЧислоСобытий);

КонецФункции

// Получить настройки логирования !NOCLI
// Получает структуру настроек для запуска логирования при старте сервера
//
// Параметры:
//  ЗаписьВПамять   - Булево - Запись лог в память для дальнейшего получения из объекта компоненты - memory
//  МаксимумСобытий - Число  - Максимальное число события, хранящееся в память                     - count
//  ПутьКФайлу      - Строка - Путь к файлу для сохранения полного лога, если необходимо           - path
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура настроек
Функция ПолучитьНастройкиЛогирования(Знач ЗаписьВПамять = Истина
    , Знач МаксимумСобытий = 300
    , Знач ПутьКФайлу = "") Экспорт

    //@skip-check constructor-function-return-section
    Возврат OPI_УниверсальныйСервер.ПолучитьНастройкиЛогирования(ЗаписьВПамять, МаксимумСобытий, ПутьКФайлу);

КонецФункции

// Это объект сервера !NOCLI
// Проверяет, что значение является объектом внешней компоненты сервера TCP
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоОбъектСервера(Знач Значение) Экспорт

    Возврат Строка(ТипЗнч(Значение)) = "AddIn.OPI_WSServer.Main";

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Функция ИмяКомпоненты() Экспорт

    Возврат "WSServer";

КонецФункции

#КонецОбласти


#Region Alternate

Function IsClientObject(Val Value) Export
    Return ЭтоОбъектКлиента(Value);
EndFunction

Function StartServer(Val Port, Val PoolSize = 100, Val Logging = Undefined) Export
    Return ЗапуститьСервер(Port, PoolSize, Logging);
EndFunction

Function StopServer(Val ServerObject) Export
    Return ОстановитьСервер(ServerObject);
EndFunction

Function GetNextConnectionData(Val ServerObject, Val Timeout = 1000, Val MaxSize = 8192) Export
    Return ПолучитьДанныеОчередногоСоединения(ServerObject, Timeout, MaxSize);
EndFunction

Function GetConnectionData(Val ServerObject, Val ConnectionID, Val Timeout = 1000, Val MaxSize = 8192) Export
    Return ПолучитьДанныеСоединения(ServerObject, ConnectionID, Timeout, MaxSize);
EndFunction

Function SendData(Val ServerObject, Val ConnectionID, Val Data) Export
    Return ОтправитьДанные(ServerObject, ConnectionID, Data);
EndFunction

Function CloseIncomingConnection(Val ServerObject, Val ConnectionID) Export
    Return ЗакрытьВходящееСоединение(ServerObject, ConnectionID);
EndFunction

Function GetConnectionList(Val ServerObject) Export
    Return ПолучитьСписокСоединений(ServerObject);
EndFunction

Function GetLog(Val ServerObject, Val AsString = False, Val EventCount = 100) Export
    Return ПолучитьЛог(ServerObject, AsString, EventCount);
EndFunction

Function GetLoggingSettings(Val WriteToMemory = True, Val MaxEvents = 300, Val FilePath = "") Export
    Return ПолучитьНастройкиЛогирования(WriteToMemory, MaxEvents, FilePath);
EndFunction

Function IsServerObject(Val Value) Export
    Return ЭтоОбъектСервера(Value);
EndFunction

Function AddInName() Export
    Return ИмяКомпоненты();
EndFunction

#EndRegion