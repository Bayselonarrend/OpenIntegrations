// OneScript: ./OInt/tests/Modules/OPItc_YandexMetrika.os

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

//#Использовать "../../tools/main"
//#Использовать "../../tools/http"
//#Использовать "../../api"
//#Использовать asserts
//#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯксCLI("YandexMetrika");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертсCLI("YandexMetrika");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область YandexMetrika

Процедура ЯМетрика_УправлениеМетками() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Metrika_Token", ПараметрыТеста);

    YandexMetrika_СоздатьМетку(ПараметрыТеста);
    YandexMetrika_ПолучитьСписокМеток(ПараметрыТеста);
    YandexMetrika_ИзменитьМетку(ПараметрыТеста);
    YandexMetrika_ПолучитьМетку(ПараметрыТеста);
    YandexMetrika_УдалитьМетку(ПараметрыТеста);

КонецПроцедуры

Процедура ЯМетрика_УправлениеСчетчиками() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Metrika_Token", ПараметрыТеста);

    YandexMetrika_ПолучитьСтруктуруСчетчика(ПараметрыТеста);
    YandexMetrika_СоздатьСчетчик(ПараметрыТеста);
    YandexMetrika_ПолучитьСчетчик(ПараметрыТеста);
    YandexMetrika_ИзменитьСчетчик(ПараметрыТеста);
    YandexMetrika_УдалитьСчетчик(ПараметрыТеста);
    YandexMetrika_ВосстановитьСчетчик(ПараметрыТеста);
    YandexMetrika_ПолучитьСписокСчетчиков(ПараметрыТеста);
    YandexMetrika_УдалитьСчетчик(ПараметрыТеста);

КонецПроцедуры

Процедура ЯМетрика_УправлениеОперациями() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Metrika_Token", ПараметрыТеста);

    YandexMetrika_СоздатьСчетчик(ПараметрыТеста);
    YandexMetrika_ПолучитьСписокОпераций(ПараметрыТеста);
    YandexMetrika_УдалитьСчетчик(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // YandexMetrika

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область YandexMetrika

Процедура YandexMetrika_ПолучитьСписокМеток(ПараметрыФункции)

    Токен = ПараметрыФункции["Metrika_Token"];

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ПолучитьСписокМеток", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ПолучитьСписокМеток");

КонецПроцедуры

Процедура YandexMetrika_СоздатьМетку(ПараметрыФункции)

    Токен        = ПараметрыФункции["Metrika_Token"];
    Наименование = "Новая метка";

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("title", Наименование);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "СоздатьМетку", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "СоздатьМетку", , ПараметрыФункции, Наименование);

КонецПроцедуры

Процедура YandexMetrika_УдалитьМетку(ПараметрыФункции)

    Токен   = ПараметрыФункции["Metrika_Token"];
    IDМетки = ПараметрыФункции["Metrika_LabelID"];

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("label", IDМетки);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "УдалитьМетку", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "УдалитьМетку");

КонецПроцедуры

Процедура YandexMetrika_ИзменитьМетку(ПараметрыФункции)

    Токен        = ПараметрыФункции["Metrika_Token"];
    IDМетки      = ПараметрыФункции["Metrika_LabelID"];
    Наименование = "Новое имя метки";

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("label", IDМетки);
    Опции.Вставить("title", Наименование);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ИзменитьМетку", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ИзменитьМетку", , Наименование);

КонецПроцедуры

Процедура YandexMetrika_ПолучитьМетку(ПараметрыФункции)

    Токен   = ПараметрыФункции["Metrika_Token"];
    IDМетки = ПараметрыФункции["Metrika_LabelID"];

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("label", IDМетки);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ПолучитьМетку", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ПолучитьМетку");

КонецПроцедуры

Процедура YandexMetrika_ПолучитьСтруктуруСчетчика(ПараметрыФункции)

    Пустая    = Ложь;
    Опции = Новый Структура;
    Опции.Вставить("empty", Пустая);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ПолучитьСтруктуруСчетчика", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ПолучитьСтруктуруСчетчика");

КонецПроцедуры

