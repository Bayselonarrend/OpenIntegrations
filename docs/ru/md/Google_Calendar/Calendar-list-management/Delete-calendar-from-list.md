---
sidebar_position: 4
---

# Удалить календарь из списка
 Удаляет календарь из списка пользователя



`Функция УдалитьКалендарьИзСписка(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Календарь = "a3d6595737662df84b35deadee083703bcebd61e5abe13974bda474f6d19a7cd@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.УдалитьКалендарьИзСписка(Токен, Календарь);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gcalendar УдалитьКалендарьИзСписка --token "***" \
              --calendar "f2a98bd1d17474fbd6db370f9759c6ab51d226bdb04aebf6eb683160c8361192@group.calendar.google.com"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gcalendar УдалитьКалендарьИзСписка ^
              --token "***" ^
              --calendar "f2a98bd1d17474fbd6db370f9759c6ab51d226bdb04aebf6eb683160c8361192@group.calendar.google.com"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
null
```
