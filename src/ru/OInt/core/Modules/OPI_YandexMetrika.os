﻿// OneScript: ./OInt/core/Modules/OPI_YandexMetrika.os
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

#Область УправлениеСчетчиками

Функция СоздатьСчетчик(Знач Токен, Знач СтруктураСчетчика) Экспорт
    
КонецФункции

// Получить структуру счетчика
// Получает структуру стандартных полей для создания счетчика
//
// Примечание:
// Описание в документации API: [Создание счетчика](@yandex.ru/dev/metrika/ru/management/openapi/counter/addCounter)
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей счетчика
Функция ПолучитьСтруктуруСчетчика(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураСчетчика = Новый Структура;
    СтруктураСчетчика.Вставить("autogoals_enabled", "<включение автоматических целей>");
    
        СтруктураНастроекКода = Новый Структура;
        СтруктураНастроекКода.Вставить("async"          , "<асинхронный код счетчика>");
        СтруктураНастроекКода.Вставить("clickmap"       , "<сбор статистики для работы Карты кликов>");
        СтруктураНастроекКода.Вставить("ecommerce"      , "<сбор данных по электронной коммерции>");
        СтруктураНастроекКода.Вставить("in_one_line"    , "<выводить код счетчика в одну строку>");
        СтруктураНастроекКода.Вставить("track_hash"     , "<отслеживание хеша в адресной строке браузера>");
        СтруктураНастроекКода.Вставить("visor"          , "<запись и анализ поведения посетителей сайта>");
        СтруктураНастроекКода.Вставить("xml_site"       , "<для XML-сайтов>");
        СтруктураНастроекКода.Вставить("ytm"            , "<использование системы управления тегами>");
        СтруктураНастроекКода.Вставить("alternative_cdn"
            , "<учитывать посещения из регионов без доступ к ресурсам Яндекса>");
        
            СтруктураИнформера = Новый Структура;
            СтруктураИнформера.Вставить("color_arrow", "<цвет стрелки на информере>");
            СтруктураИнформера.Вставить("color_end"  , "<конечный (нижний) цвет информера в формате RRGGBBAA>");
            СтруктураИнформера.Вставить("color_start", "<начальный (верхний) цвет информера в формате RRGGBBAA>");
            СтруктураИнформера.Вставить("color_text" , "<цвет текста на информере>");
            СтруктураИнформера.Вставить("enabled"    , "<разрешение отображения информера>");
            СтруктураИнформера.Вставить("indicator"  , "<показатель информера>");
            СтруктураИнформера.Вставить("size"       , "<размер информера>");
            СтруктураИнформера.Вставить("type"       , "<тип информера>");
            
        СтруктураНастроекКода.Вставить("informer", СтруктураИнформера);
        
    СтруктураСчетчика.Вставить("code_options", СтруктураНастроекКода);
    
        СтруктураФлагов = Новый Структура;
        СтруктураФлагов.Вставить("collect_first_party_data"             , "<использовать доп. настройки отслеживания>");
        СтруктураФлагов.Вставить("measurement_enabled"                  , "<включить опцию Measurement Protocol>");
        СтруктураФлагов.Вставить("use_in_benchmarks"                    , "<получать доступ к отчетам по рынку>");
        СтруктураФлагов.Вставить("direct_allow_use_goals_without_access"
            , "<разрешить в рекламных кампаниях оптимизацию по целям без доступа к счетчику>");
        
    СтруктураСчетчика.Вставить("counter_flags", СтруктураФлагов);
    СтруктураСчетчика.Вставить("favorite"     , "<избранное>");
    СтруктураСчетчика.Вставить("filter_robots", "<фильтрация роботов>");
    
        МассивФильтров = Новый Массив;
        
            СтруктураФильтра = Новый Структура;
            СтруктураФильтра.Вставить("action"         , "<тип фильтра>");
            СтруктураФильтра.Вставить("attr"           , "<тип данных, к которым применяется фильтр>");
            СтруктураФильтра.Вставить("status"         , "<статус фильтра>");
            СтруктураФильтра.Вставить("type"           , "<отношение или действие для фильтра>");
            СтруктураФильтра.Вставить("end_ip"         , "<последний IP-адрес диапазона>");
            СтруктураФильтра.Вставить("id"             , "<идентификатор фильтра для изменения>");
            СтруктураФильтра.Вставить("start_ip"       , "<первый IP-адрес диапазона>");
            СтруктураФильтра.Вставить("value"          , "<значение>");
            СтруктураФильтра.Вставить("with_subdomains", "<фильтровать по поддоменам>");
            
        МассивФильтров.Добавить(СтруктураФильтра);
            
    СтруктураСчетчика.Вставить("filters"                , МассивФильтров);
    СтруктураСчетчика.Вставить("gdpr_agreement_accepted", "<согласие с Договором об обработке данных>");
    
        МассивЦелей = Новый Массив;
        
            СтруктураЦели = Новый Структура;
            СтруктураЦели.Вставить("name"         , "<наименование цели>");
            СтруктураЦели.Вставить("type"         , "<тип цели>");
            СтруктураЦели.Вставить("default_price", "<цена цели по умолчанию>");
            СтруктураЦели.Вставить("id"           , "<id цели для изменения>");
            СтруктураЦели.Вставить("is_favorite"  , "<избранное>");
            
        МассивЦелей.Добавить(СтруктураЦели);
            
    СтруктураСчетчика.Вставить("goals", МассивЦелей);
    
        МассивПрав = Новый Массив;
       
            СтруктураПрав = Новый Структура;
            СтруктураПрав.Вставить("perm"               , "<уровень доступа>");
            СтруктураПрав.Вставить("comment"            , "<произвольный комментарий>");
            СтруктураПрав.Вставить("partner_data_access", "<доступ к группе отчетов Монетизация>");
            СтруктураПрав.Вставить("user_login"         , "<логин пользователя, которому выдано разрешение>");
            СтруктураПрав.Вставить("user_uid"           , "<uid пользователя, которому выдано разрешение>");
            
        МассивПрав.Добавить(СтруктураПрав);
            
    СтруктураСчетчика.Вставить("grants", МассивПрав);
    
        МассивЯрлыков = Новый Массив;
        
            СтруктураЯрлыка = Новый Структура;
            СтруктураЯрлыка.Вставить("name", "<имя метки>");
            
        МассивЯрлыков.Добавить(СтруктураЯрлыка);
            
    СтруктураСчетчика.Вставить("labels"            , МассивЯрлыков);
    СтруктураСчетчика.Вставить("measurement_tokens", "<список активных токенов>");
    
        МассивЗеркал = Новый Массив;
        
            СтруктураЗеркала = Новый Структура;
            СтруктураЗеркала.Вставить("site", "<полный домен сайта>");
            
        МассивЗеркал.Добавить(СтруктураЗеркала);
        
    СтруктураСчетчика.Вставить("mirrors2", МассивЗеркал);
    СтруктураСчетчика.Вставить("name"    , "<наименование счетчика>");
    
        СтруктураОффлайнОпций = Новый Структура;
        СтруктураОффлайнОпций.Вставить("offline_calls_extended_threshold"     , "<расширенный период учета звонков>");
        СтруктураОффлайнОпций.Вставить("offline_conversion_extended_threshold"
            , "<расширенный период учета офлайн-конверсий>");
        СтруктураОффлайнОпций.Вставить("offline_visits_extended_threshold"    
            , "<расширенный период учета оффлайн-заходов>");
        
    СтруктураСчетчика.Вставить("offline_options", СтруктураОффлайнОпций);
    
        МассивОпераций = Новый Массив;
        
            СтруктураОперации = Новый Структура;
            СтруктураОперации.Вставить("action", "<тип операции>");
            СтруктураОперации.Вставить("attr"  , "<поле фильтрации>");
            СтруктураОперации.Вставить("status", "<статус операции>");
            СтруктураОперации.Вставить("id"    , "<операции для изменения>");
            СтруктураОперации.Вставить("value" , "<значение для замены>");
            
        МассивОпераций.Добавить(СтруктураОперации);
            
    СтруктураСчетчика.Вставить("operations" , МассивОпераций);
    СтруктураСчетчика.Вставить("owner_login", "<логин владельца>");
    СтруктураСчетчика.Вставить("permission" , "<уровень доступа к счетчику>");
    
        СтруктураАналитики = Новый Структура;
        СтруктураАналитики.Вставить("enabled"       , "<сбор данных контентной аналитики>");
        СтруктураАналитики.Вставить("schema"        , "<используемый на сайте тип разметки>");
        СтруктураАналитики.Вставить("schema_options", "<доступные варианты разметки сайта>");
        
    СтруктураСчетчика.Вставить("publisher_options", СтруктураАналитики);
    СтруктураСчетчика.Вставить("site2"            , МассивЗеркал);
    СтруктураСчетчика.Вставить("source"           , "<тип счетчика>");
    СтруктураСчетчика.Вставить("time_zone_name"   , "<часовой пояс>");
    СтруктураСчетчика.Вставить("visit_threshold"  , "<таймаут визита в секундах>");
    
        СтруктураВебвизора = Новый Структура;
        СтруктураВебвизора.Вставить("arch_enabled"    , "<сохранение страниц сайта>");
        СтруктураВебвизора.Вставить("arch_type"       , "<запись содержимого страниц>");
        СтруктураВебвизора.Вставить("load_player_type", "<загрузка страниц в плеер>");
        СтруктураВебвизора.Вставить("urls"            , "<список страниц для сохранения>");
        СтруктураВебвизора.Вставить("wv_forms"        , "<запись содержимого полей и форм>");
        СтруктураВебвизора.Вставить("wv_version"      , "<версия вебвизора>");
        
    СтруктураСчетчика.Вставить("webvisor", СтруктураВебвизора);

    Если Пустая Тогда
        СтруктураСчетчика = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураСчетчика);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураСчетчика;
    
КонецФункции

#КонецОбласти

#КонецОбласти
