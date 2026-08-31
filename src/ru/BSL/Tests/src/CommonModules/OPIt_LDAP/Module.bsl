// OneScript: ./OInt/tests/Modules/OPIt_LDAP.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Набор тестов для YAxUnit

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

#Если Не ВебКлиент Тогда // !OPI

// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("LDAP");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("LDAP");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область LDAP

Процедура LDAP_ОсновныеМетоды() Экспорт

    ПараметрыТеста = OPI_ПолучениеДанныхТестов.ПолучитьТестовыеДанные();
    LDAP_СформироватьПараметрыСоединения(ПараметрыТеста);
    LDAP_ОткрытьСоединение(ПараметрыТеста);
    LDAP_ПолучитьКонфигурациюСоединения(ПараметрыТеста);
    LDAP_ЗакрытьСоединение(ПараметрыТеста);
    LDAP_ЭтоКоннектор(ПараметрыТеста);
    LDAP_ПолучитьНастройкиTls(ПараметрыТеста);
    LDAP_ПолучитьНастройкиЛогирования(ПараметрыТеста);
    LDAP_ПолучитьЛог(ПараметрыТеста);

КонецПроцедуры

Процедура LDAP_РаботаСКаталогом() Экспорт

    ПараметрыТеста = OPI_ПолучениеДанныхТестов.ПолучитьТестовыеДанные();
    LDAP_Найти(ПараметрыТеста);
    LDAP_Добавить(ПараметрыТеста);
    LDAP_Изменить(ПараметрыТеста);
    LDAP_Сравнить(ПараметрыТеста);
    LDAP_Удалить(ПараметрыТеста);

КонецПроцедуры

