---
sidebar_position: 1
---

# Получить список календарей
 Получает массив календарей аккаунта


*Функция ПолучитьСписокКалендарей(Знач Токен) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - Массив соответствий данных календарей

```bsl title="Пример кода"
	
  
  Ответ = OPI_GoogleCalendar.ПолучитьСписокКалендарей(Токен); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                 //Строка
  

	
```

```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьСписокКалендарей --token %token%


```


```json title="Результат"

[
  {
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "accessRole": "reader",
  "foregroundColor": "#000000",
  "backgroundColor": "#92e1c0",
  "colorId": "13",
  "description": "Показывает дни рождения, годовщины и другие значимые события для людей в Google Контактах.",
  "summary": "Дни рождения",
  "defaultReminders": [],
  "timeZone": "Europe/Minsk",
  "id": "addressbook#contacts@group.v.calendar.google.com",
  "etag": "\"1708410978711000\"",
  "kind": "calendar#calendarListEntry"
  },
  {
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "notificationSettings": {
  "notifications": [
  {
  "method": "email",
  "type": "eventCreation"
  },
  {
  "method": "email",
  "type": "eventChange"
  },
  {
  "method": "email",
  "type": "eventCancellation"
  },
  {
  "method": "email",
  "type": "eventResponse"
  }
  ]
  },
  "accessRole": "owner",
  "selected": true,
  "foregroundColor": "#000000",
  "backgroundColor": "#9fe1e7",
  "colorId": "14",
  "primary": true,
  "summary": "bayselonarrend@gmail.com",
  "defaultReminders": [
  {
  "minutes": 30,
  "method": "popup"
  }
  ],
  "timeZone": "Europe/Minsk",
  "id": "bayselonarrend@gmail.com",
  "etag": "\"1708411692097000\"",
  "kind": "calendar#calendarListEntry"
  },
  {
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "accessRole": "reader",
  "foregroundColor": "#000000",
  "backgroundColor": "#16a765",
  "colorId": "8",
  "description": "Праздники и памятные даты Беларуси",
  "summary": "Праздники Беларуси",
  "defaultReminders": [],
  "timeZone": "Europe/Minsk",
  "id": "ru.by#holiday@group.v.calendar.google.com",
  "etag": "\"1708417568219000\"",
  "kind": "calendar#calendarListEntry"
  },
  {
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "accessRole": "owner",
  "foregroundColor": "#000000",
  "backgroundColor": "#cca6ac",
  "colorId": "21",
  "description": "Тестовое описание",
  "summary": "Тестовый календарь (изм.)",
  "defaultReminders": [],
  "timeZone": "UTC",
  "id": "9e3fe3b35b6a09a1fa9413a0deec2fe8e040ed7fdd0fdeb1e49028848269654d@group.calendar.google.com",
  "etag": "\"1708417602744000\"",
  "kind": "calendar#calendarListEntry"
  },
  {
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "accessRole": "owner",
  "foregroundColor": "#000000",
  "backgroundColor": "#ffd800",
  "colorId": "6",
  "description": "Тестовое описание",
  "summary": "Тестовый календарь (изм.)",
  "defaultReminders": [],
  "timeZone": "UTC",
  "id": "0047d950f70f380b8ff7e2fa538b6f9f10c8a3212d0740788545406cf73431b9@group.calendar.google.com",
  "etag": "\"1708417840630000\"",
  "kind": "calendar#calendarListEntry"
  },
  {
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "accessRole": "owner",
  "foregroundColor": "#000000",
  "backgroundColor": "#ffd800",
  "colorId": "6",
  "description": "Тестовое описание",
  "summary": "Тестовый календарь (изм.)",
  "defaultReminders": [],
  "timeZone": "UTC",
  "id": "b5c45ad216306688c4286a262bf66d3da38aaadec3b7a5768153740140ea787c@group.calendar.google.com",
  "etag": "\"1708418157716000\"",
  "kind": "calendar#calendarListEntry"
  }
  ]

```
