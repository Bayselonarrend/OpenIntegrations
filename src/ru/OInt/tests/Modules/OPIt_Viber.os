// OneScript: ./OInt/tests/Modules/OPIt_Viber.os

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

#Использовать oint
#Использовать asserts
#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯкс("Viber");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("Viber");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область Viber

Процедура Вайбер_ПолучениеИнформации() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Viber_ChannelToken"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Viber_ChannelAdminID", ПараметрыТеста);

    Возврат;

    //@skip-check unreachable-statements
    // BSLLS:UnreachableCode-off

    Viber_ПолучитьИнформациюОКанале(ПараметрыТеста);
    Viber_ПолучитьДанныеПользователя(ПараметрыТеста);
    Viber_ПолучитьОнлайнПользователей(ПараметрыТеста);
    Viber_УстановитьWebhook(ПараметрыТеста);

    // BSLLS:UnreachableCode-on

КонецПроцедуры

Процедура Вайбер_ОтправкаСообщений() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Viber_ChannelToken"  , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Viber_ChannelAdminID", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Viber_Token"         , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Viber_UserID"        , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"             , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Document"            , ПараметрыТеста);

    Viber_СформироватьКлавиатуруИзМассиваКнопок(ПараметрыТеста);

    Возврат;

    //@skip-check unreachable-statement
    // BSLLS:UnreachableCode-off

    Viber_ОтправитьТекстовоеСообщение(ПараметрыТеста);
    Viber_ОтправитьКартинку(ПараметрыТеста);
    Viber_ОтправитьФайл(ПараметрыТеста);
    Viber_ОтправитьКонтакт(ПараметрыТеста);
    Viber_ОтправитьЛокацию(ПараметрыТеста);
    Viber_ОтправитьСсылку(ПараметрыТеста);

    // BSLLS:UnreachableCode-on

КонецПроцедуры

#КонецОбласти // Viber

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область Viber

Процедура Viber_УстановитьWebhook(ПараметрыФункции)

    Токен = ПараметрыФункции["Viber_ChannelToken"];
    URL   = "http://api.athenaeum.digital/hs/viber";

    Результат = OPI_Viber.УстановитьWebhook(Токен, URL);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "УстановитьWebhook");

КонецПроцедуры

Процедура Viber_ПолучитьИнформациюОКанале(ПараметрыФункции)

    Токен     = ПараметрыФункции["Viber_ChannelToken"];
    Результат = OPI_Viber.ПолучитьИнформациюОКанале(Токен);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ПолучитьИнформациюОКанале");

КонецПроцедуры

Процедура Viber_ПолучитьДанныеПользователя(ПараметрыФункции)

    Токен          = ПараметрыФункции["Viber_ChannelToken"];
    IDПользователя = ПараметрыФункции["Viber_ChannelAdminID"];

    Результат = OPI_Viber.ПолучитьДанныеПользователя(Токен, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ПолучитьДанныеПользователя");

КонецПроцедуры

Процедура Viber_ПолучитьОнлайнПользователей(ПараметрыФункции)

    Токен          = ПараметрыФункции["Viber_ChannelToken"];
    IDПользователя = ПараметрыФункции["Viber_ChannelAdminID"];

    Результат = OPI_Viber.ПолучитьОнлайнПользователей(Токен, IDПользователя);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ПолучитьОнлайнПользователей");

КонецПроцедуры

Процедура Viber_СформироватьКлавиатуруИзМассиваКнопок(ПараметрыФункции)

    МассивКнопок = Новый Массив;
    МассивКнопок.Добавить("Кнопка 1");
    МассивКнопок.Добавить("Кнопка 2");
    МассивКнопок.Добавить("Кнопка 3");

    Результат = OPI_Viber.СформироватьКлавиатуруИзМассиваКнопок(МассивКнопок);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "СформироватьКлавиатуруИзМассиваКнопок");

КонецПроцедуры

Процедура Viber_ОтправитьТекстовоеСообщение(ПараметрыФункции)

    Текст = "Тестовое сообщение";

    IDПользователя = ПараметрыФункции["Viber_UserID"];
    Токен          = ПараметрыФункции["Viber_Token"];
    ОтправкаВКанал = Ложь;

    МассивКнопок = Новый Массив;
    МассивКнопок.Добавить("Кнопка 1");
    МассивКнопок.Добавить("Кнопка 2");
    МассивКнопок.Добавить("Кнопка 3");

    Клавиатура = OPI_Viber.СформироватьКлавиатуруИзМассиваКнопок(МассивКнопок);

    Результат = OPI_Viber.ОтправитьТекстовоеСообщение(Токен, Текст, IDПользователя, ОтправкаВКанал, Клавиатура);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьТекстовоеСообщение"); // SKIP

    IDПользователя = ПараметрыФункции["Viber_ChannelAdminID"];
    Токен          = ПараметрыФункции["Viber_ChannelToken"];
    ОтправкаВКанал = Истина;

    Результат = OPI_Viber.ОтправитьТекстовоеСообщение(Токен, Текст, IDПользователя, ОтправкаВКанал, Клавиатура);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьТекстовоеСообщение", "Канал");

