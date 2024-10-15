---
sidebar_position: 1
---

# Создать календарь
 Создает пустой календарь



`Функция СоздатьКалендарь(Знач Токен, Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Наименование | --title | Строка | Наименование создаваемого календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Наименование = "Тестовый календарь";

    Результат = OPI_GoogleCalendar.СоздатьКалендарь(Токен, Наименование);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gcalendar СоздатьКалендарь --token "***" \
              --title "Тестовый календарь"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gcalendar СоздатьКалендарь ^
              --token "***" ^
              --title "Тестовый календарь"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "kind": "calendar#calendar",
 "etag": "\"3HshD0LA889W8w5lSPGvE18X3Co\"",
 "id": "f8cb253516cc990d1f36a7d15cdb825ffdc15c6ceeaa25ef78924de9beea3a56@group.calendar.google.com",
 "summary": "Тестовый календарь",
 "timeZone": "Europe/Moscow",
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```
