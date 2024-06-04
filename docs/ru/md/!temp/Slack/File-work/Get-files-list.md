---
sidebar_position: 1
---

# Получить список файлов
 Получает список файлов бота или канала


*Функция ПолучитьСписокФайлов(Знач Токен, Знач Канал = "", Знач НомерСтраницы = 1) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | Канал для отбора |
  | НомерСтраницы | --page | Число, Строка | Номер страницы |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

```bsl title="Пример кода"
	
  
  НомерСтраницы = 1;
  Канал         = "C123456";
  
  Ответ = OPI_Slack.ПолучитьСписокФайлов(Токен, Канал, НомерСтраницы); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                          //JSON строка
  

	
```

```sh title="Пример команд CLI"
    
  oint slack ПолучитьСписокФайлов --token %token% --channel %channel% --page %page%

```


```json title="Результат"

{
  "ok": true,
  "files": [
  {
  "id": "F070V4U7Y4R",
  "created": 1713978714,
  "timestamp": 1713978714,
  "name": "megadoc.docx",
  "title": "Новый файл",
  "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  "filetype": "docx",
  "pretty_type": "Word Document",
  "user": "U06UG1CAYH2",
  "user_team": "T06UD92BS3C",
  "editable": false,
  "size": 24069,
  "mode": "hosted",
  "is_external": false,
  "external_type": "",
  "is_public": true,
  "public_url_shared": false,
  "display_as_bot": false,
  "username": "",
  "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F070V4U7Y4R/megadoc.docx",
  "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F070V4U7Y4R/download/megadoc.docx",
  "media_display_type": "unknown",
  "converted_pdf": "https://files.slack.com/files-tmb/T06UD92BS3C-F070V4U7Y4R-417b34221e/megadoc_converted.pdf",
  "thumb_pdf": "https://files.slack.com/files-tmb/T06UD92BS3C-F070V4U7Y4R-417b34221e/megadoc_thumb_pdf.png",
  "thumb_pdf_w": 909,
  "thumb_pdf_h": 1286,
  "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F070V4U7Y4R/megadoc.docx",
  "channels": [
  "C06UFNUTKUL"
  ],
  "groups": [],
  "ims": [],
  "comments_count": 0
  }
  ]
  }

```
