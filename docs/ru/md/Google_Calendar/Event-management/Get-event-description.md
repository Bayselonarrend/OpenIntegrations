﻿---
sidebar_position: 1
---

# Получить описание события 




`Функция ПолучитьОписаниеСобытия() Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|

  
  Возвращаемое значение:  Соответствие Из КлючИЗначение - Пустой макет события

<br/>




	


```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьОписаниеСобытия

```

```json title="Результат"
СоответствиеСобытия = Новый Соответствие;
  СоответствиеСобытия.Вставить("Описание"                 , "");                                          // Описание события
  СоответствиеСобытия.Вставить("Заголовок"                , "Новое событие");                             // Заголовок события
  СоответствиеСобытия.Вставить("МестоПроведения"          , "");                                          // Строка описание места проведения
  СоответствиеСобытия.Вставить("ДатаНачала"               , ТекущаяДатаСеанса());                         // Дата начала события
  СоответствиеСобытия.Вставить("ДатаОкончания"            , СоответствиеСобытия["ДатаНачала"] + 3600);    // Дата окончания события
  СоответствиеСобытия.Вставить("МассивURLФайловВложений"  , Новый Соответствие);                          // Ключ - название, Значение - URL к файлу
  СоответствиеСобытия.Вставить("ОтправлятьУведомления"    , Истина);                                      // Признак отправки уведомлений участникам
```
