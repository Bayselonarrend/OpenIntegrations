// OneScript: ./OInt/tests/Modules/OPIt_Notion.os

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

#Если Не ВебКлиент Тогда

// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_СписокТестовКлиентСервер.СформироватьТестыЯкс("Notion");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("Notion");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область Notion

Процедура НоушнАпи_СоздатьСтраницу() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_Token" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_Parent", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"      , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture2"     , ПараметрыТеста);

    Notion_СоздатьСтраницу(ПараметрыТеста);
    Notion_ПолучитьСтраницу(ПараметрыТеста);
    Notion_ИзменитьСвойстваСтраницы(ПараметрыТеста);

КонецПроцедуры

Процедура НоушнАпи_СоздатьИзменитьБазу() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_Token" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_Parent", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Picture"      , ПараметрыТеста);

    Notion_СоздатьБазуДанных(ПараметрыТеста);
    Notion_ИзменитьСвойстваБазы(ПараметрыТеста);
    Notion_ПолучитьБазуДанных(ПараметрыТеста);
    Notion_СоздатьСтраницуВБазу(ПараметрыТеста);

КонецПроцедуры

Процедура НоушнАпи_СоздатьУдалитьБлок() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_Token" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_Parent", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_Block" , ПараметрыТеста);

    Notion_ВернутьБлок(ПараметрыТеста);
    Notion_СоздатьБлок(ПараметрыТеста);
    Notion_ВернутьДочерниеБлоки(ПараметрыТеста);
    Notion_УдалитьБлок(ПараметрыТеста);

КонецПроцедуры

Процедура НоушнАпи_ПолучитьПользователей() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_Token", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Notion_User" , ПараметрыТеста);

    Notion_СписокПользователей(ПараметрыТеста);
    Notion_ПолучитьДанныеПользователя(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // Notion

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область Notion

Процедура Notion_СоздатьСтраницу(ПараметрыФункции)

    Токен     = ПараметрыФункции["Notion_Token"];
    Родитель  = ПараметрыФункции["Notion_Parent"];
    Заголовок = "Тестовый заголовок";

    Результат = OPI_Notion.СоздатьСтраницу(Токен, Родитель, Заголовок);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "СоздатьСтраницу", , ПараметрыФункции);

КонецПроцедуры

Процедура Notion_СоздатьБазуДанных(ПараметрыФункции)

    Токен     = ПараметрыФункции["Notion_Token"];
    Родитель  = ПараметрыФункции["Notion_Parent"];
    Заголовок = "Тестовый заголовок";

    Свойства = Новый Соответствие;
    Свойства.Вставить("Имя"          , "title");
    Свойства.Вставить("Описание"     , "rich_text");
    Свойства.Вставить("Номер"        , "number");
    Свойства.Вставить("Дата создания", "date");
    Свойства.Вставить("Картинка"     , "files");
    Свойства.Вставить("Активен"      , "checkbox");
    Свойства.Вставить("Сайт"         , "url");
    Свойства.Вставить("Почта"        , "email");
    Свойства.Вставить("Телефон"      , "phone_number");
    Свойства.Вставить("Пользователь" , "people");

    ВыборЗначения = Новый Соответствие;
    ВыборЗначения.Вставить("Новый"    , "green");
    ВыборЗначения.Вставить("В работе" , "yellow");
    ВыборЗначения.Вставить("Удаленный", "red");

    Свойства.Вставить("Статус", ВыборЗначения);

    Результат = OPI_Notion.СоздатьБазуДанных(Токен, Родитель, Заголовок, Свойства);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "СоздатьБазуДанных", , ПараметрыФункции);

КонецПроцедуры

Процедура Notion_ИзменитьСвойстваБазы(ПараметрыФункции)

    Токен = ПараметрыФункции["Notion_Token"];
    База  = ПараметрыФункции["Notion_Base"];

    Заголовок = "Тестовый заголовок";
    Описание  = "Тестовое описание";

    Свойства = Новый Соответствие;
    Свойства.Вставить("Почта", "rich_text"); // Тип поля "Почта" будет изменен с email на текст
    Свойства.Вставить("Сайт");               // Поле "Сайт" будет удалено

    Результат = OPI_Notion.ИзменитьСвойстваБазы(Токен, База, Свойства, Заголовок, Описание);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "ИзменитьСвойстваБазы");

КонецПроцедуры

Процедура Notion_ПолучитьСтраницу(ПараметрыФункции)

    Токен    = ПараметрыФункции["Notion_Token"];
    Страница = ПараметрыФункции["Notion_Page"];

    Результат = OPI_Notion.ПолучитьСтраницу(Токен, Страница);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "ПолучитьСтраницу");

КонецПроцедуры

