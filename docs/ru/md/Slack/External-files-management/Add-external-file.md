---
sidebar_position: 3
---

# Добавить внешний файл
 Добавляет новый внешний файл



`Функция ДобавитьВнешнийФайл(Знач Токен, Знач URL, Знач Заголовок) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | URL | --url | Строка | URL к внешнему файлу |
  | Заголовок | --title | Строка | Заголовок файла для Slack |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен     = "xoxb-6965308400114-696804637...";
    Заголовок = "Новый файл";
    Файл      = "https://api.athenaeum.digital/test_data/document.docx"; // URL, Двоичные данные или Путь к файлу

    Результат = OPI_Slack.ДобавитьВнешнийФайл(Токен, Файл, Заголовок);
```



```sh title="Пример команды CLI"
    
  oint slack ДобавитьВнешнийФайл --token %token% --url "https://opi.neocities.org/test_data/document.docx" --title %title%

```

```json title="Результат"
{
 "ok": true,
 "file": {
  "id": "F07QYQS8ED8",
  "created": 1728409471,
  "timestamp": 1728409471,
  "name": "Novyj_fajl",
  "title": "Новый файл",
  "mimetype": "application/vnd.slack-remote",
  "filetype": "remote",
  "pretty_type": "Remote",
  "user": "U06UG1CAYH2",
  "user_team": "T06UD92BS3C",
  "editable": false,
  "size": 0,
  "mode": "external",
  "is_external": true,
  "external_type": "app",
  "is_public": false,
  "public_url_shared": false,
  "display_as_bot": false,
  "username": "",
  "url_private": "https://slack.com/api/files.remote.add",
  "media_display_type": "unknown",
  "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F07QYQS8ED8/novyj_fajl",
  "comments_count": 0,
  "is_starred": false,
  "shares": {},
  "channels": [],
  "groups": [],
  "ims": [],
  "has_more_shares": false,
  "external_id": "fe8bd555-b96a-44f3-8cc6-12e63a841cb7",
  "external_url": "https://slack.com/api/files.remote.add",
  "has_rich_preview": false,
  "file_access": "visible"
 }
}
```
