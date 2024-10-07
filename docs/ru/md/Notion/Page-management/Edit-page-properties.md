---
sidebar_position: 4
---

# Изменить свойства страницы
 Изменяет свойства существующей страницы



`Функция ИзменитьСвойстваСтраницы(Знач Токен, Знач Страница, Знач Данные = "", Знач Иконка = "", Знач Обложка = "", Знач Архивирована = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Страница | --page | Строка | ID изменяемой страницы |
  | Данные | --data | Соответствие Из КлючИЗначение | Соответствие изменяемых параметров |
  | Иконка | --icon | Строка | URL картинки иконки страницы |
  | Обложка | --cover | Строка | URL картинки обложки страницы |
  | Архивирована | --archive | Булево | Архивировать страницу или нет (булево) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен        = "secret_9RsfMrRMqZwqp0Zl0B...";
    Страница     = "11282aa7-fc4e-814c-990c-dd3c9c3c2c22";
    Иконка       = "https://openyellow.neocities.org/test_data/picture.jpg";
    Обложка      = "https://openyellow.neocities.org/test_data/picture2.jpg";
    Архивировать = Ложь;

    Свойства = Новый Соответствие;
    Свойства.Вставить("Активен"     , Ложь);
    Свойства.Вставить("Почта"       , "vector@mail.ru");

    Результат = OPI_Notion.ИзменитьСвойстваСтраницы(Токен
        , Страница
        , Свойства
        , Иконка
        , Обложка
        , Архивировать);
```



```sh title="Пример команды CLI"
    
  oint notion ИзменитьСвойстваСтраницы --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --data %data% --icon "https://opi.neocities.org/img/logo.png" --cover "https://opi.neocities.org/assets/images/logo_long-e69f28017feff1759ffcfe3f4e7bbf2a.png" --archive %archive%

```

```json title="Результат"
{
 "object": "page",
 "id": "11882aa7-fc4e-812f-8cef-dc2176922397",
 "created_time": "2024-10-07T06:20:00Z",
 "last_edited_time": "2024-10-07T06:21:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "cover": {
  "type": "external",
  "external": {
   "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"
  }
 },
 "icon": {
  "type": "external",
  "external": {
   "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"
  }
 },
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
 "url": "https://www.notion.so/11882aa7fc4e812f8cefdc2176922397",
 "public_url": null,
 "request_id": "97feea94-0321-46b0-a6d0-48e595114c4a"
}
```
