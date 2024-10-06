---
sidebar_position: 7
---

# Восстановить файл
 Восстанавливает файл из корзины



`Функция ВосстановитьФайл(Знач URL, Знач IDФайла, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | Идентификатор файла |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.restore](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_restore.php)
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDФайла = "10836";

    Результат  = OPI_Bitrix24.ВосстановитьФайл(URL, IDФайла);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ВосстановитьФайл(URL, IDФайла, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ВосстановитьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "12156",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8386",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-06T17:32:53+03:00",
  "UPDATE_TIME": "2024-10-06T17:33:14+03:00",
  "DELETE_TIME": "2024-10-06T17:33:14+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=76ad0267006e9f06006b12e400000001000007b25673cab9bbfe352545eeb9a0d9a9fe&token=disk%7CaWQ9MTIxNTYmXz1rV3Vwem1lamtHZ0Q5cFcwMjBsOTVoTnEyOWkwUW01MA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXhOVFltWHoxclYzVndlbTFsYW10SFowUTVjRmN3TWpCc09UVm9UbkV5T1drd1VXMDFNQT09fDc2YWQwMjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YjI1NjczY2FiOWJiZmUzNTI1NDVlZWI5YTBkOWE5ZmUi.1Owxi0Han4d4xenpkLxbH%2F1JpFTosLg6liDiTxlm%2Bq0%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728225195.03033,
  "finish": 1728225195.0611,
  "duration": 0.0307731628417969,
  "processing": 0.00598597526550293,
  "date_start": "2024-10-06T17:33:15+03:00",
  "date_finish": "2024-10-06T17:33:15+03:00",
  "operating_reset_at": 1728225795,
  "operating": 0
 }
}
```
