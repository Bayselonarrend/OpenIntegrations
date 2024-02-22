---
sidebar_position: 2
---

# Получить календарь списка
Получает информацию о календаре из списка календарей пользователя

*Функция ПолучитьКалендарьСписка(Знач Токен, Знач Календарь) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Токен | Строка | Токен доступа |
  | Календарь | Строка | ID календаря для получения |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Google

```bsl title="Пример кода"
			
    Ответ = OPI_GoogleCalendar.ПолучитьКалендарьСписка(Токен, "55868c32be16935f0..."); //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                        //Строка

```

```json title="Результат"

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
 "id": "f0fad8c7db43ef0adb71cbf035eb08cf80d8f8d51ba31fa86f4d5680dc2e9725@group.calendar.google.com",
 "etag": "\"1708423563386000\"",
 "kind": "calendar#calendarListEntry"
}

```
