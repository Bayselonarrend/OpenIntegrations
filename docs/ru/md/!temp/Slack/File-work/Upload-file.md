---
sidebar_position: 2
---

# Загрузить файл
 Загружает файл на сервера Slack


*Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач ИмяФайла, Знач Заголовок, Знач Канал = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Файл | --file | Строка,ДвоичныеДанные | Файл для загрузки |
  | ИмяФайла | --filename | Строка | Имя файла с расширением |
  | Заголовок | --title | Строка | Имя файла в Slack |
  | Канал | --channel | Строка | ID канала |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

```bsl title="Пример кода"
	
  
  ИмяФайла  = "megadoc.docx";
  Файл      = Новый ДовичныеДанные("D:\" + ИмяФайла);
  Заголовок = "Новый файл";
  Канал     = "C123456";
  
  Ответ = OPI_Slack.ЗагрузитьФайл(Токен, Файл, ИмяФайла, Заголовок, Канал); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);//JSON строка
  

	
```

```sh title="Пример команд CLI"
    
  oint slack ЗагрузитьФайл --token %token% --file %file% --filename %filename% --title %title% --channel %channel%

```


```json title="Результат"

{
  "ok": true,
  "files": [
  {
  "id": "F070SS4UHNZ",
  "created": 1714146549,
  "timestamp": 1714146549,
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
  "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F070SS4UHNZ/megadoc.docx",
  "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F070SS4UHNZ/download/megadoc.docx",
  "media_display_type": "unknown",
  "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F070SS4UHNZ/megadoc.docx",
  "permalink_public": "https://slack-files.com/T06UD92BS3C-F070SS4UHNZ-e68bef4a91",
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
