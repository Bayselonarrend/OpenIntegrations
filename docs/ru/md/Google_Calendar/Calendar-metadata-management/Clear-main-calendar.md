---
sidebar_position: 4
---

# Очистить основной календарь
 Очищает список событий основного календаря



`Функция ОчиститьОсновнойКалендарь(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";

    Результат = OPI_GoogleCalendar.ОчиститьОсновнойКалендарь(Токен);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gcalendar ОчиститьОсновнойКалендарь --token "***"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gcalendar ОчиститьОсновнойКалендарь ^
              --token "***"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
null
```
