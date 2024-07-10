---
sidebar_position: 26
---

# Переименовать файл
 Изменяет имя существующего файла


<br/>


`Функция ПереименоватьФайл(Знач URL, Знач IDФайла, Знач Наименование, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | Идентификатор файла |
  | Наименование | --title | Строка | Новое наименование каталога |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>




```bsl title="Пример кода"
  Наименование  = "Новое имя файла.jpg";
  Наименование2 = "Новое имя файла 2.jpg";
  
  IDФайла2  = "2482";
  URL       = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.ПереименоватьФайл(URL, IDФайла2, Наименование2);
  
  
  IDФайла  = "2484";
  URL      = "b24-ar17wx.bitrix24.by";
  Токен    = "56898d66006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ПереименоватьФайл(URL, IDФайла, Наименование, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПереименоватьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --title %title% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
    {
 "result": {
  "ID": "1716",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "1134",
  "SIZE": "805189",
  "CREATE_TIME": "2024-07-03T14:42:28+00:00",
  "UPDATE_TIME": "2024-07-03T14:42:28+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPWh4MGZDaVNISklmakNDZ2VDQnBGQ25oaWhnUzRVaVNG%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFdoNE1HWkRhVk5JU2tsbWFrTkRaMlZEUW5CR1EyNW9hV2huVXpSVmFWTkd8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.I5xOjqhubMfxDzA0AHzUE5AzgUeXOOmA4%2FsEKdiUSyQ%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpg"
 },
 "time": {
  "start": 1720017754.0472,
  "finish": 1720017754.09402,
  "duration": 0.0468170642852783,
  "processing": 0.0171689987182617,
  "date_start": "2024-07-03T14:42:34+00:00",
  "date_finish": "2024-07-03T14:42:34+00:00",
  "operating_reset_at": 1720018354,
  "operating": 0
 }
}
```