Процедура YandexMetrika_СоздатьСчетчик(ПараметрыФункции)

    Токен = ПараметрыФункции["Metrika_Token"];

    СтруктураСчетчика = Новый Структура;
    СтруктураСчетчика.Вставить("autogoals_enabled", Истина);

    СтруктураНастроекКода = Новый Структура;
    СтруктураНастроекКода.Вставить("async"          , 0);
    СтруктураНастроекКода.Вставить("clickmap"       , 1);
    СтруктураНастроекКода.Вставить("ecommerce"      , 1);
    СтруктураНастроекКода.Вставить("in_one_line"    , 0);
    СтруктураНастроекКода.Вставить("track_hash"     , 1);
    СтруктураНастроекКода.Вставить("visor"          , 1);
    СтруктураНастроекКода.Вставить("xml_site"       , 0);
    СтруктураНастроекКода.Вставить("ytm"            , 0);
    СтруктураНастроекКода.Вставить("alternative_cdn", 1);

    СтруктураИнформера = Новый Структура;
    СтруктураИнформера.Вставить("color_arrow", 1);
    СтруктураИнформера.Вставить("color_end"  , "EFEFEFFE");
    СтруктураИнформера.Вставить("color_start", "EEEEEEEE");
    СтруктураИнформера.Вставить("color_text" , 0);
    СтруктураИнформера.Вставить("enabled"    , 1);
    СтруктураИнформера.Вставить("indicator"  , "uniques");
    СтруктураИнформера.Вставить("size"       , 2);
    СтруктураИнформера.Вставить("type"       , "ext");

    СтруктураНастроекКода.Вставить("informer", СтруктураИнформера);

    СтруктураСчетчика.Вставить("code_options", СтруктураНастроекКода);

    СтруктураФлагов = Новый Структура;
    СтруктураФлагов.Вставить("collect_first_party_data"             , Истина);
    СтруктураФлагов.Вставить("measurement_enabled"                  , Истина);
    СтруктураФлагов.Вставить("use_in_benchmarks"                    , Истина);
    СтруктураФлагов.Вставить("direct_allow_use_goals_without_access", Истина);

    СтруктураСчетчика.Вставить("counter_flags"          , СтруктураФлагов);
    СтруктураСчетчика.Вставить("favorite"               , 1);
    СтруктураСчетчика.Вставить("filter_robots"          , 2);
    СтруктураСчетчика.Вставить("gdpr_agreement_accepted", 1);

    СтруктураДомена = Новый Структура("site", "openintegrations.dev");

    СтруктураСчетчика.Вставить("site2", СтруктураДомена);

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("fields", СтруктураСчетчика);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "СоздатьСчетчик", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "СоздатьСчетчик", , ПараметрыФункции);

КонецПроцедуры

Процедура YandexMetrika_УдалитьСчетчик(ПараметрыФункции)

    Токен      = ПараметрыФункции["Metrika_Token"];
    IDСчетчика = ПараметрыФункции["Metrika_CounterID"];

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("counter", IDСчетчика);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "УдалитьСчетчик", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "УдалитьСчетчик");

КонецПроцедуры

Процедура YandexMetrika_ИзменитьСчетчик(ПараметрыФункции)

    Токен      = ПараметрыФункции["Metrika_Token"];
    IDСчетчика = ПараметрыФункции["Metrika_CounterID"];

    СтруктураСчетчика = Новый Структура;
    СтруктураСчетчика.Вставить("autogoals_enabled", Истина);

    СтруктураФлагов = Новый Структура;
    СтруктураФлагов.Вставить("collect_first_party_data"             , Ложь);
    СтруктураФлагов.Вставить("measurement_enabled"                  , Ложь);
    СтруктураФлагов.Вставить("use_in_benchmarks"                    , Ложь);
    СтруктураФлагов.Вставить("direct_allow_use_goals_without_access", Ложь);

    СтруктураСчетчика.Вставить("counter_flags", СтруктураФлагов);
    СтруктураСчетчика.Вставить("favorite"     , 0);
    СтруктураСчетчика.Вставить("filter_robots", 1);

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("counter", IDСчетчика);
    Опции.Вставить("fields", СтруктураСчетчика);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ИзменитьСчетчик", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ИзменитьСчетчик");

КонецПроцедуры

Процедура YandexMetrika_ПолучитьСчетчик(ПараметрыФункции)

    Токен      = ПараметрыФункции["Metrika_Token"];
    IDСчетчика = ПараметрыФункции["Metrika_CounterID"];

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("counter", IDСчетчика);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ПолучитьСчетчик", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ПолучитьСчетчик");

КонецПроцедуры

Процедура YandexMetrika_ВосстановитьСчетчик(ПараметрыФункции)

    Токен      = ПараметрыФункции["Metrika_Token"];
    IDСчетчика = ПараметрыФункции["Metrika_CounterID"];

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("counter", IDСчетчика);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ВосстановитьСчетчик", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ВосстановитьСчетчик");

КонецПроцедуры

Процедура YandexMetrika_ПолучитьСписокСчетчиков(ПараметрыФункции)

    Токен      = ПараметрыФункции["Metrika_Token"];
    IDСчетчика = ПараметрыФункции["Metrika_CounterID"];

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ПолучитьСписокСчетчиков", Опции);

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ПолучитьСписокСчетчиков"); // SKIP

    // Фильтр по списку ID

    Фильтр = Новый Структура;

    МассивСчетчиков = Новый Массив;
    МассивСчетчиков.Добавить(IDСчетчика);

    Фильтр.Вставить("counter_ids", МассивСчетчиков);

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("filter", Фильтр);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ПолучитьСписокСчетчиков", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ПолучитьСписокСчетчиков", "Фильтр");

КонецПроцедуры

Процедура YandexMetrika_ПолучитьСписокОпераций(ПараметрыФункции)

    Токен      = ПараметрыФункции["Metrika_Token"];
    IDСчетчика = ПараметрыФункции["Metrika_CounterID"];

    Опции = Новый Структура;
    Опции.Вставить("token", Токен);
    Опции.Вставить("counter", IDСчетчика);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("metrika", "ПолучитьСписокОпераций", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "YandexMetrika", "ПолучитьСписокОпераций");

КонецПроцедуры

#КонецОбласти // YandexMetrika

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure YaMetrika_TagsManagement() Export
    ЯМетрика_УправлениеМетками();
EndProcedure

Procedure YaMetrika_CountersManagement() Export
    ЯМетрика_УправлениеСчетчиками();
EndProcedure

Procedure YaMetrika_ActionsManagement() Export
    ЯМетрика_УправлениеОперациями();
EndProcedure

#EndRegion
