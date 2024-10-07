---
sidebar_position: 5
---

# Получить содержимое хранилища
 Получает список файлов и каталогов, находящихся в корне хранилища



`Функция ПолучитьСодержимоеХранилища(Знач URL, Знач IDХранилища, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDХранилища | --storageid | Строка, Число | Идентификатор хранилища |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.storage.getchildren](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getchildren.php)
:::
<br/>


```bsl title="Пример кода"
    URL         = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDХранилища = 3;

    Результат   = OPI_Bitrix24.ПолучитьСодержимоеХранилища(URL, IDХранилища);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСодержимоеХранилища(URL, IDХранилища, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСодержимоеХранилища --url "b24-ar17wx.bitrix24.by" --storageid %storageid% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": [
  {
   "ID": "12214",
   "NAME": "Картинка2.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8424",
   "SIZE": "2114023",
   "CREATE_TIME": "2024-10-07T09:26:31+03:00",
   "UPDATE_TIME": "2024-10-07T09:26:31+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9&token=disk%7CaWQ9MTIyMTQmXz1na0c5Y3p5NzBmSEZkZUR6UnV5WWRmNjd1QmltRVZLSQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlNVFFtWHoxbmEwYzVZM3A1TnpCbVNFWmtaVVI2VW5WNVdXUm1OamQxUW1sdFJWWkxTUT09fGYwOGMwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3Mjg1OGU4MGFlOTVmYTc3Y2FkZDhlZTM0ZThiYmI3Yzki.ezovAqJ2Y2lPWTMP0MlbnXCpwjE1OO4wOLm8IV6Hwm4%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка2.jpg"
  },
  {
   "ID": "12216",
   "NAME": "Картинка1.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8426",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-07T09:26:32+03:00",
   "UPDATE_TIME": "2024-10-07T09:26:32+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9&token=disk%7CaWQ9MTIyMTYmXz1TZ3pBNDI3WFlwN2xkRjg3NzVTYTNqZkdjNjlpQVUwcg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlNVFltWHoxVFozcEJOREkzV0Zsd04yeGtSamczTnpWVFlUTnFaa2RqTmpscFFWVXdjZz09fGYwOGMwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3Mjg1OGU4MGFlOTVmYTc3Y2FkZDhlZTM0ZThiYmI3Yzki.6XUow70tZR%2Fnvgg4crC9G37SRPKecU%2FygtwRJ3qMX%2Bs%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка1.jpg"
  }
 ],
 "total": 2,
 "time": {
  "start": 1728282392.8799,
  "finish": 1728282392.91448,
  "duration": 0.0345821380615234,
  "processing": 0.00735712051391602,
  "date_start": "2024-10-07T09:26:32+03:00",
  "date_finish": "2024-10-07T09:26:32+03:00",
  "operating_reset_at": 1728282992,
  "operating": 0
 }
}
```
