---
sidebar_position: 5
---

# Получить новости
 Получает нвости или одну новость с отобором по ID или доступности



`Функция ПолучитьНовости(Знач URL, Знач IDНовости = "", Знач Отбор = "UA", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDНовости | --postid | Строка, Число | ID важной новости |
  | Отбор | --sel | Строка | Отбор новостей по доступу: UA все, SGn раб. группа, Un пользователь, DRn отдел, Gn группа |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [log.blogpost.get](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_get.php)
:::
<br/>


```bsl title="Пример кода"
    IDНовости = "836";
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПолучитьНовости(URL, IDНовости);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьНовости(URL, IDНовости, , Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьНовости --url "b24-ar17wx.bitrix24.by" --postid "124" --sel %sel% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": [
  {
   "ID": "40",
   "BLOG_ID": "1",
   "PUBLISH_STATUS": "P",
   "TITLE": "Заголовок новости",
   "AUTHOR_ID": "1",
   "ENABLE_COMMENTS": "Y",
   "NUM_COMMENTS": "0",
   "CODE": null,
   "MICRO": "N",
   "DETAIL_TEXT": "Текст новости",
   "DATE_PUBLISH": "2024-06-13T18:41:47+00:00",
   "CATEGORY_ID": null,
   "HAS_SOCNET_ALL": "N",
   "HAS_TAGS": "N",
   "HAS_IMAGES": "N",
   "HAS_PROPS": "Y",
   "HAS_COMMENT_IMAGES": null,
   "UF_BLOG_POST_DOC": {
    "ID": "1",
    "ENTITY_ID": "BLOG_POST",
    "FIELD_NAME": "UF_BLOG_POST_DOC",
    "USER_TYPE_ID": "file",
    "XML_ID": "UF_BLOG_POST_DOC",
    "SORT": "100",
    "MULTIPLE": "Y",
    "MANDATORY": "N",
    "SHOW_FILTER": "N",
    "SHOW_IN_LIST": "N",
    "EDIT_IN_LIST": "Y",
    "IS_SEARCHABLE": "Y",
    "SETTINGS": {
     "SIZE": 20,
     "LIST_WIDTH": 0,
     "LIST_HEIGHT": 0,
     "MAX_SHOW_SIZE": 0,
     "MAX_ALLOWED_SIZE": 0,
     "EXTENSIONS": [],
     "TARGET_BLANK": "Y"
    },
    "EDIT_FORM_LABEL": null,
    "LIST_COLUMN_LABEL": null,
    "LIST_FILTER_LABEL": null,
    "ERROR_MESSAGE": null,
    "HELP_MESSAGE": null,
    "USER_TYPE": {
     "USER_TYPE_ID": "file",
     "CLASS_NAME": "Bitrix\\Main\\UserField\\Types\\FileType",
     "EDIT_CALLBACK": [
      "Bitrix\\Main\\UserField\\Types\\FileType",
      "renderEdit"
     ],
     "VIEW_CALLBACK": [
      "Bitrix\\Main\\UserField\\Types\\FileType",
      "renderView"
     ],
     "USE_FIELD_COMPONENT": true,
     "DESCRIPTION": "Файл",
     "BASE_TYPE": "file"
    },
    "VALUE": false,
    "ENTITY_VALUE_ID": 40,
    "CUSTOM_DATA": []
   },
   "UF_BLOG_POST_URL_PRV": {
    "ID": "5",
    "ENTITY_ID": "BLOG_POST",
    "FIELD_NAME": "UF_BLOG_POST_URL_PRV",
    "USER_TYPE_ID": "url_preview",
    "XML_ID": "UF_BLOG_POST_URL_PRV",
    "SORT": "100",
    "MULTIPLE": "N",
    "MANDATORY": "N",
    "SHOW_FILTER": "N",
    "SHOW_IN_LIST": "N",
    "EDIT_IN_LIST": "Y",
    "IS_SEARCHABLE": "Y",
    "SETTINGS": [],
    "EDIT_FORM_LABEL": null,
    "LIST_COLUMN_LABEL": null,
    "LIST_FILTER_LABEL": null,
    "ERROR_MESSAGE": null,
    "HELP_MESSAGE": null,
    "USER_TYPE": {
     "USER_TYPE_ID": "url_preview",
     "CLASS_NAME": "Bitrix\\Main\\UrlPreview\\UrlPreviewUserType",
     "DESCRIPTION": "Содержимое ссылки",
     "BASE_TYPE": "int"
    },
    "VALUE": null,
    "ENTITY_VALUE_ID": 40,
    "CUSTOM_DATA": []
   },
   "UF_GRATITUDE": {
    "ID": "9",
    "ENTITY_ID": "BLOG_POST",
    "FIELD_NAME": "UF_GRATITUDE",
    "USER_TYPE_ID": "integer",
    "XML_ID": "UF_GRATITUDE",
    "SORT": "100",
    "MULTIPLE": "N",
    "MANDATORY": "N",
    "SHOW_FILTER": "N",
    "SHOW_IN_LIST": "N",
    "EDIT_IN_LIST": "Y",
    "IS_SEARCHABLE": "N",
    "SETTINGS": {
     "SIZE": 20,
     "MIN_VALUE": 0,
     "MAX_VALUE": 0,
     "DEFAULT_VALUE": null
    },
    "EDIT_FORM_LABEL": null,
    "LIST_COLUMN_LABEL": null,
    "LIST_FILTER_LABEL": null,
    "ERROR_MESSAGE": null,
    "HELP_MESSAGE": null,
    "USER_TYPE": {
     "USER_TYPE_ID": "integer",
     "CLASS_NAME": "Bitrix\\Main\\UserField\\Types\\IntegerType",
     "EDIT_CALLBACK": [
      "Bitrix\\Main\\UserField\\Types\\IntegerType",
      "renderEdit"
     ],
     "VIEW_CALLBACK": [
      "Bitrix\\Main\\UserField\\Types\\IntegerType",
      "renderView"
     ],
     "USE_FIELD_COMPONENT": true,
     "DESCRIPTION": "Целое число",
     "BASE_TYPE": "int"
    },
    "VALUE": null,
    "ENTITY_VALUE_ID": 40,
    "CUSTOM_DATA": []
   },
   "UF_BLOG_POST_FILE": {
    "ID": "19",
    "ENTITY_ID": "BLOG_POST",
    "FIELD_NAME": "UF_BLOG_POST_FILE",
    "USER_TYPE_ID": "disk_file",
    "XML_ID": "UF_BLOG_POST_FILE",
    "SORT": "100",
    "MULTIPLE": "Y",
    "MANDATORY": "N",
    "SHOW_FILTER": "N",
    "SHOW_IN_LIST": "N",
    "EDIT_IN_LIST": "Y",
...
```