Процедура Notion_ПолучитьБазуДанных(ПараметрыФункции)

    Токен = ПараметрыФункции["Notion_Token"];
    База  = ПараметрыФункции["Notion_Base"];

    Результат = OPI_Notion.ПолучитьБазуДанных(Токен, База);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "ПолучитьБазуДанных");

КонецПроцедуры

Процедура Notion_СоздатьСтраницуВБазу(ПараметрыФункции)

    Токен     = ПараметрыФункции["Notion_Token"];
    База      = ПараметрыФункции["Notion_Base"];
    Картинка_ = ПараметрыФункции["Picture"]; // URL, Двоичные данные или Путь к файлу

    Картинка = Новый Соответствие;
    Картинка.Вставить("Лого", Картинка_);

    Свойства = Новый Соответствие;
    Свойства.Вставить("Имя"          , "ООО Вектор");
    Свойства.Вставить("Описание"     , "Наш первый клиент");
    Свойства.Вставить("Номер"        , 1);
    Свойства.Вставить("Дата создания", OPI_Инструменты.ПолучитьТекущуюДату());
    Свойства.Вставить("Картинка"     , Картинка);
    Свойства.Вставить("Активен"      , Истина);
    Свойства.Вставить("Сайт"         , "https://vector.ru");
    Свойства.Вставить("Почта"        , "mail@vector.ru");
    Свойства.Вставить("Телефон"      , "88005553535");
    Свойства.Вставить("Статус"       , "Новый");

    Результат = OPI_Notion.СоздатьСтраницуВБазу(Токен, База, Свойства);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "СоздатьСтраницуВБазу", , База);

КонецПроцедуры

Процедура Notion_ИзменитьСвойстваСтраницы(ПараметрыФункции)

    Токен        = ПараметрыФункции["Notion_Token"];
    Страница     = ПараметрыФункции["Notion_Page"];
    Иконка       = ПараметрыФункции["Picture"];
    Обложка      = ПараметрыФункции["Picture2"];
    Архивировать = Ложь;

    Свойства = Новый Соответствие;
    Свойства.Вставить("Активен", Ложь);
    Свойства.Вставить("Почта"  , "vector@mail.ru");

    Результат = OPI_Notion.ИзменитьСвойстваСтраницы(Токен, Страница, Свойства, Иконка, Обложка, Архивировать);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "ИзменитьСвойстваСтраницы");

КонецПроцедуры

Процедура Notion_ВернутьБлок(ПараметрыФункции)

    Токен = ПараметрыФункции["Notion_Token"];
    Блок  = ПараметрыФункции["Notion_Block"];

    Результат = OPI_Notion.ВернутьБлок(Токен, Блок);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "ВернутьБлок");

КонецПроцедуры

Процедура Notion_СоздатьБлок(ПараметрыФункции)

    Токен    = ПараметрыФункции["Notion_Token"];
    Родитель = ПараметрыФункции["Notion_Parent"];
    Блок     = ПараметрыФункции["Notion_Block"];

    ДанныеБлока = OPI_Notion.ВернутьБлок(Токен, Блок);
    Результат   = OPI_Notion.СоздатьБлок(Токен, Родитель, ДанныеБлока);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "СоздатьБлок", , ПараметрыФункции);

КонецПроцедуры

Процедура Notion_ВернутьДочерниеБлоки(ПараметрыФункции)

    Токен = ПараметрыФункции["Notion_Token"];
    Блок  = ПараметрыФункции["Notion_NewBlock"];

    Результат = OPI_Notion.ВернутьДочерниеБлоки(Токен, Блок);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "ВернутьДочерниеБлоки");

КонецПроцедуры

Процедура Notion_УдалитьБлок(ПараметрыФункции)

    Токен = ПараметрыФункции["Notion_Token"];
    Блок  = ПараметрыФункции["Notion_NewBlock"];

    Результат = OPI_Notion.УдалитьБлок(Токен, Блок);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "УдалитьБлок");

КонецПроцедуры

Процедура Notion_СписокПользователей(ПараметрыФункции)

    Токен = ПараметрыФункции["Notion_Token"];

    Результат = OPI_Notion.СписокПользователей(Токен);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "СписокПользователей");

КонецПроцедуры

Процедура Notion_ПолучитьДанныеПользователя(ПараметрыФункции)

    Токен        = ПараметрыФункции["Notion_Token"];
    Пользователь = ПараметрыФункции["Notion_User"];

    Результат = OPI_Notion.ПолучитьДанныеПользователя(Токен, Пользователь);

    // END

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Notion", "ПолучитьДанныеПользователя");

КонецПроцедуры

#КонецОбласти // Notion

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции

#КонецЕсли
