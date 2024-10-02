---
sidebar_position: 2
---

# Вернуть блок
 Возвращает структуру блока по ID



`Функция ВернутьБлок(Знач Токен, Знач ИДБлока, Знач ТолькоОснова = Истина) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДБлока | --block | Строка | ID блока |
  | ТолькоОснова | --core | Булево | Истина > служебные поля удаляются, остается только сам блок |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Блок   = "d7021bdd15b944ababcb02bd2b1a5f6a";

    Результат = OPI_Notion.ВернутьБлок(Токен, Блок);
```



```sh title="Пример команды CLI"
    
  oint notion ВернутьБлок --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block% --core %core%

```

```json title="Результат"
{
 "object": "block",
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "in_trash": true,
 "type": "to_do",
 "to_do": {
  "rich_text": [
   {
    "type": "text",
    "text": {
     "content": "YoYO",
     "link": null
    },
    "annotations": {
     "bold": false,
     "italic": false,
     "strikethrough": false,
     "underline": false,
     "code": false,
     "color": "default"
    },
    "plain_text": "YoYO",
    "href": null
   }
  ],
  "checked": false,
  "color": "default"
 }
}
```
