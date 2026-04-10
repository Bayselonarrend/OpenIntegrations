// OneScript: ./OInt/tests/Modules/OPIt_WebSocket.os

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
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

// #Использовать oint
// #Использовать asserts
// #Использовать "internal"

// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("WebSocket");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("WebSocket");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область WebSocket

Процедура WS_Клиент() Экспорт

    МассивВариантов = OPI_ПолучениеДанныхТестов.ПолучитьВариантыПараметровWebSocket();

    Для Каждого ПараметрыТеста Из МассивВариантов Цикл

        WebSocket_ОткрытьСоединение(ПараметрыТеста);
        WebSocket_ЗакрытьСоединение(ПараметрыТеста);
        WebSocket_ОтправитьПинг(ПараметрыТеста);
        WebSocket_ОтправитьПонг(ПараметрыТеста);
        WebSocket_ПолучитьСообщение(ПараметрыТеста);
        WebSocket_ОтправитьТекстовоеСообщение(ПараметрыТеста);
        WebSocket_ОтправитьДвоичноеСообщение(ПараметрыТеста);
        WebSocket_ПолучитьНастройкиTls(ПараметрыТеста);
        WebSocket_ЭтоОбъектКлиента(ПараметрыТеста);

    КонецЦикла;

КонецПроцедуры

#КонецОбласти // WebSocket

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область WebSocket

Процедура WebSocket_ОткрытьСоединение(ПараметрыФункции)

    Постфикс   = ПараметрыФункции["Postfix"];
    Соединение = СоздатьКлиентWebSocket(ПараметрыФункции);

    OPI_ПолучениеДанныхТестов.Обработать(Соединение, "WebSocket", "ОткрытьСоединение", Постфикс);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        OPI_WebSocket.ЗакрытьСоединение(Соединение);
    КонецЕсли;

КонецПроцедуры

Процедура WebSocket_ЗакрытьСоединение(ПараметрыФункции)

    Постфикс   = ПараметрыФункции["Postfix"];
    Соединение = СоздатьКлиентWebSocket(ПараметрыФункции);

    OPI_ПолучениеДанныхТестов.Обработать(Соединение, "WebSocket", "ЗакрытьСоединение", "Открытие, " + Постфикс); // SKIP

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        Результат = OPI_WebSocket.ЗакрытьСоединение(Соединение);
    Иначе
        Результат = Соединение;
    КонецЕсли;

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ЗакрытьСоединение", Постфикс);

КонецПроцедуры

Процедура WebSocket_ОтправитьПинг(ПараметрыФункции)

    Постфикс   = ПараметрыФункции["Postfix"];
    Соединение = СоздатьКлиентWebSocket(ПараметрыФункции);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        Результат = OPI_WebSocket.ОтправитьПинг(Соединение);
        Проверка  = OPI_WebSocket.ПолучитьСообщение(Соединение, 3000);
    Иначе
        Результат = Соединение;
        Проверка  = Соединение;
    КонецЕсли;

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ОтправитьПинг", Постфикс);
    OPI_ПолучениеДанныхТестов.Обработать(Проверка , "WebSocket", "ОтправитьПинг", "Проверка, " + Постфикс);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        OPI_WebSocket.ЗакрытьСоединение(Соединение);
    КонецЕсли;

КонецПроцедуры

Процедура WebSocket_ОтправитьПонг(ПараметрыФункции)

    Постфикс   = ПараметрыФункции["Postfix"];
    Соединение = СоздатьКлиентWebSocket(ПараметрыФункции);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        Результат = OPI_WebSocket.ОтправитьПонг(Соединение);
    Иначе
        Результат = Соединение;
    КонецЕсли;

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ОтправитьПонг", Постфикс);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        OPI_WebSocket.ЗакрытьСоединение(Соединение);
    КонецЕсли;

КонецПроцедуры

Процедура WebSocket_ПолучитьСообщение(ПараметрыФункции)

    Постфикс   = ПараметрыФункции["Postfix"];
    Соединение = СоздатьКлиентWebSocket(ПараметрыФункции);
    Сообщение = "echo-text-" + Формат(ТекущаяДата(), "ДФ=yyyyMMddhhmmss");

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        Отправка  = OPI_WebSocket.ОтправитьТекстовоеСообщение(Соединение, Сообщение); // SKIP
        OPI_ПолучениеДанныхТестов.Обработать(Отправка, "WebSocket", "ПолучитьСообщение", "Отправка, " + Постфикс); // SKIP
        Результат = OPI_WebSocket.ПолучитьСообщение(Соединение, 3000);
    Иначе
        Результат = Соединение;
    КонецЕсли;

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ПолучитьСообщение", Постфикс, Сообщение);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        OPI_WebSocket.ЗакрытьСоединение(Соединение);
    КонецЕсли;

КонецПроцедуры

