---
sidebar_position: 3
---

# Получить информацию о файле
 Получает информацию о файле по ID



`Функция ПолучитьИнформациюОФайле(Знач URL, Знач IDФайла, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | Идентификатор файла |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.get](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_get.php)
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDФайла = "10836";

    Результат  = OPI_Bitrix24.ПолучитьИнформациюОФайле(URL, IDФайла);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьИнформациюОФайле(URL, IDФайла, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьИнформациюОФайле --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "12336",
  "NAME": "Картинка1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8506",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T21:46:24+03:00",
  "UPDATE_TIME": "2024-10-07T21:46:24+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=623a0467006e9f06006b12e400000001000007bd6d86696f59ebb8fa58416ef6f1859c&token=disk%7CaWQ9MTIzMzYmXz1DRGR1cWg3RTJiZTJRb1M1U2tDTlpQcnJxdDdqWkE4Yw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpNelltWHoxRFJHUjFjV2czUlRKaVpUSlJiMU0xVTJ0RFRscFFjbkp4ZERkcVdrRTRZdz09fDYyM2EwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YmQ2ZDg2Njk2ZjU5ZWJiOGZhNTg0MTZlZjZmMTg1OWMi.UJMb5DdYuBaacYS3pxa358eLo1%2FiCuzYZsntRmbx9ok%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка1.jpg"
 },
 "time": {
  "start": 1728326785.11248,
  "finish": 1728326785.14426,
  "duration": 0.0317850112915039,
  "processing": 0.00769996643066406,
  "date_start": "2024-10-07T21:46:25+03:00",
  "date_finish": "2024-10-07T21:46:25+03:00",
  "operating_reset_at": 1728327385,
  "operating": 0
 }
}
```
