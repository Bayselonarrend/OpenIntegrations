// Расположение OS: ./OInt/tools/Modules/OPI_ПолучениеДанныхТестов.os

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingHardcodePath-off
// BSLLS:Typo-off
// BSLLS:DeprecatedMessage-off
// BSLLS:UsingServiceTag-off
// BSLLS:ExecuteExternalCodeInCommonModule-off
// BSLLS:DuplicateStringLiteral-off

//@skip-check use-non-recommended-method

// Раскомментировать, если выполняется OneScript
// #Использовать "./internal"
// #Использовать asserts

#Область СлужебныйПрограммныйИнтерфейс

Функция ПолучитьСоответствиеРазделовТестирования() Экспорт
    
    СтандартныеЗависимости = "[Decode, Build]";
    ЗависимостиГугл        = "Testing-GoogleWorkspace";
    
    Разделы = Новый Структура;
    Разделы.Вставить("Telegram"       , СтандартныеЗависимости);
    Разделы.Вставить("VK"             , СтандартныеЗависимости);
    Разделы.Вставить("Viber"          , СтандартныеЗависимости);
    Разделы.Вставить("Twitter"        , СтандартныеЗависимости);
    Разделы.Вставить("YandexDisk"     , СтандартныеЗависимости);
    Разделы.Вставить("GoogleWorkspace", СтандартныеЗависимости);
    Разделы.Вставить("GoogleCalendar" , ЗависимостиГугл);      
    Разделы.Вставить("GoogleDrive"    , ЗависимостиГугл);
    Разделы.Вставить("GoogleSheets"   , ЗависимостиГугл);
    Разделы.Вставить("Notion"         , СтандартныеЗависимости);
    Разделы.Вставить("Slack"          , СтандартныеЗависимости);
    Разделы.Вставить("Airtable"       , СтандартныеЗависимости);
    Разделы.Вставить("Dropbox"        , СтандартныеЗависимости);
        
    Возврат Разделы;
    
КонецФункции

