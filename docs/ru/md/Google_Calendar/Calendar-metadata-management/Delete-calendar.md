---
sidebar_position: 5
---

# Удалить календарь
 Удаляет календарь по ID



`Функция УдалитьКалендарь(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Календарь = "2cd4d2b5dc7a898d4f1d65956b5ccca32841aff4a1603b373ff14db442ac9fab@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.УдалитьКалендарь(Токен, Календарь);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint gcalendar УдалитьКалендарь --token "***" \
              --calendar "95bed4847e3734e9f1e6513c9eb637e885c5996c77711c19a10348453ecb11fe@group.calendar.google.com"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gcalendar УдалитьКалендарь ^
              --token "***" ^
              --calendar "95bed4847e3734e9f1e6513c9eb637e885c5996c77711c19a10348453ecb11fe@group.calendar.google.com"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
null
```
