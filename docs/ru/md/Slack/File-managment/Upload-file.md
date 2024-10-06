---
sidebar_position: 2
---

# Загрузить файл
 Загружает файл на сервера Slack



`Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач ИмяФайла, Знач Заголовок, Знач Канал = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Файл | --file | Строка,ДвоичныеДанные | Файл для загрузки |
  | ИмяФайла | --filename | Строка | Имя файла с расширением |
  | Заголовок | --title | Строка | Имя файла в Slack |
  | Канал | --channel | Строка | ID канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен = "xoxb-6965308400114-696804637...";
    Канал = "C06UFNUTKUL";
    Файл  = "https://openyellow.neocities.org/test_data/document.docx"; // URL, Двоичные данные или Путь к файлу

    ИмяФайла     = "megadoc.docx";
    Заголовок    = "Новый файл";

    Результат = OPI_Slack.ЗагрузитьФайл(Токен, Файл, ИмяФайла, Заголовок);

    Результат = OPI_Slack.ЗагрузитьФайл(Токен, Файл, ИмяФайла, Заголовок, Канал);
```



```sh title="Пример команды CLI"
    
  oint slack ЗагрузитьФайл --token %token% --file %file% --filename "megadoc.docx" --title %title% --channel "C123456"

```

```json title="Результат"
{
 "ok": true,
 "files": [
  {
   "id": "F07QZ7A0EKB",
   "created": 1728224910,
   "timestamp": 1728224910,
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
   "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F07QZ7A0EKB/megadoc.docx",
   "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F07QZ7A0EKB/download/megadoc.docx",
   "media_display_type": "unknown",
   "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F07QZ7A0EKB/megadoc.docx",
   "permalink_public": "https://slack-files.com/T06UD92BS3C-F07QZ7A0EKB-3060b39549",
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