Процедура WebSocket_ОтправитьТекстовоеСообщение(ПараметрыФункции)

    Постфикс   = ПараметрыФункции["Postfix"];
    Соединение = СоздатьКлиентWebSocket(ПараметрыФункции);
    Сообщение = "text-message-" + Формат(ТекущаяДата(), "ДФ=yyyyMMddhhmmss");

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        Результат = OPI_WebSocket.ОтправитьТекстовоеСообщение(Соединение, Сообщение);
        Проверка  = OPI_WebSocket.ПолучитьСообщение(Соединение, 3000);
    Иначе
        Результат = Соединение;
        Проверка  = Соединение;
    КонецЕсли;

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ОтправитьТекстовоеСообщение", Постфикс);
    OPI_ПолучениеДанныхТестов.Обработать(Проверка , "WebSocket", "ОтправитьТекстовоеСообщение", "Проверка, " + Постфикс, Сообщение);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        OPI_WebSocket.ЗакрытьСоединение(Соединение);
    КонецЕсли;

КонецПроцедуры

Процедура WebSocket_ОтправитьДвоичноеСообщение(ПараметрыФункции)

    Постфикс   = ПараметрыФункции["Postfix"];
    Соединение = СоздатьКлиентWebSocket(ПараметрыФункции);
    ИсходнаяСтрока = "binary-message-" + Формат(ТекущаяДата(), "ДФ=yyyyMMddhhmmss");
    Данные     = ПолучитьДвоичныеДанныеИзСтроки(ИсходнаяСтрока);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        Результат = OPI_WebSocket.ОтправитьДвоичноеСообщение(Соединение, Данные);
        Проверка  = OPI_WebSocket.ПолучитьСообщение(Соединение, 3000);
    Иначе
        Результат = Соединение;
        Проверка  = Соединение;
    КонецЕсли;

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ОтправитьДвоичноеСообщение", Постфикс);
    OPI_ПолучениеДанныхТестов.Обработать(Проверка , "WebSocket", "ОтправитьДвоичноеСообщение", "Проверка, " + Постфикс, ИсходнаяСтрока);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        OPI_WebSocket.ЗакрытьСоединение(Соединение);
    КонецЕсли;

КонецПроцедуры

Процедура WebSocket_ПолучитьНастройкиTls(ПараметрыФункции)

    Постфикс  = ПараметрыФункции["Postfix"];
    Результат = OPI_WebSocket.ПолучитьНастройкиTls(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ПолучитьНастройкиTls", Постфикс);

КонецПроцедуры

Процедура WebSocket_ЭтоОбъектКлиента(ПараметрыФункции)

    Постфикс   = ПараметрыФункции["Postfix"];
    Соединение = СоздатьКлиентWebSocket(ПараметрыФункции);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        Результат = OPI_WebSocket.ЭтоОбъектКлиента(Соединение);
    Иначе
        Результат = OPI_WebSocket.ЭтоОбъектКлиента("not-a-client");
    КонецЕсли;

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ЭтоОбъектКлиента", Постфикс);

    Результат = OPI_WebSocket.ЭтоОбъектКлиента("not-a-client");
    OPI_ПолучениеДанныхТестов.Обработать(Результат, "WebSocket", "ЭтоОбъектКлиента", "Ложь, " + Постфикс);

    Если OPI_WebSocket.ЭтоОбъектКлиента(Соединение) Тогда
        OPI_WebSocket.ЗакрытьСоединение(Соединение);
    КонецЕсли;

КонецПроцедуры

#КонецОбласти // WebSocket

#КонецОбласти // АтомарныеТесты

#Область ВспомогательныеФункции

Функция СоздатьКлиентWebSocket(ПараметрыФункции)

    Адрес = ПолучитьАдресWebSocket(ПараметрыФункции);

    НастройкиTls    = Неопределено;
    НастройкиПрокси = Неопределено;
    Заголовки       = Новый Структура("X-Trace-Id", "OPI-WS-TEST");

    Если ПараметрыФункции["TLS"] Тогда
        НастройкиTls = OPI_WebSocket.ПолучитьНастройкиTls(Истина);
    КонецЕсли;

    Если ПараметрыФункции["Proxy"] Тогда
        НастройкиПрокси = OPI_Компоненты.ПолучитьНастройкиПрокси(
            ПараметрыФункции["Proxy_IP"],
            ПараметрыФункции["Proxy_Port"],
            ПараметрыФункции["Proxy_Type"],
            ПараметрыФункции["Proxy_User"],
            ПараметрыФункции["Proxy_Password"]);
    КонецЕсли;

    Возврат OPI_WebSocket.ОткрытьСоединение(Адрес, НастройкиTls, НастройкиПрокси, , Заголовки);

КонецФункции

Функция ПолучитьАдресWebSocket(ПараметрыФункции)

    Схема = ?(ПараметрыФункции["TLS"], "wss://", "ws://");
    Хост  = ПараметрыФункции["WS_IP"];
    Порт  = ПараметрыФункции["WS_Port"];

    Возврат СтрШаблон("%1%2:%3", Схема, Хост, Порт);

КонецФункции

#КонецОбласти // ВспомогательныеФункции

#КонецОбласти // СлужебныеПроцедурыИФункции
