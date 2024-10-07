---
sidebar_position: 5
---

# Сделать файл публичным
 Создает публичный URL для файла. Требует токен пользователя



`Функция СделатьФайлПубличным(Знач Токен, Знач ИдентификаторФайла) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен пользователя |
  | ИдентификаторФайла | --fileid | Строка | Идентификатор файла |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен              = "xoxb-6965308400114-696804637...";
    ИдентификаторФайла = "F07QLU2LLTW";

    Результат = OPI_Slack.СделатьФайлПубличным(Токен, ИдентификаторФайла);
```



```sh title="Пример команды CLI"
    
  oint slack СделатьФайлПубличным --token %token% --fileid %fileid%

```

```json title="Результат"
{
 "ok": true,
 "files": [
  {
   "id": "F07QQ3H2BC3",
   "created": 1728306080,
   "timestamp": 1728306080,
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
   "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F07QQ3H2BC3/megadoc.docx",
   "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F07QQ3H2BC3/download/megadoc.docx",
   "media_display_type": "unknown",
   "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F07QQ3H2BC3/megadoc.docx",
   "permalink_public": "https://slack-files.com/T06UD92BS3C-F07QQ3H2BC3-244e5d8ff0",
   "comments_count": 0,
   "is_starred": false,
   "shares": {},
   "channels": [],
   "groups": [],
   "ims": [],
   "has_more_shares": false,
   "has_rich_preview": false,
   "file_access": "visible"
  }
 ]
}
```
