---
sidebar_position: 6
---

# Получить статус загрузки по URL
 Получает статус загрузки файла по URL



`Функция ПолучитьСтатусЗагрузкиПоURL(Знач Токен, Знач IDРаботы) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDРаботы | --job | Строка | ID асинхронной работы из ответа ЗагрузитьФайлПоURL |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен    = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    ИДРаботы = "8VM99l3ckEAAAAAAAAAAAQ";
    Статус   = "in_progress";

    Пока Статус = "in_progress" Цикл

        Результат = OPI_Dropbox.ПолучитьСтатусЗагрузкиПоURL(Токен, ИДРаботы);
        Статус    = Результат[".tag"];

        OPI_Инструменты.Пауза(5);

    КонецЦикла;
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ПолучитьСтатусЗагрузкиПоURL --token "***" \
              --job "RFGLw9RumQQAAAAAAAAAAQ"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ПолучитьСтатусЗагрузкиПоURL ^
              --token "***" ^
              --job "RFGLw9RumQQAAAAAAAAAAQ"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 ".tag": "complete",
 "name": "url_doc.docx",
 "path_lower": "/new/url_doc.docx",
 "path_display": "/New/url_doc.docx",
 "id": "id:kJU6-a-pT48AAAAAAAAcXA",
 "client_modified": "2024-10-08T17:46:00Z",
 "server_modified": "2024-10-08T17:46:01Z",
 "rev": "623fab5ed0205bd841553",
 "size": 24069,
 "is_downloadable": true,
 "content_hash": "8d63c5989ceec1a90f3fde2ffaa76efcd2c050191e6b55a1761e4e352590bd8c"
}
```
