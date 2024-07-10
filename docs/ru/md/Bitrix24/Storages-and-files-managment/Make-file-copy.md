---
sidebar_position: 24
---

# Скопировать файл
 Копирует файл из одного расположения в другое


<br/>


`Функция СкопироватьФайл(Знач URL, Знач IDФайла, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | ID файла для копирования |
  | IDКаталога | --folderid | Строка, Число | ID каталога размещения копии |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24





```bsl title="Пример кода"
  IDКаталога = "2488";
  IDФайла    = "2484";
  
  URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.СкопироватьФайл(URL, IDФайла, IDКаталога);
  
  
  IDКаталога = "2490";
  
  URL   = "b24-ar17wx.bitrix24.by";
  Токен = "56898d66006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.СкопироватьФайл(URL, IDФайла, IDКаталога, Токен);
  
  Проверка_БитриксФайл(Результат);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 СкопироватьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
    {
 "result": {
  "ID": 1744,
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "1722",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 1146,
  "SIZE": "805189",
  "CREATE_TIME": "2024-07-03T14:42:54+00:00",
  "UPDATE_TIME": "2024-07-03T14:42:54+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTc0NCZfPWphdFBTRXpUdHI2anZKbDNxMDBwVTdRRVZ4aDdGVTMy%7CImRvd25sb2FkfGRpc2t8YVdROU1UYzBOQ1pmUFdwaGRGQlRSWHBVZEhJMmFuWktiRE54TURCd1ZUZFJSVlo0YURkR1ZUTXl8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.uOKd1v3hEnu7vsep0NhRk3RzXtyT21DBrrwPl3DxLG8%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новое имя файла.jpg"
 },
 "time": {
  "start": 1720017774.37632,
  "finish": 1720017774.44715,
  "duration": 0.07082200050354,
  "processing": 0.0407531261444092,
  "date_start": "2024-07-03T14:42:54+00:00",
  "date_finish": "2024-07-03T14:42:54+00:00",
  "operating_reset_at": 1720018374,
  "operating": 0
 }
}
```
