// OneScript: ./OInt/tools/Modules/OPI_Компоненты.os

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingHardcodePath-off
// BSLLS:Typo-off
// BSLLS:DeprecatedMessage-off
// BSLLS:UsingServiceTag-off
// BSLLS:ExecuteExternalCodeInCommonModule-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:MagicNumber-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

// Раскомментировать, если выполняется OneScript
#Использовать "./internal"

#Область СлужебныйПрограммныйИнтерфейс

Функция ПолучитьКомпоненту(Знач ИмяКомпоненты, Знач Класс = "Main") Экспорт

    Компонента    = Неопределено;
    Ошибка        = "";
    ИмяКомпоненты = "OPI_" + ИмяКомпоненты;

    Если Не ИнициализироватьВнешнююКомпоненту(ИмяКомпоненты, Класс, Компонента) Тогда

        Ошибка     = Неопределено;
        Компонента = ПодключитьКомпонентуНаСервере(ИмяКомпоненты, Класс, Ошибка);

        Если ЗначениеЗаполнено(Ошибка) Тогда
            СформироватьИсключениеКомпоненты(Ошибка);
        КонецЕсли;

    КонецЕсли;

    Возврат Компонента;

КонецФункции

Функция ЭтоКомпонента(Знач Значение) Экспорт

    ТипЗначения = Строка(ТипЗнч(Значение));
    Возврат СтрНачинаетсяС(ТипЗначения, "AddIn.");

КонецФункции

Функция УстановитьTls(Знач Компонета, Знач Tls) Экспорт

    Результат = Новый Структура("result", Истина);

    Если ЗначениеЗаполнено(Tls) Тогда

        СообщениеОшибки = "Переданы некорректные настройки Tls!";
        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Tls, СообщениеОшибки);

        ИспользоватьTls    = OPI_Инструменты.ПолучитьИли(Tls, "use_tls"             , Ложь);
        ОтключитьВалидацию = OPI_Инструменты.ПолучитьИли(Tls, "accept_invalid_certs", Ложь);
        ПутьКСертификату   = OPI_Инструменты.ПолучитьИли(Tls, "ca_cert_path"        , "");

        OPI_ПреобразованиеТипов.ПолучитьБулево(ИспользоватьTls);
        OPI_ПреобразованиеТипов.ПолучитьБулево(ОтключитьВалидацию);
        OPI_ПреобразованиеТипов.ПолучитьСтроку(ПутьКСертификату);

        Результат = Компонета.SetTLS(ИспользоватьTls, ОтключитьВалидацию, ПутьКСертификату);
        Результат = OPI_Инструменты.JsonВСтруктуру(Результат);

    КонецЕсли;

    Возврат Результат;

КонецФункции

Функция ПолучитьНастройкиTls(Знач ОтключитьПроверкуСертификатов, Знач ПутьКСертификату = "") Экспорт

    СтруктураСертификата = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("use_tls"             , Истина                       , "Булево", СтруктураСертификата);
    OPI_Инструменты.ДобавитьПоле("accept_invalid_certs", ОтключитьПроверкуСертификатов, "Булево", СтруктураСертификата);
    OPI_Инструменты.ДобавитьПоле("ca_cert_path"        , ПутьКСертификату             , "Строка", СтруктураСертификата);

    Возврат СтруктураСертификата;

КонецФункции

Функция ПолучитьНастройкиПрокси(Знач Адрес
    , Знач Порт
    , Знач Вид    = "socks5"
    , Знач Логин  = Неопределено
    , Знач Пароль = Неопределено) Экспорт

    СтруктураНастроек = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("server"    , Адрес, "Строка", СтруктураНастроек);
    OPI_Инструменты.ДобавитьПоле("port"      , Порт , "Число" , СтруктураНастроек);
    OPI_Инструменты.ДобавитьПоле("proxy_type", Вид  , "Строка", СтруктураНастроек);

    Если Не Логин = Неопределено Тогда
        OPI_ПреобразованиеТипов.ПолучитьСтроку(Логин);
        СтруктураНастроек.Вставить("login", Логин);
    КонецЕсли;

    Если Не Пароль = Неопределено Тогда
        OPI_ПреобразованиеТипов.ПолучитьСтроку(Пароль);
        СтруктураНастроек.Вставить("password", Пароль);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураНастроек;

КонецФункции

Функция ТребуетсяПередачаЧерезФайл() Экспорт

    // BSLLS:CommentedCode-off

    // Компоненты в 1С на Linux не могут стабильно отдавать и принимать данные свыше 30 КБ
    // https://github.com/Bayselonarrend/OpenIntegrations/issues/72

    // UPD: В неизолированном режиме не падает

    // Возврат Не OPI_Инструменты.ЭтоWindows() И Не OPI_Инструменты.ЭтоOneScript();

    // BSLLS:CommentedCode-on

    Возврат Ложь;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ИнициализироватьВнешнююКомпоненту(Знач ИмяКомпоненты, Знач Класс, Компонента)

    Попытка
        Компонента = Новый("AddIn." + ИмяКомпоненты + "." + Класс);
        Возврат Истина;
    Исключение
        Возврат Ложь;
    КонецПопытки;

КонецФункции

