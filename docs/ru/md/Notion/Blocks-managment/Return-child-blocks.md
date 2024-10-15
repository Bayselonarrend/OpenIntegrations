---
sidebar_position: 3
---

# Вернуть дочерние блоки
 Созвращает список дочерних блоков блока-родителя



`Функция ВернутьДочерниеБлоки(Знач Токен, Знач ИДБлока) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДБлока | --block | Строка | ID блока родителя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
    Блок      = "11c82aa7-fc4e-817a-8b3c-fb5bd406e07c";

    Результат    = OPI_Notion.ВернутьДочерниеБлоки(Токен, Блок);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint notion ВернутьДочерниеБлоки --token "***" \
              --block "12082aa7-fc4e-8136-917c-e838f972af74"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint notion ВернутьДочерниеБлоки ^
              --token "***" ^
              --block "12082aa7-fc4e-8136-917c-e838f972af74"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "object": "list",
 "results": [],
 "next_cursor": null,
 "has_more": false,
 "type": "block",
 "block": {},
 "request_id": "29c8abb1-7a13-448b-82ef-449646b1ae63"
}
```
