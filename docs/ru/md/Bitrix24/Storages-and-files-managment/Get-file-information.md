---
sidebar_position: 20
---

# Получить информацию о файле
 Получает информацию о файле по ID


<br/>


`Функция ПолучитьИнформациюОФайле(Знач URL, Знач IDФайла, Знач Токен = "") Экспорт`

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
  
  Результат  = OPI_Bitrix24.ПолучитьИнформациюОФайле(URL, IDФайла);
  
  
  URL         = "b24-ar17wx.bitrix24.by";
  Токен       = "56898d66006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ПолучитьИнформациюОФайле(URL, IDФайла, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьИнформациюОФайле --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "1716",
  "NAME": "Картинка1.jpg",
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
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPXJDbEFhcE51RG5ZZ0hwUVhJbXhybGRpUzhjbG82SHFO%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFhKRGJFRmhjRTUxUkc1WlowaHdVVmhKYlhoeWJHUnBVemhqYkc4MlNIRk98ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.h344gCFe%2FeGei7hNDt%2FfG%2FqauSX2zpt%2BnX3KnR66llA%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка1.jpg"
 },
 "time": {
  "start": 1720017751.37945,
  "finish": 1720017751.42512,
  "duration": 0.0456681251525879,
  "processing": 0.0131018161773682,
  "date_start": "2024-07-03T14:42:31+00:00",
  "date_finish": "2024-07-03T14:42:31+00:00",
  "operating_reset_at": 1720018351,
  "operating": 0
 }
}
```
