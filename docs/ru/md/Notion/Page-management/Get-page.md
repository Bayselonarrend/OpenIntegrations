---
sidebar_position: 3
---

# Получить страницу
 Получает информацию о странице по ID



`Функция ПолучитьСтраницу(Знач Токен, Знач Страница) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Страница | --page | Строка | ID страницы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
    Страница  = "11282aa7-fc4e-814c-990c-dd3c9c3c2c22";

    Результат = OPI_Notion.ПолучитьСтраницу(Токен, Страница);
```



```sh title="Пример команды CLI"
    
  oint notion ПолучитьСтраницу --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "a574281614174169bf55dbae4..."

```

```json title="Результат"
{
 "object": "page",
 "id": "11982aa7-fc4e-8159-8536-cc666fcb1367",
 "created_time": "2024-10-08T17:43:00Z",
 "last_edited_time": "2024-10-08T17:43:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "cover": null,
 "icon": null,
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "title": {
   "id": "title",
   "type": "title",
   "title": [
    {
     "type": "text",
     "text": {
      "content": "Тестовый заголовок",
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
     "plain_text": "Тестовый заголовок",
     "href": null
    }
   ]
  }
 },
 "url": "https://www.notion.so/11982aa7fc4e81598536cc666fcb1367",
 "public_url": null,
 "request_id": "82600cae-f3d4-4575-a0ec-76c03d210446"
}
```
