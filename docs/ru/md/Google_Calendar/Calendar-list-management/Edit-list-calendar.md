---
sidebar_position: 5
---

# Изменить календарь списка
 Изменяет свойства календаря из списка пользователей



`Функция ИзменитьКалендарьСписка(Знач Токен, Знач Календарь, Знач ОсновнойЦвет, Знач ДополнительныйЦвет, Знач Скрытый = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | ОсновнойЦвет | --primary | Строка | HEX основного цвета (#ffffff) |
  | ДополнительныйЦвет | --secondary | Строка | HEX дополнительного цвета (#ffffff) |
  | Скрытый | --hidden | Булево | Скрытый календарь |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен              = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Календарь          = "a3d6595737662df84b35deadee083703bcebd61e5abe13974bda474f6d19a7cd@group.calendar.google.com";
    ОсновнойЦвет       = "#000000";
    ДополнительныйЦвет = "#ffd800";
    Скрытый            = Ложь;

    Результат = OPI_GoogleCalendar.ИзменитьКалендарьСписка(Токен
        , Календарь
        , ОсновнойЦвет
        , ДополнительныйЦвет
        , Скрытый);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gcalendar ИзменитьКалендарьСписка --token "***" \
              --calendar "f2a98bd1d17474fbd6db370f9759c6ab51d226bdb04aebf6eb683160c8361192@group.calendar.google.com" \
              --primary "#000000" \
              --secondary "#ffd800" \
              --hidden false
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gcalendar ИзменитьКалендарьСписка ^
              --token "***" ^
              --calendar "f2a98bd1d17474fbd6db370f9759c6ab51d226bdb04aebf6eb683160c8361192@group.calendar.google.com" ^
              --primary "#000000" ^
              --secondary "#ffd800" ^
              --hidden false
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728409243961000\"",
 "id": "cc92fd648db664e3e2fcd62db4c9fd9f458cc49bbc6382560c48f59105aede70@group.calendar.google.com",
 "summary": "Новое наименование",
 "description": "Новое описание",
 "timeZone": "Europe/Moscow",
 "colorId": "6",
 "backgroundColor": "#ffd800",
 "foregroundColor": "#000000",
 "accessRole": "owner",
 "defaultReminders": [],
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```
