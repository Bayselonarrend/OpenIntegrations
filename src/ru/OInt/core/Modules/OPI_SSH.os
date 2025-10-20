// OneScript: ./OInt/core/Modules/OPI_SSH.os
// Lib: SSH
// CLI: ssh
// Keywords: ssh, shell

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

#Область ПрограммныйИнтерфейс

#Область ОсновныеМетоды

// Открыть соединение !NOCLI
// Создает новый сеанс SSH
//
// Примечание:
// Получить конфигурацию соединения можно при помощи функций `ПолучитьНастройкиЛогинПароль`,^^
// `ПолучитьНастройкиПриватныйКлюч`, `ПолучитьНастройкиЧерезАгента`
//
// Параметры:
//  НастройкиSSH - Структура Из КлючИЗначение -  Структура настроек соединения              - set
//  Прокси       - Структура Из КлючИЗначение -  Структура настроек прокси, если необходимо - proxy
//
// Возвращаемое значение:
//  Произвольный, Соответствие Из КлючИЗначение -  Открыть соединение
Функция ОткрытьСоединение(Знач НастройкиSSH, Знач Прокси = "") Экспорт

    Возврат OPI_ЗапросыSSH.ОткрытьСоединение(НастройкиSSH, Прокси);

КонецФункции

// Получить конфигурацию соединения
// Формирует полную структуру настроек соединения, которая может быть использована вместо самого соединения при вызове других функций
//
// Примечание:
// Может быть передана в качестве параметра `Соединение` в других функциях вместо настоящего соединения из функции `ОткрытьСоединение`.^^
// При этом новое соединение будет открыто и закрыто в рамках вызываемой функции
// Не рекомендуется использовать конфигурацию соединения при множественных обращениях к серверу SSH.^^
// Данный функционал предназначен, в первую очередь для CLI версии ОПИ, где хранение соединения между вызовами невозможно
//
// Параметры:
//  НастройкиSSH - Структура Из КлючИЗначение - Настройки SSH                                                  - set
//  Прокси       - Структура Из КлючИЗначение - Настройки прокси, если необходимо. См. ПолучитьНастройкиПрокси - proxy
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура настроек соединения
Функция ПолучитьКонфигурациюСоединения(Знач НастройкиSSH, Знач Прокси = Неопределено) Экспорт

    Возврат OPI_ЗапросыSSH.ПолучитьКонфигурациюСоединения(НастройкиSSH, Прокси);

КонецФункции

// Выполнить команду
// Выполняет указанную команду
//
// Параметры:
//  Соединение - Произвольный - Существующее соединение или конфигурация соединения - conn
//  Команда    - Строка       - Текст команды                                       - comm
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ВыполнитьКоманду(Знач Соединение, Знач Команда) Экспорт

    Возврат OPI_ЗапросыSSH.ВыполнитьКоманду(Соединение, Команда);

КонецФункции

// Закрыть соединение !NOCLI
// Явно закрывает переданное соединение
//
// Параметры:
//  Соединение - Произвольный - Объект компоненты с открытым соединением - conn
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Результат закрытия соединения
Функция ЗакрытьСоединение(Знач Соединение) Экспорт

    Возврат OPI_ЗапросыSSH.ЗакрытьСоединение(Соединение);

КонецФункции

// Это коннектор !NOCLI
// Проверяет, что значение является объектом внешней компоненты для работы с SSH
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоКоннектор(Знач Значение) Экспорт

    Возврат OPI_ЗапросыSSH.ЭтоКоннектор(Значение);

КонецФункции

// Получить настройки (логин/пароль)
// Получает настройки соединения с авторизацией через логин и пароль
//
// Параметры:
//  Хост   - Строка - Хост SSH                - host
//  Порт   - Число  - Порт SSH                - port
//  Логин  - Строка - Имя пользователя SSH    - user
//  Пароль - Строка - Пароль пользователя SSH - pass
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение -  Конфигурация соединения
Функция ПолучитьНастройкиЛогинПароль(Знач Хост, Знач Порт, Знач Логин, Знач Пароль = "") Экспорт

    Возврат OPI_ЗапросыSSH.ПолучитьНастройкиЛогинПароль(Хост, Порт, Логин, Пароль);

