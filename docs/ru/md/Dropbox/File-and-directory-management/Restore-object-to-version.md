---
sidebar_position: 14
---

# Восстановить объект к версии
 Восстанавливает состояние объекта к необходимой версии (ревизии)



`Функция ВосстановитьОбъектКВерсии(Знач Токен, Знач Путь, Знач Версия) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |
  | Версия | --rev | Строка | ID версии (ревизии) для востановления |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Версия    = "6242e6c9daae7bd841553";
    Токен     = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Путь      = "/New/pic.png";

    Результат = OPI_Dropbox.ВосстановитьОбъектКВерсии(Токен, Путь, Версия);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ВосстановитьОбъектКВерсии --token "***" \
              --path "/New/pic.png" \
              --rev "62475a95a622dbd841553"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ВосстановитьОбъектКВерсии ^
              --token "***" ^
              --path "/New/pic.png" ^
              --rev "62475a95a622dbd841553"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
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
```