Процедура LDAP_РасширеннаяПроверка() Экспорт

    OPI_ПолучениеДанныхТестов.УстановитьПризнакТестаCLI(Ложь);

    Если OPI_ПолучениеДанныхТестов.ЭтоТестCLI() Тогда
        Сообщить("CLI SKIP");
        Возврат;
    КонецЕсли;

    ПараметрыТеста = OPI_ПолучениеДанныхТестов.ПолучитьТестовыеДанные();
    LDAP_Расширенная_НайтиБезПодключения(ПараметрыТеста);
    LDAP_Расширенная_ПовторноеПодключение(ПараметрыТеста);
    LDAP_Расширенная_ПолучитьЛогПриПодключении(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // LDAP

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область LDAP

Процедура LDAP_СформироватьПараметрыСоединения(ПараметрыФункции)

    URL    = ПараметрыФункции["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Пароль = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    Результат = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "СформироватьПараметрыСоединения");

КонецПроцедуры

Процедура LDAP_ОткрытьСоединение(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Результат           = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ОткрытьСоединение");

КонецПроцедуры

Процедура LDAP_ЗакрытьСоединение(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение          = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);
    Результат           = OPI_LDAP.ЗакрытьСоединение(Соединение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ЗакрытьСоединение");

КонецПроцедуры

Процедура LDAP_ЭтоКоннектор(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение          = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);
    Результат           = OPI_LDAP.ЭтоКоннектор(Соединение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ЭтоКоннектор");

КонецПроцедуры

Процедура LDAP_ПолучитьКонфигурациюСоединения(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение          = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);
    Результат           = OPI_LDAP.ПолучитьКонфигурациюСоединения(Соединение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ПолучитьКонфигурациюСоединения");

КонецПроцедуры

Процедура LDAP_ПолучитьНастройкиTls(ПараметрыФункции)

    Результат = OPI_LDAP.ПолучитьНастройкиTls(Истина, Ложь, "");

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ПолучитьНастройкиTls");

КонецПроцедуры

Процедура LDAP_ПолучитьНастройкиЛогирования(ПараметрыФункции)

    Результат = OPI_LDAP.ПолучитьНастройкиЛогирования(Истина, 100, ПолучитьИмяВременногоФайла());

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ПолучитьНастройкиЛогирования");

    Результат = OPI_LDAP.ПолучитьНастройкиЛогирования(Ложь, , ПолучитьИмяВременногоФайла());

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ПолучитьНастройкиЛогирования", "Файл");

    Результат = OPI_LDAP.ПолучитьНастройкиЛогирования(Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ПолучитьНастройкиЛогирования", "Память");

КонецПроцедуры

Процедура LDAP_ПолучитьЛог(ПараметрыФункции)

    ФайлЛога             = ПолучитьИмяВременногоФайла("txt");
    НастройкиЛогирования = OPI_LDAP.ПолучитьНастройкиЛогирования(Истина, 100, ФайлЛога);

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение           = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения, , НастройкиЛогирования);

    Если Не OPI_LDAP.ЭтоКоннектор(Соединение) Тогда
        ВызватьИсключение OPI_Инструменты.JSONСтрокой(Соединение);
    КонецЕсли;

    База      = "dc=example,dc=org";
    Результат = OPI_LDAP.Найти(Соединение, База);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Найти", "Select"); // SKIP

    Результат = OPI_LDAP.ПолучитьЛог(Соединение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ПолучитьЛог", , ФайлЛога);

    Результат = OPI_LDAP.ПолучитьЛог(Соединение, Истина);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "ПолучитьЛог", "КакСтрока", ФайлЛога);

КонецПроцедуры

Процедура LDAP_Найти(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение          = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);
    База                = "dc=example,dc=org";
    Фильтр              = "(objectClass=*)";

    Результат = OPI_LDAP.Найти(Соединение, База, Фильтр);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Найти");

    Результат = OPI_LDAP.Найти(ПараметрыСоединения, База, Фильтр);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Найти", "Без соединения");

КонецПроцедуры

Процедура LDAP_Добавить(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение          = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);
    DN                  = "cn=OPI Test User,dc=example,dc=org";

    КлассыОбъекта = Новый Массив;
    КлассыОбъекта.Добавить("top");
    КлассыОбъекта.Добавить("person");
    КлассыОбъекта.Добавить("organizationalPerson");
    КлассыОбъекта.Добавить("inetOrgPerson");

    ИменаCN = Новый Массив;
    ИменаCN.Добавить("OPI Test User");

    Фамилии = Новый Массив;
    Фамилии.Добавить("User");

    Идентификаторы = Новый Массив;
    Идентификаторы.Добавить("opitest");

    Атрибуты = Новый Структура;
    Атрибуты.Вставить("objectClass", КлассыОбъекта);
    Атрибуты.Вставить("cn"         , ИменаCN);
    Атрибуты.Вставить("sn"         , Фамилии);
    Атрибуты.Вставить("uid"        , Идентификаторы);

    Результат = OPI_LDAP.Добавить(Соединение, DN, Атрибуты);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Добавить");

КонецПроцедуры

Процедура LDAP_Изменить(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение          = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);
    DN                  = "cn=OPI Test User,dc=example,dc=org";

    ЗначенияПочты = Новый Массив;
    ЗначенияПочты.Добавить("test@example.org");

    Изменение = Новый Структура;
    Изменение.Вставить("operation", "replace");
    Изменение.Вставить("attribute", "mail");
    Изменение.Вставить("values"   , ЗначенияПочты);

    Изменения = Новый Массив;
    Изменения.Добавить(Изменение);

    Результат = OPI_LDAP.Изменить(Соединение, DN, Изменения);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Изменить");

КонецПроцедуры

Процедура LDAP_Удалить(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение          = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);
    DN                  = "cn=OPI Test User,dc=example,dc=org";

    Результат = OPI_LDAP.Удалить(Соединение, DN);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Удалить");

КонецПроцедуры

Процедура LDAP_Сравнить(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение          = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения);
    DN                  = "cn=OPI Test User,dc=example,dc=org";
    Атрибут             = "mail";
    Значение            = "test@example.org";

    Результат = OPI_LDAP.Сравнить(Соединение, DN, Атрибут, Значение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Сравнить");

КонецПроцедуры

#Область РасширеннаяПроверка

Процедура LDAP_Расширенная_НайтиБезПодключения(ПараметрыФункции)

    Коннектор = OPI_Компоненты.ПолучитьКомпоненту("LDAP");
    Параметры = OPI_Компоненты.СериализоватьJanx(Новый Структура("base,filter", "dc=example,dc=com", "(objectClass=*)"));
    Результат = OPI_Компоненты.ДесериализоватьJanx(Коннектор.Search(Параметры));

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Расширенная_НайтиБезПодключения");

КонецПроцедуры

Процедура LDAP_Расширенная_ПовторноеПодключение(ПараметрыФункции)

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    Коннектор         = OPI_Компоненты.ПолучитьКомпоненту("LDAP");
    ПервоеПодключение = OPI_Компоненты.ДесериализоватьJanx(Коннектор.Connect(URL, BindDN, Пароль, Таймаут));

    Если Не ПервоеПодключение["result"] Тогда
        ВызватьИсключение OPI_Инструменты.JSONСтрокой(ПервоеПодключение);
    КонецЕсли;

    Результат = OPI_Компоненты.ДесериализоватьJanx(Коннектор.Connect(URL, BindDN, Пароль, Таймаут));

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Расширенная_ПовторноеПодключение");

КонецПроцедуры

Процедура LDAP_Расширенная_ПолучитьЛогПриПодключении(ПараметрыФункции)

    ФайлЛога             = ПолучитьИмяВременногоФайла("txt");
    НастройкиЛогирования = OPI_LDAP.ПолучитьНастройкиЛогирования(Истина, 100, ФайлЛога);

    URL     = ПараметрыФункции["LDAP_URL"];
    BindDN  = "cn=admin,dc=example,dc=org";
    Пароль  = ПараметрыФункции["LDAP_Password"];
    Таймаут = 30;

    ПараметрыСоединения = OPI_LDAP.СформироватьПараметрыСоединения(URL, BindDN, Пароль, Таймаут);
    Соединение           = OPI_LDAP.ОткрытьСоединение(ПараметрыСоединения, , НастройкиЛогирования);

    Если Не OPI_LDAP.ЭтоКоннектор(Соединение) Тогда
        ВызватьИсключение OPI_Инструменты.JSONСтрокой(Соединение);
    КонецЕсли;

    OPI_LDAP.Найти(Соединение, "dc=example,dc=org");

    Результат = OPI_LDAP.ПолучитьЛог(Соединение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "LDAP", "Расширенная_ПолучитьЛогПриПодключении", , ФайлЛога);

КонецПроцедуры

#КонецОбласти // РасширеннаяПроверка

#КонецОбласти // LDAP

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли // !OPI
