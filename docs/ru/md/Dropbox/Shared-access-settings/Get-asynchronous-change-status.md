---
sidebar_position: 5
---

# Получить статус асинхронного изменения
 Получает статус асинхронной работы по изменению доступов



`Функция ПолучитьСтатусАсинхронногоИзменения(Знач Токен, Знач IDРаботы) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDРаботы | --job | Строка | ID асинхронной работы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен     = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    IDРаботы  = "dbjid:AADns14EdwZ4C7QvhwyHagmhHDv0r9IZCiglKB53j4cCgdIdcTY_UmDI1kiW4szDJU-p3QWJLwmCsWPeLh_pxglp";

    Результат = OPI_Dropbox.ПолучитьСтатусАсинхронногоИзменения(Токен, IDРаботы);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ПолучитьСтатусАсинхронногоИзменения --token "***" \
              --job "dbjid:AAAIJ7t1xyhVC8tWH4ww87h6Tvea-NtCVPY9eTDkdmcnLwYZJrUuC7YhYymd6W4jQTwW-V--hjFbraM1tMNhzIw0"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ПолучитьСтатусАсинхронногоИзменения ^
              --token "***" ^
              --job "dbjid:AAAIJ7t1xyhVC8tWH4ww87h6Tvea-NtCVPY9eTDkdmcnLwYZJrUuC7YhYymd6W4jQTwW-V--hjFbraM1tMNhzIw0"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 ".tag": "complete"
}
```
