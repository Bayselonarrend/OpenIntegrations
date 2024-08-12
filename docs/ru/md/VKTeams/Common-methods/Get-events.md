﻿---
sidebar_position: 2
---

# Получить события
 Получает события бота в Polling режиме



`Функция ПолучитьСобытия(Знач Токен, Знач IDПоследнего, Знач Таймаут = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDПоследнего | --last | Строка, Число | ID последнего обработанного до этого события |
  | Таймаут | --timeout | Строка, Число | Время удержания соединения для Long Polling |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /events/get](https://teams.vk.com/botapi/#/events/get_events_get)
:::
<br/>


```bsl title="Пример кода"
  Токен        = "001.3501506236.091...";
  IDПоследнего = 0;
  
  Для Н = 1 По 5 Цикл // В реальной работе - бесконечный цикл
  
  Результат = OPI_VKTeams.ПолучитьСобытия(Токен, IDПоследнего, 3);
  
  События   = Результат["events"];
  
  // Обработка событий...
  
  Если Не События.Количество() = 0 Тогда
  IDПоследнего             = События[События.ВГраница()]["eventId"];
  КонецЕсли;
  
  КонецЦикла;
```
	


```sh title="Пример команды CLI"
    
  oint vkteams ПолучитьСобытия --token %token% --last %last% --timeout %timeout%

```

```json title="Результат"
{
 "events": [],
 "ok": true
}
```