Функция ПодключитьКомпонентуНаСервере(Знач ИмяКомпоненты, Знач Класс, Ошибка)

    Если OPI_Инструменты.ЭтоOneScript() Тогда
        ИмяМакета = КаталогКомпонентOS() + ИмяКомпоненты + ".zip";
    Иначе
        ИмяМакета = "ОбщийМакет." + ИмяКомпоненты;
    КонецЕсли;

    Попытка
        ПодключитьКомпонентуНеИзолированно(ИмяМакета, ИмяКомпоненты);
        Компонента = Новый("AddIn." + ИмяКомпоненты + "." + Класс);
        Ошибка     = Неопределено;
        Возврат Компонента;
    Исключение
        Ошибка     = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
        Возврат Неопределено;
    КонецПопытки;

КонецФункции

Функция ПодключитьКомпонентуНеИзолированно(ИмяМакета, ИмяКомпоненты)

    ЭтоOneScript          = OPI_Инструменты.ЭтоOneScript();
    НеобходимТипПоСистеме = Не ЭтоOneScript И Не OPI_Инструменты.ЭтоWindows();

    Если ЭтоOneScript Тогда

        НеобходимТипПоВерсии = Ложь;

    Иначе

        СистемнаяИнформация = Новый СистемнаяИнформация();

        Версия1С = СистемнаяИнформация.ВерсияПриложения;
        Версия1С = СтрРазделить(Версия1С, ".");

        Часть1 = Число(Версия1С[0]);
        Часть2 = Число(Версия1С[1]);
        Часть3 = Число(Версия1С[2]);

        НеобходимТипПоВерсии = Часть1 > 8 Или Часть2 > 3 Или Часть3 > 20;

    КонецЕсли;

    НеобходимТип = НеобходимТипПоВерсии И НеобходимТипПоСистеме;

    Если Не НеобходимТип Тогда

        Если Не НеобходимТипПоВерсии Тогда
            ТипПодключенияВнешнейКомпоненты = Неопределено;
        КонецЕсли;

        Результат = ПодключитьВнешнююКомпоненту(ИмяМакета, ИмяКомпоненты, ТипВнешнейКомпоненты.Native);

    Иначе

        // BSLLS:UnusedLocalVariable-off

        //@skip-check module-unused-local-variable
        ТипПодключения = ТипПодключенияВнешнейКомпоненты.НеИзолированно;
        //@skip-check server-execution-safe-mode

        // BSLLS:UnusedLocalVariable-on

        // BSLLS:LineLength-off
        Результат = Вычислить("ПодключитьВнешнююКомпоненту(ИмяМакета, ИмяКомпоненты, ТипВнешнейКомпоненты.Native, ТипПодключения)");
        // BSLLS:LineLength-on

    КонецЕсли;

    Возврат Результат;

КонецФункции

Функция КаталогКомпонентOS() Экспорт

    КаталогПрограммы = СтрЗаменить(КаталогПрограммы(), "\", "/");

    ЭлементыПути = СтрРазделить(КаталогПрограммы, "/");
    ЭлементыПути.Удалить(ЭлементыПути.ВГраница());

    // BSLLS:UsingHardcodePath-off

    КаталогКомпонент = СтрСоединить(ЭлементыПути, "/") + "/lib/oint/addins/";

    // BSLLS:UsingHardcodePath-on

    Возврат КаталогКомпонент;

КонецФункции

Процедура СформироватьИсключениеКомпоненты(Знач Ошибка)

    Текст = "Не удалось инициализировать внешнюю компоненту. Возможно, она несовместима с вашей операционной системой.";

    Если Не OPI_Инструменты.ЭтоWindows() Тогда

        Текст = Текст
            + Символы.ПС
            + Символы.ПС
            + "Важно: Для работы компоненты требуется GLIBC >=2.18"
            + " и OpenSSL версии 3.x"
            + Символы.ПС
            + "Проверьте, что данные зависимости удоволетворены в вашей системе!";

    КонецЕсли;

    Текст = Текст
        + Символы.ПС
        + Символы.ПС
        + "Подробнее: https://openintegrations.dev/docs/Start/Component-requirements"
        + Символы.ПС
        + Символы.ПС
        + "Системная информация:"
        + Ошибка;

    ВызватьИсключение Текст;

КонецПроцедуры

#КонецОбласти

#Region Alternate

Function GetAddIn(Val AddInName, Val Class = "Main") Export
	Return ПолучитьКомпоненту(AddInName, Class);
EndFunction

Function IsAddIn(Val Value) Export
	Return ЭтоКомпонента(Value);
EndFunction

Function SetTls(Val AddIn, Val Tls) Export
	Return УстановитьTls(AddIn, Tls);
EndFunction

Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export
	Return ПолучитьНастройкиTls(DisableCertVerification, CertFilepath);
EndFunction

Function GetProxySettings(Val Address, Val Port, Val View = "socks5", Val Login = Undefined, Val Password = Undefined) Export
	Return ПолучитьНастройкиПрокси(Address, Port, View, Login, Password);
EndFunction

Function FileTransferRequired() Export
	Return ТребуетсяПередачаЧерезФайл();
EndFunction

Function AddInsFolderOS() Export
	Return КаталогКомпонентOS();
EndFunction

#EndRegion