---
sidebar_position: 22
---

# Поместить файл в корзину
 Перемещает файл в корзину удаляемых файлов


<br/>


`Функция ПоместитьФайлВКорзину(Знач URL, Знач IDФайла, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | Идентификатор файла |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>




```bsl title="Пример кода"
URL     = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDФайла = "2484";
  
  Результат  = OPI_Bitrix24.ПоместитьФайлВКорзину(URL, IDФайла);
  
  
  URL         = "b24-ar17wx.bitrix24.by";
  Токен       = "56898d66006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ПоместитьФайлВКорзину(URL, IDФайла, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПоместитьФайлВКорзину --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

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
  "DELETED_TYPE": "3",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "1134",
  "SIZE": "805189",
  "CREATE_TIME": "2024-07-03T14:42:28+00:00",
  "UPDATE_TIME": "2024-07-03T14:42:28+00:00",
  "DELETE_TIME": "2024-07-03T14:42:34+00:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPXNheWNTOWFZRVJuejdMOXhCSlhnbDZxbW4xVU05M1lK%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFhOaGVXTlRPV0ZaUlZKdWVqZE1PWGhDU2xobmJEWnhiVzR4VlUwNU0xbEt8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.H4kGiTtgZ%2BN0wWDCX0lKHQmfO9hOfINESfK6VVd1UJo%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpgi17200177547139i"
 },
 "time": {
  "start": 1720017755.36075,
  "finish": 1720017755.40426,
  "duration": 0.0435140132904053,
  "processing": 0.0109550952911377,
  "date_start": "2024-07-03T14:42:35+00:00",
  "date_finish": "2024-07-03T14:42:35+00:00",
  "operating_reset_at": 1720018355,
  "operating": 0
 }
}
```