КонецФункции

// Получить настройки (приватный ключ)
// Получает настройки соединения с авторизацией через приватный ключ
//
// Параметры:
//  Хост       - Строка - Хост SSH                             - host
//  Порт       - Число  - Порт SSH                             - port
//  Логин      - Строка - Имя пользователя SSH                 - user
//  Приватный  - Строка - Путь к файлу приватного ключа        - key
//  Публичный  - Строка - Путь к файлу публичного ключ         - pub
//  Пароль     - Строка - Пароль (passphrase) приватного ключа - pass
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение -  Конфигурация соединения
Функция ПолучитьНастройкиПриватныйКлюч(Знач Хост
    , Знач Порт
    , Знач Логин
    , Знач Приватный
    , Знач Публичный = ""
    , Знач Пароль = "") Экспорт

    Возврат OPI_ЗапросыSSH.ПолучитьНастройкиПриватныйКлюч(Хост, Порт, Логин, Приватный, Публичный, Пароль);

КонецФункции

// Получить настройки (через агента)
// Получает настройки соединения с авторизацией через SSH Agent
//
// Параметры:
//  Хост       - Строка - Хост SSH                             - host
//  Порт       - Число  - Порт SSH                             - port
//  Логин      - Строка - Имя пользователя SSH                 - user
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение -  Конфигурация соединения
Функция ПолучитьНастройкиЧерезАгента(Знач Хост, Знач Порт, Знач Логин) Экспорт

    Возврат OPI_ЗапросыSSH.ПолучитьНастройкиЧерезАгента(Хост, Порт, Логин);

КонецФункции

// Получить настройки прокси
// Формирует структуру настроек прокси-сервера для соединения
//
// Параметры:
//  Адрес  - Строка               - Адрес прокси                            - addr
//  Порт   - Число                - Порт прокси                             - port
//  Вид    - Строка               - Вид прокси: socks5, socks4, http        - type
//  Логин  - Строка, Неопределено - Логин авторизации, если необходимо      - login
//  Пароль - Строка, Неопределено - Пароль для авторизации, если необходимо - pass
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура настроек прокси
Функция ПолучитьНастройкиПрокси(Знач Адрес
    , Знач Порт
    , Знач Вид = "socks5"
    , Знач Логин = Неопределено
    , Знач Пароль = Неопределено) Экспорт

    Возврат OPI_ЗапросыSSH.ПолучитьНастройкиПрокси(Адрес, Порт, Вид, Логин, Пароль);

КонецФункции

#КонецОбласти

#КонецОбласти

#Region Alternate

Function CreateConnection(Val SSHSettings, Val Proxy = "") Export
	Return ОткрытьСоединение(SSHSettings, Proxy);
EndFunction

Function GetConnectionConfiguration(Val SSHSettings, Val Proxy = Undefined) Export
	Return ПолучитьКонфигурациюСоединения(SSHSettings, Proxy);
EndFunction

Function ExecuteCommand(Val Connection, Val Command) Export
	Return ВыполнитьКоманду(Connection, Command);
EndFunction

Function CloseConnection(Val Connection) Export
	Return ЗакрытьСоединение(Connection);
EndFunction

Function IsConnector(Val Value) Export
	Return ЭтоКоннектор(Value);
EndFunction

Function GetSettingsLoginPassword(Val Host, Val Port, Val Login, Val Password = "") Export
	Return ПолучитьНастройкиЛогинПароль(Host, Port, Login, Password);
EndFunction

Function GetSettingsPrivateKey(Val Host, Val Port, Val Login, Val Private, Val Public = "", Val Password = "") Export
	Return ПолучитьНастройкиПриватныйКлюч(Host, Port, Login, Private, Public, Password);
EndFunction

Function GetSettingsViaAgent(Val Host, Val Port, Val Login) Export
	Return ПолучитьНастройкиЧерезАгента(Host, Port, Login);
EndFunction

Function GetProxySettings(Val Address, Val Port, Val View = "socks5", Val Login = Undefined, Val Password = Undefined) Export
	Return ПолучитьНастройкиПрокси(Address, Port, View, Login, Password);
EndFunction

#EndRegion