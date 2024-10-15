---
sidebar_position: 13
---

# Получить список версий объекта
 Получает список версий (ревизий) объекта



`Функция ПолучитьСписокВерсийОбъекта(Знач Токен, Знач Путь, Знач Количество = 10) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |
  | Количество | --amount | Строка, Число | Число последних версий объекта для отображения |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен     = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Путь      = "/New/pic.png";

    Результат = OPI_Dropbox.ПолучитьСписокВерсийОбъекта(Токен, Путь, 1);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ПолучитьСписокВерсийОбъекта --token "***" \
              --path "/New/pic.png" \
              --amount 1
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ПолучитьСписокВерсийОбъекта ^
              --token "***" ^
              --path "/New/pic.png" ^
              --amount 1
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "is_deleted": false,
 "entries": [
  {
   "name": "pic.png",
   "path_lower": "/new/pic.png",
   "path_display": "/New/pic.png",
   "id": "id:kJU6-a-pT48AAAAAAAAcWQ",
   "client_modified": "2024-10-08T17:44:58Z",
   "server_modified": "2024-10-08T17:44:59Z",
   "rev": "623fab23a7559bd841553",
   "size": 2114023,
   "is_downloadable": true,
   "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
  }
 ]
}
```
