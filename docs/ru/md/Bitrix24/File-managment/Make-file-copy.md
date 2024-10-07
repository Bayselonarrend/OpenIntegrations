---
sidebar_position: 8
---

# Скопировать файл
 Копирует файл из одного расположения в другое



`Функция СкопироватьФайл(Знач URL, Знач IDФайла, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | ID файла для копирования |
  | IDКаталога | --folderid | Строка, Число | ID каталога размещения копии |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.copyto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_copyto.php)
:::
<br/>


```bsl title="Пример кода"
    IDКаталога = "10840";
    IDФайла    = "10836";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.СкопироватьФайл(URL, IDФайла, IDКаталога);

    IDКаталога = "10842";

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.СкопироватьФайл(URL, IDФайла, IDКаталога, Токен);

    OPI_ПолучениеДанныхТестов.Проверка_БитриксОбъект(Результат);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 СкопироватьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": 12244,
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12222",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8438,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T09:26:59+03:00",
  "UPDATE_TIME": "2024-10-07T09:26:59+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9&token=disk%7CaWQ9MTIyNDQmXz1weGNqRGJmSG5TYzVKNWg0S2JpRVJqODMwdTNGZFdJZA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlORFFtWHoxd2VHTnFSR0ptU0c1VFl6VktOV2cwUzJKcFJWSnFPRE13ZFROR1pGZEpaQT09fGYwOGMwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3Mjg1OGU4MGFlOTVmYTc3Y2FkZDhlZTM0ZThiYmI3Yzki.VufaSt4PdSicdAX3edADlpM63Nb2Z5JyHJWxqhgXmPE%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728282419.08357,
  "finish": 1728282419.18759,
  "duration": 0.104016780853271,
  "processing": 0.069019079208374,
  "date_start": "2024-10-07T09:26:59+03:00",
  "date_finish": "2024-10-07T09:26:59+03:00",
  "operating_reset_at": 1728283019,
  "operating": 0
 }
}
```
