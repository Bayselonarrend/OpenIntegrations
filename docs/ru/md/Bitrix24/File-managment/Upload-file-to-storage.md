---
sidebar_position: 1
---

# Загрузить файл в хранилище
 Загружает файл в выбранное хранилище



`Функция ЗагрузитьФайлВХранилище(Знач URL, Знач Наименование, Знач Файл, Знач IDХранилища, Знач Доступы = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Наименование | --title | Строка | Наименование файла с расширением для сохранения |
  | Файл | --file | Строка, ДвоичныеДанные | Файл для загрузки |
  | IDХранилища | --storageid | Строка | Идентификатор хранилища для загрузки |
  | Доступы | --rights | Строка | Массив доступов по задачам, если необходимо |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.storage.uploadfile](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_uploadfile.php)
:::
<br/>


```bsl title="Пример кода"
  Наименование2  = "Картинка2.jpg";
  Наименование   = "Картинка1.jpg";
  
  Картинка2 = "https://openintegrations.dev/test_data/picture.jpg";  // Локальный путь, URL или Двоичные данные
  Картинка  = "https://openintegrations.dev/test_data/picture2.jpg"; // Локальный путь, URL или Двоичные данные
  
  IDПриемника = 3;
  
  URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.ЗагрузитьФайлВХранилище(URL, Наименование2, Картинка2, IDПриемника);
  
  
  
  URL   = "b24-ar17wx.bitrix24.by";
  Токен = "adf89366006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ЗагрузитьФайлВХранилище(URL, Наименование, Картинка, IDПриемника, , Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ЗагрузитьФайлВХранилище --url "b24-ar17wx.bitrix24.by" --title %title% --file %file% --storageid %storageid% --rights %rights% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": 356,
  "NAME": "26417397-8431-4343-9c0f-a40d4a2831c8.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 404,
  "SIZE": "26",
  "CREATE_TIME": "2024-06-19T07:58:50+00:00",
  "UPDATE_TIME": "2024-06-19T07:58:50+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=0a9d7266006e9f06006b12e40000000100000702aaae0c0e99153466d165ecfa4a92ce&token=disk%7CaWQ9MzU2Jl89TEZ6d3JtUDdUdVg0dXJ3Q2pZYTExTlhPTmh1czI3V1k%3D%7CImRvd25sb2FkfGRpc2t8YVdROU16VTJKbDg5VEVaNmQzSnRVRGRVZFZnMGRYSjNRMnBaWVRFeFRsaFBUbWgxY3pJM1Yxaz18MGE5ZDcyNjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDcwMmFhYWUwYzBlOTkxNTM0NjZkMTY1ZWNmYTRhOTJjZSI%3D.ng9IaX1mYX7R%2B4yWP67P6j9%2BWvh78aG47IO0Ex6UVQ8%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/26417397-8431-4343-9c0f-a40d4a2831c8.jpg"
 },
 "time": {
  "start": 1718783929.8197,
  "finish": 1718783930.09911,
  "duration": 0.279407024383545,
  "processing": 0.227760076522827,
  "date_start": "2024-06-19T07:58:49+00:00",
  "date_finish": "2024-06-19T07:58:50+00:00",
  "operating_reset_at": 1718784529,
  "operating": 0.227726936340332
 }
}
```