КонецПроцедуры

Процедура Viber_ОтправитьКартинку(ПараметрыФункции)

    Описание = "Тестовое сообщение";
    URL      = ПараметрыФункции["Picture"];

    IDПользователя = ПараметрыФункции["Viber_UserID"];
    Токен          = ПараметрыФункции["Viber_Token"];
    ОтправкаВКанал = Ложь;

    Результат = OPI_Viber.ОтправитьКартинку(Токен, URL, IDПользователя, ОтправкаВКанал, Описание);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьКартинку"); // SKIP

    IDПользователя = ПараметрыФункции["Viber_ChannelAdminID"];
    Токен          = ПараметрыФункции["Viber_ChannelToken"];
    ОтправкаВКанал = Истина;

    Результат = OPI_Viber.ОтправитьКартинку(Токен, URL, IDПользователя, ОтправкаВКанал, Описание);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьКартинку", "Канал");

КонецПроцедуры

Процедура Viber_ОтправитьФайл(ПараметрыФункции)

    Расширение = "docx";
    URL        = ПараметрыФункции["Document"];

    IDПользователя = ПараметрыФункции["Viber_UserID"];
    Токен          = ПараметрыФункции["Viber_Token"];
    ОтправкаВКанал = Ложь;

    Результат = OPI_Viber.ОтправитьФайл(Токен, URL, IDПользователя, ОтправкаВКанал, Расширение);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьФайл"); // SKIP

    IDПользователя = ПараметрыФункции["Viber_ChannelAdminID"];
    Токен          = ПараметрыФункции["Viber_ChannelToken"];
    ОтправкаВКанал = Истина;

    Результат = OPI_Viber.ОтправитьФайл(Токен, URL, IDПользователя, ОтправкаВКанал, Расширение);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьФайл", "Канал");

КонецПроцедуры

Процедура Viber_ОтправитьКонтакт(ПараметрыФункции)

    Имя     = "Петр Петров";
    Телефон = "+123456789";

    IDПользователя = ПараметрыФункции["Viber_UserID"];
    Токен          = ПараметрыФункции["Viber_Token"];
    ОтправкаВКанал = Ложь;

    Результат = OPI_Viber.ОтправитьКонтакт(Токен, Имя, Телефон, IDПользователя, ОтправкаВКанал);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьКонтакт"); // SKIP

    IDПользователя = ПараметрыФункции["Viber_ChannelAdminID"];
    Токен          = ПараметрыФункции["Viber_ChannelToken"];
    ОтправкаВКанал = Истина;

    Результат = OPI_Viber.ОтправитьКонтакт(Токен, Имя, Телефон, IDПользователя, ОтправкаВКанал);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьКонтакт", "Канал");

КонецПроцедуры

Процедура Viber_ОтправитьЛокацию(ПараметрыФункции)

    Широта  = "48.87373649724122";
    Долгота = "2.2954639195323967";

    IDПользователя = ПараметрыФункции["Viber_UserID"];
    Токен          = ПараметрыФункции["Viber_Token"];
    ОтправкаВКанал = Ложь;

    Результат = OPI_Viber.ОтправитьЛокацию(Токен, Широта, Долгота, IDПользователя, ОтправкаВКанал);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьЛокацию"); // SKIP

    IDПользователя = ПараметрыФункции["Viber_ChannelAdminID"];
    Токен          = ПараметрыФункции["Viber_ChannelToken"];
    ОтправкаВКанал = Истина;

    Результат = OPI_Viber.ОтправитьЛокацию(Токен, Широта, Долгота, IDПользователя, ОтправкаВКанал);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьЛокацию", "Канал");

КонецПроцедуры

Процедура Viber_ОтправитьСсылку(ПараметрыФункции)

    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    IDПользователя = ПараметрыФункции["Viber_UserID"];
    Токен          = ПараметрыФункции["Viber_Token"];
    ОтправкаВКанал = Ложь;

    Результат = OPI_Viber.ОтправитьСсылку(Токен, URL, IDПользователя, ОтправкаВКанал);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьСсылку"); // SKIP

    IDПользователя = ПараметрыФункции["Viber_ChannelAdminID"];
    Токен          = ПараметрыФункции["Viber_ChannelToken"];
    ОтправкаВКанал = Истина;

    Результат = OPI_Viber.ОтправитьСсылку(Токен, URL, IDПользователя, ОтправкаВКанал);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Viber", "ОтправитьСсылку", "Канал");

КонецПроцедуры

#КонецОбласти // Viber

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure Viber_DataRetrieval() Export
    Вайбер_ПолучениеИнформации();
EndProcedure

Procedure Viber_MessagesSending() Export
    Вайбер_ОтправкаСообщений();
EndProcedure

#EndRegion