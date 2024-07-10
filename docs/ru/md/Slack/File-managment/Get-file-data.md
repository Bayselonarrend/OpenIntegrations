---
sidebar_position: 3
---

# Получить данные файла
 Получает информацию о файле


<br/>


`Функция ПолучитьДанныеФайла(Знач Токен, Знач ИдентификаторФайла) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | ИдентификаторФайла | --fileid | Строка | Идентификатор файла |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
  
  ИдентификаторФайла = "F070VL6FQFM";
  
  Ответ = OPI_Slack.ПолучитьДанныеФайла(Токен, ИдентификаторФайла); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                       //JSON строка
  
```
	


```sh title="Пример команды CLI"
    
  oint slack ПолучитьДанныеФайла --token %token% --fileid "F070VL6FQFM"

```

```json title="Результат"
  {
  "ok": true,
  "file": {
  "id": "F070VL6FQFM",
  "created": 1714146550,
  "timestamp": 1714146550,
  "name": "megadoc.docx",
  "title": "Новый файл",
  "mimetype": "",
  "filetype": "",
  "pretty_type": "",
  "user": "U06UG1CAYH2",
  "user_team": "T06UD92BS3C",
  "editable": false,
  "size": 24069,
  "mode": "hosted",
  "is_external": false,
  "external_type": "",
  "is_public": false,
  "public_url_shared": false,
  "display_as_bot": false,
  "username": "",
  "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F070VL6FQFM/megadoc.docx",
  "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F070VL6FQFM/download/megadoc.docx",
  "media_display_type": "unknown",
  "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F070VL6FQFM/megadoc.docx",
  "permalink_public": "https://slack-files.com/T06UD92BS3C-F070VL6FQFM-9fb2618d36",
  "is_starred": false,
  "shares": {},
  "channels": [],
  "groups": [],
  "ims": [],
  "has_more_shares": false,
  "has_rich_preview": false,
  "file_access": "visible",
  "comments_count": 0
  },
  "comments": [],
  "response_metadata": {
  "next_cursor": ""
  }
  }
```
