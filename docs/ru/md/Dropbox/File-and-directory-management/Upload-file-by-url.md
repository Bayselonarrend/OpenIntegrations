---
sidebar_position: 5
---

# Загрузить файл по URL
 Загружает файл на облачный диск, получая его по указанному URL



`Функция ЗагрузитьФайлПоURL(Знач Токен, Знач URLФайла, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URLФайла | --url | Строка | URL источник файла |
  | Путь | --path | Строка | Путь сохранения на Dropbox |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Путь  = "/New/url_doc.docx";
    Токен = "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ...";
    URL   = "https://openintegrations.dev/test_data/document.docx";

    Результат = OPI_Dropbox.ЗагрузитьФайлПоURL(Токен, URL, Путь);
```



```sh title="Пример команды CLI"
    
  oint dropbox ЗагрузитьФайлПоURL --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --url %url% --path %path%

```

```json title="Результат"
    {
 ".tag": "async_job_id",
 "async_job_id": "41d0vPCn2mYAAAAAAAAAAQ"
}

```
