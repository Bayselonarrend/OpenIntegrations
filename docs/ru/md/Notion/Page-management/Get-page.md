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
 "id": "11882aa7-fc4e-81f9-85d2-f831a3f6a53b",
 "created_time": "2024-10-07T13:00:00Z",
 "last_edited_time": "2024-10-07T13:00:00Z",
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
 "url": "https://www.notion.so/11882aa7fc4e81f985d2f831a3f6a53b",
 "public_url": null,
 "request_id": "b5e2809a-836b-4af9-a8ad-d2c4c6e959ed"
}
```
