---
sidebar_position: 6
---

# Поместить файл в корзину
 Перемещает файл в корзину удаляемых файлов



`Функция ПоместитьФайлВКорзину(Знач URL, Знач IDФайла, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | Идентификатор файла |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.markdeleted](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_markdeleted.php)
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDФайла = "10836";

    Результат  = OPI_Bitrix24.ПоместитьФайлВКорзину(URL, IDФайла);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПоместитьФайлВКорзину(URL, IDФайла, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПоместитьФайлВКорзину --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "12216",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "3",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8426",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T09:26:32+03:00",
  "UPDATE_TIME": "2024-10-07T09:26:32+03:00",
  "DELETE_TIME": "2024-10-07T09:26:53+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9&token=disk%7CaWQ9MTIyMTYmXz1rWnU0c0tWMlJGeWljbnZBVmRYOG50ckk5ZkJoZUVzZw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlNVFltWHoxclduVTBjMHRXTWxKR2VXbGpiblpCVm1SWU9HNTBja2s1WmtKb1pVVnpadz09fGYwOGMwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3Mjg1OGU4MGFlOTVmYTc3Y2FkZDhlZTM0ZThiYmI3Yzki.KyahGP7GfxgjTldWXlBY9VV7fUMmT35tWggJ8YQjmFE%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpgi17282824135518i"
 },
 "time": {
  "start": 1728282413.63558,
  "finish": 1728282413.66668,
  "duration": 0.0311028957366943,
  "processing": 0.00577783584594726,
  "date_start": "2024-10-07T09:26:53+03:00",
  "date_finish": "2024-10-07T09:26:53+03:00",
  "operating_reset_at": 1728283013,
  "operating": 0
 }
}
```