Функция ПолучитьТаблицуТестов() Экспорт
    
    Телеграм  = "Telegram";
    ВКонтакте = "VK";
    ЯДиск     = "YandexDisk";
    Календарь = "GoogleCalendar";
    Твиттер   = "Twitter";
    Вайбер    = "Viber";
    Драйв     = "GoogleDrive";
    ВСпейс    = "GoogleWorkspace";
    Ноушн     = "Notion";
    Слак      = "Slack";
    Таблицы   = "GoogleSheets";
    АирТ      = "Airtable";
    ДропБокс  = "Dropbox";
    
    ТаблицаТестов = Новый ТаблицаЗначений;
    ТаблицаТестов.Колонки.Добавить("Метод");
    ТаблицаТестов.Колонки.Добавить("Синоним");
    ТаблицаТестов.Колонки.Добавить("Раздел");
                                              
    НовыйТест(ТаблицаТестов, "Телеграм_ПолучитьИнформациюБота"      , "Получить информацию бота"       , Телеграм);     
    НовыйТест(ТаблицаТестов, "Телеграм_ПолучитьОбновления"          , "Получить обновления"            , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_УстановитьWebhook"           , "Установить Webhook"             , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьТекстовоеСообщение" , "Отправить текстовое сообщение"  , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьКартинку"           , "Отправить картинку"             , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьВидео"              , "Отправить видео"                , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьАудио"              , "Отправить аудио"                , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьДокумент"           , "Отправить документ"             , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьГифку"              , "Отправить гифку"                , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьМедиагруппу"        , "Отправить медиагруппу"          , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьМестоположение"     , "Отправить местоположение"       , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьКонтакт"            , "Отправить контакт"              , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ОтправитьОпрос"              , "Отправить опрос"                , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ПереслатьСообщение"          , "Переслать сообщение"            , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_БанРазбан"                   , "Бан/Разбан"                     , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_СоздатьСсылкуПриглашение"    , "Создать ссылку-приглашение"     , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ЗакрепитьОткрепитьСообщение" , "Закрепить/Открепить сообщение"  , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ПолучитьЧислоУчастников"     , "Получить число участников"      , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ПолучитьСписокАватаровФорума", "Получить список аватаров форума", Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_СоздатьУдалитьТемуФорума"    , "Создать/Удалить тему форума"    , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_ИзменитьИмяГлавнойТемы"      , "Изменить имя главной темы"      , Телеграм);
    НовыйТест(ТаблицаТестов, "Телеграм_СкрытьПоказатьГлавнуюТему"   , "Скрыть/Показать главную тему"   , Телеграм);
    
    НовыйТест(ТаблицаТестов, "ВК_СоздатьСсылкуТокена"               , "Создать ссылку получения токена", ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_СоздатьУдалитьПост"                , "Создать/Удалить пост"           , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_СоздатьСоставнойПост"              , "Создать/Удалить составной пост" , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_СоздатьОпрос"                      , "Создать опрос"                  , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_СохранитьУдалитьКартинку"          , "Добавить/Удалить картинку"      , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_СоздатьИсторию"                    , "Создать историю"                , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_МетодыОбсуждений"                  , "Действия с обсуждениями"        , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ЛайкРепостКоммент"                 , "Лайк/Репост/Комментарий"        , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ПолучитьСтатистику"                , "Получить статистику"            , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ПолучитьСтатистикуПостов"          , "Получить статистику постов"     , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_СоздатьРекламнуюКампанию"          , "Создать рекламную кампанию"     , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ОтправитьСообщение"                , "Отправить сообщение"            , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ПолучитьКатегорииТоваров"          , "Получить категории товаров"     , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_СоздатьТоварПодборку"              , "Создать товар и подборку"       , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_СоздатьТоварСоСвойствами"          , "Создать товар со свойствами"    , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ПолучитьСписокТоваров"             , "Получить список товаров"        , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ПолучитьСписокПодборок"            , "Получить список подборок"       , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ПолучитьСписокСвойств"             , "Получить список свойств"        , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ПолучитьСписокЗаказов"             , "Получить список заказов"        , ВКонтакте);
    НовыйТест(ТаблицаТестов, "ВК_ЗагрузитьВидео"                    , "Загрузить видео"                , ВКонтакте);
    
    НовыйТест(ТаблицаТестов, "ЯДиск_ПолучитьИнформациюОДиске"       , "Получить информацию о диске"    , ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_СоздатьПапку"                   , "Создать папку"                  , ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_ЗагрузитьПоАдресуПолучитьОбъект", "Загрузить по URL и получить"    , ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_ЗагрузитьУдалитьФайл"           , "Загрузить/Удалить файл"         , ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_СоздатьКопиюОбъекта"            , "Создать копию объекта"          , ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_ПолучитьСсылкуНаСкачивание"     , "Получить ссылку на скачивание"  , ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_ПолучитьСписокФайлов"           , "Получить список файлов"         , ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_ПереместитьОбъект"              , "Переместить объект"             , ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_ДействияПубличныхОбъектов"      , "Действия с публичными объектами", ЯДиск);
    НовыйТест(ТаблицаТестов, "ЯДиск_ПолучитьСписокОпубликованных"   , "Получить список опубликованных" , ЯДиск);
    
    НовыйТест(ТаблицаТестов, "ГВ_ПолучитьСсылкуАвторизации"         , "Получить ссылку авторизации"    , ВСпейс);
    НовыйТест(ТаблицаТестов, "ГВ_ПолучитьТокен"                     , "Получить токен"                 , ВСпейс);
    НовыйТест(ТаблицаТестов, "ГВ_ОбновитьТокен"                     , "Обновить токен"                 , ВСпейс);
    
    НовыйТест(ТаблицаТестов, "ГК_ПолучитьСписокКалендарей"          , "Получить список календарей"     , Календарь);
    НовыйТест(ТаблицаТестов, "ГК_СоздатьУдалитьКалендарь"           , "Создать/Удалить календарь"      , Календарь);
    НовыйТест(ТаблицаТестов, "ГК_СоздатьУдалитьСобытие"             , "Создать/Удалить событие"        , Календарь);
    НовыйТест(ТаблицаТестов, "ГК_ПолучитьСписокСобытий"             , "Получить список событий"        , Календарь);
    
    НовыйТест(ТаблицаТестов, "ГД_ПолучитьСписокКаталогов"           , "Получить список каталогов"      , Драйв);
    НовыйТест(ТаблицаТестов, "ГД_ЗагрузитьУдалитьФайл"              , "Загрузить/Удалить Файл"         , Драйв);
    НовыйТест(ТаблицаТестов, "ГД_СоздатьУдалитьКомментарий"         , "Создать/Удалить кооментарий"    , Драйв);
    НовыйТест(ТаблицаТестов, "ГД_СоздатьКаталог"                    , "Создать/Удалить каталог"        , Драйв);
    
    НовыйТест(ТаблицаТестов, "ГТ_СоздатьТаблицу"                    , "Создать таблицу"                , Таблицы);
    НовыйТест(ТаблицаТестов, "ГТ_ПолучитьТаблицу"                   , "Получить таблицу"               , Таблицы);
    НовыйТест(ТаблицаТестов, "ГТ_ЗаполнитьОчиститьЯчейки"           , "Заполнить/Очистить ячейки"      , Таблицы);
    
    НовыйТест(ТаблицаТестов, "Твиттер_ПолучитьСсылкуАвторизации"    , "Получить ссылку авторизации"    , Твиттер);
    НовыйТест(ТаблицаТестов, "Твиттер_ОбновитьТокен"                , "Обновить токен"                 , Твиттер);
    НовыйТест(ТаблицаТестов, "Твиттер_СоздатьТекстовыйТвит"         , "Текстовый твит"                 , Твиттер);
    НовыйТест(ТаблицаТестов, "Твиттер_СоздатьТвитСКартинкой"        , "Твит с картинкой"               , Твиттер);
    НовыйТест(ТаблицаТестов, "Твиттер_СоздатьТвитСВидео"            , "Твит с видео"                   , Твиттер);
    НовыйТест(ТаблицаТестов, "Твиттер_СоздатьТвитСГиф"              , "Твит с гиф"                     , Твиттер);
    НовыйТест(ТаблицаТестов, "Твиттер_СоздатьТвитСОпросом"          , "Твит с опросом"                 , Твиттер);
    
    НовыйТест(ТаблицаТестов, "Вайбер_ПолучитьИнформациюОКанале"     , "Получить информацию канала"     , Вайбер);
    НовыйТест(ТаблицаТестов, "Вайбер_ПолучитьДанныеПользователя"    , "Получить данные пользователя"   , Вайбер);
    НовыйТест(ТаблицаТестов, "Вайбер_ПолучитьОнлайнПользователей"   , "Получить онлайн пользователей"  , Вайбер);
    НовыйТест(ТаблицаТестов, "Вайбер_ОтправитьТекстовоеСообщение"   , "Отправить текстовое сообщение"  , Вайбер);
    НовыйТест(ТаблицаТестов, "Вайбер_ОтправитьКартинку"             , "Отправить картинку"             , Вайбер);
    НовыйТест(ТаблицаТестов, "Вайбер_ОтправитьФайл"                 , "Отправить файл"                 , Вайбер);
    НовыйТест(ТаблицаТестов, "Вайбер_ОтправитьКонтакт"              , "Отправить контакт"              , Вайбер);
    НовыйТест(ТаблицаТестов, "Вайбер_ОтправитьЛокацию"              , "Отправить локацию"              , Вайбер);
    НовыйТест(ТаблицаТестов, "Вайбер_ОтправитьСсылку"               , "Отправить ссылку"               , Вайбер);
    
    НовыйТест(ТаблицаТестов, "Ноушн_СоздатьСтраницу"                , "Создать страницу"               , Ноушн);
    НовыйТест(ТаблицаТестов, "Ноушн_СоздатьИзменитьБазу"            , "Создать/Изменить базу"          , Ноушн);
    НовыйТест(ТаблицаТестов, "Ноушн_ПолучитьИнформациюОСтранице"    , "Получить информацию о странице" , Ноушн);
    НовыйТест(ТаблицаТестов, "Ноушн_ПолучитьИнформациюОБазе"        , "Получить информацию о базе"     , Ноушн);
    НовыйТест(ТаблицаТестов, "Ноушн_СоздатьСтраницуВБазу"           , "Создать страницу в базу"        , Ноушн);
    НовыйТест(ТаблицаТестов, "Ноушн_ИзменитьСвойстваСтраницы"       , "Изменить свойства страницы"     , Ноушн);
    НовыйТест(ТаблицаТестов, "Ноушн_СоздатьУдалитьБлок"             , "Создать/Удалить блок"           , Ноушн);
    НовыйТест(ТаблицаТестов, "Ноушн_ПолучитьПользователей"          , "Получить пользователей"         , Ноушн);
    НовыйТест(ТаблицаТестов, "Ноушн_ПолучитьДанныеПользователя"     , "Получить данные пользователя"   , Ноушн);
    
    НовыйТест(ТаблицаТестов, "Слак_ПолучитьИнформациюОБоте"         , "Получить информацию о боте"     , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ПолучитьСписокПользователей"     , "Получить список пользователей"  , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ПолучитьСписокОбластей"          , "Получить список областей"       , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ОтправитьУдалитьСообщение"       , "Отправить/Удалить сообщение"    , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ОтправитьУдалитьЭфемерное"       , "Отправить/Удалить эфемерное"    , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ПолучитьОтложенныеСообщения"     , "Получить отложенные сообщения"  , Слак);
    НовыйТест(ТаблицаТестов, "Слак_СоздатьАрхивироватьКанал"        , "Создать/Архивировать канал"     , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ПолучитьСписокКаналов"           , "Получить список каналов"        , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ОткрытьЗакрытьДиалог"            , "Открыть/Закрыть диалог"         , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ПолучитьСписокФайлов"            , "Получить список файлов"         , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ЗагрузитьУдалитьФайл"            , "Загрузить/Удалить файл"         , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ПолучитьСписокВФ"                , "Получить список внеш. файлов"   , Слак);
    НовыйТест(ТаблицаТестов, "Слак_ЗагрузитьУдалитьВФ"              , "Загрузить/Удалить внеш. файл"   , Слак);
    
    НовыйТест(ТаблицаТестов, "АТ_СоздатьБазу"                       , "Создать/Изменить базу"          , АирТ);
    НовыйТест(ТаблицаТестов, "АТ_СоздатьТаблицу"                    , "Создать/Изменить таблицу"       , АирТ);
    НовыйТест(ТаблицаТестов, "АТ_СоздатьПоле"                       , "Создать/Изменить поле"          , АирТ);
    НовыйТест(ТаблицаТестов, "АТ_СоздатьУдалитьЗаписи"              , "Создать/Удалить записи"         , АирТ);
    
    НовыйТест(ТаблицаТестов, "ДропБокс_ПолучитьОбновитьТокен"       , "Получить/Обновить токен"        , ДропБокс);
    НовыйТест(ТаблицаТестов, "ДропБокс_ЗагрузитьФайл"               , "Загрузить файл"                 , ДропБокс);
    НовыйТест(ТаблицаТестов, "ДропБокс_ЗагрузитьФайлПоURL"          , "Загрузить файл по URL"          , ДропБокс);
    НовыйТест(ТаблицаТестов, "ДропБокс_СоздатьКаталог"              , "Создать каталог"                , ДропБокс);
    НовыйТест(ТаблицаТестов, "ДропБокс_СоздатьУдалитьТег"           , "Создать/Удалить тег"            , ДропБокс);
    НовыйТест(ТаблицаТестов, "ДропБокс_ПолучитьАккаунт"             , "Получить данные аккаунта"       , ДропБокс);
   
    Возврат ТаблицаТестов;
                                    
КонецФункции                             

Функция ОжидаетЧто(Значение) Экспорт
    
    Попытка
        
        Модуль  = ПолучитьОбщийМодуль("ЮТест");
        Ожидаем = ТипЗнч(Модуль) = Тип("ОбщийМодуль");
        Возврат Модуль.ОжидаетЧто(Значение);  
           
    Исключение
        Возврат Ожидаем.Что(Значение);
    КонецПопытки;
    
КонецФункции

Функция СформироватьТестыЯкс() Экспорт
    
    Модуль        = ПолучитьОбщийМодуль("ЮТТесты");
    Разделы       = ПолучитьСоответствиеРазделовТестирования();
    ТаблицаТестов = ПолучитьТаблицуТестов();
    
    Для Каждого Раздел Из Разделы Цикл
        
        ТекущийРаздел = Раздел.Ключ;
        Отбор         = Новый Структура("Раздел", ТекущийРаздел);
        ТестыРаздела  = ТаблицаТестов.НайтиСтроки(Отбор);
        
        Набор = Модуль.ДобавитьТестовыйНабор(ТекущийРаздел);
        
        Для Каждого Тест Из ТестыРаздела Цикл
            Набор.ДобавитьСерверныйТест(Тест.Метод, Тест.Синоним);
        КонецЦикла;
        
    КонецЦикла;
    
    Возврат "";
    
КонецФункции

Функция СформироватьТестыАссертс() Экспорт
    
   ТаблицаТестов = ПолучитьТаблицуТестов();
   МассивТестов  = Новый Массив;
   
   Для Каждого Тест Из ТаблицаТестов Цикл     
       МассивТестов.Добавить(Тест.Метод);
   КонецЦикла;
   
   Возврат МассивТестов;
   
КонецФункции

Функция ПолучитьПараметр(Параметр) Экспорт 

    Путь = ПутьКФайлуДанных(); 
    Возврат ПолучитьЗначениеИзФайла(Параметр, Путь);

КонецФункции

Функция ПолучитьДвоичные(Параметр) Экспорт
    
    Путь              = ПутьКФайлуДанных(); 
    ПараметрЛокальный = Параметр + "Local";
    ЗначениеОсновной  = ПолучитьЗначениеИзФайла(Параметр         , Путь);
    ЗначениеЛокальный = ПолучитьЗначениеИзФайла(ПараметрЛокальный, Путь);
    
    ФайлЛокальный = Новый Файл(ЗначениеЛокальный);
    
    Если ФайлЛокальный.Существует() Тогда
        Значение = Новый ДвоичныеДанные(ЗначениеЛокальный);
    Иначе
        Значение = ЗначениеОсновной;
    КонецЕсли;
    
    Если ТипЗнч(Значение) = Тип("Строка") Тогда
        Значение = ПолучитьФайлПути(Значение, ПараметрЛокальный);    
    КонецЕсли;
    
    Возврат Значение;
    
КонецФункции

Функция ПолучитьФайлПути(Знач Путь, ПараметрЛокальный, Знач СохранятьЛокально = Истина) Экспорт
    
    Если СтрНайти(Путь, "http") > 0 
        Или СтрНайти(Путь, "www") > 0 Тогда
        
        ИВФ = ПолучитьИмяВременногоФайла();
        КопироватьФайл(Путь, ИВФ);
        Путь = ИВФ;
        Двоичные = Новый ДвоичныеДанные(Путь);
        
        Если СохранятьЛокально Тогда
            ЗаписатьПараметр(ПараметрЛокальный, ИВФ);
        Иначе
            УдалитьФайлы(ИВФ);
        КонецЕсли;
        
    Иначе
        
        Двоичные = Новый ДвоичныеДанные(Путь);
        
    КонецЕсли;
    
    Возврат Двоичные;
    
КонецФункции

Процедура ПараметрВКоллекцию(Параметр, Коллекция) Экспорт

	Значение = ПолучитьПараметр(Параметр);
	Коллекция.Вставить(Параметр, Значение);
		
КонецПроцедуры

Процедура ДвоичныеВКоллекцию(Параметр, Коллекция) Экспорт

	Значение = ПолучитьДвоичные(Параметр);
	Коллекция.Вставить(Параметр, Значение);
		
КонецПроцедуры

Процедура ЗаписатьПараметр(Параметр, Значение) Экспорт
    
    Путь = ПутьКФайлуДанных(); 
    ЗаписатьПараметрВФайл(Параметр, Значение, Путь);
   
КонецПроцедуры

Процедура ЗаписатьЛог(Знач Результат, Знач Метод) Экспорт
    
    Шапка    = Строка(OPI_Инструменты.ПолучитьТекущуюДату()) + " | " + Метод;
    
    Попытка
        Данные = OPI_Инструменты.JSONСтрокой(Результат);
    Исключение
        Данные = "Не JSON: " + Строка(Результат);
    КонецПопытки;
    
    Данные   = "    " + Данные; 
    
    Сообщить(Шапка);
    Сообщить(Символы.ПС);
    Сообщить(Данные);
    Сообщить(Символы.ПС);
    Сообщить("---------------------------------");
    Сообщить(Символы.ПС);
    
	ЗаписатьФайлЛога(Данные, Метод);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьЗначениеИзФайла(Параметр, Путь) 
        
    Значения = OPI_Инструменты.ПрочитатьJSONФайл(Путь);    
    Возврат ?(Значения.Свойство(Параметр), Значения[Параметр], "");
    
КонецФункции

Функция ПутьКФайлуДанных()
    
    ПутьРепозитория = "./data.json";
    ПутьЛокальный   = "C:\GDrive\Мой диск\data.json";
    ФайлРепозитория = Новый Файл(ПутьРепозитория);
    
    Если ФайлРепозитория.Существует() Тогда
        Путь = ПутьРепозитория;
    Иначе
        Путь = ПутьЛокальный;
    КонецЕсли;    
     
    Возврат Путь;
    
КонецФункции

Функция ПолучитьОбщийМодуль(Знач Имя)
    УстановитьБезопасныйРежим(Истина);    
    Модуль  = Вычислить(Имя);     
    УстановитьБезопасныйРежим(Ложь);    
    Возврат Модуль;    
КонецФункции

Процедура НовыйТест(ТаблицаЗначений, Знач Метод, Знач Синоним, Знач Раздел)
    
    НовыйТест = ТаблицаЗначений.Добавить();
    НовыйТест.Метод     = Метод;
    НовыйТест.Синоним   = Синоним;
    НовыйТест.Раздел    = Раздел;
    
КонецПроцедуры

Процедура ЗаписатьПараметрВФайл(Знач Параметр, Знач Значение, Знач Путь)
                      
    Значения = OPI_Инструменты.ПрочитатьJSONФайл(Путь);
    Значения.Вставить(Параметр, Значение);

    Запись              = Новый ЗаписьJSON;
    ПараметрыЗаписиJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Авто, Символы.Таб);
    Запись.ОткрытьФайл(Путь, , , ПараметрыЗаписиJSON);
    ЗаписатьJSON(Запись, Значения);
    Запись.Закрыть();

КонецПроцедуры

Процедура ЗаписатьФайлЛога(Знач Данные, Знач Метод)
	
	Попытка
		
		ПутьЛогов    = "./test_logs";
		КаталогЛогов = Новый Файл(ПутьЛогов);
		
		Если Не КаталогЛогов.Существует() Тогда
			СоздатьКаталог(ПутьЛогов);
		КонецЕсли;
		 
		ДокументЛога = Новый ТекстовыйДокумент;
		ДокументЛога.УстановитьТекст(Данные);
		ДокументЛога.Записать(ПутьЛогов + "/" + Метод + ".log");
		
	Исключение
		Сообщить("Не удалось записать файл лога!: " + ОписаниеОшибки());	
	КонецПопытки;
	
КонецПроцедуры

#КонецОбласти
