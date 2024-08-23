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
    IDФайла = "6874";

    Результат  = OPI_Bitrix24.ВосстановитьФайл(URL, IDФайла);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "6476c766006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ВосстановитьФайл(URL, IDФайла, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ВосстановитьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

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
  "UPDATE_TIME": "2024-07-03T14:42:36+00:00",
  "DELETE_TIME": "2024-07-03T14:42:34+00:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPWs2c1VzV3l4ZkVmRG5PY1JYSGdibHNxZzJ1S2pGbDNC%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFdzMmMxVnpWM2w0WmtWbVJHNVBZMUpZU0dkaWJITnhaekoxUzJwR2JETkN8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.iv0WpvLa68S5kviQk96g9dRPVonwvrxN7T6AunrAW9s%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpg"
 },
 "time": {
  "start": 1720017756.65038,
  "finish": 1720017756.69349,
  "duration": 0.0431070327758789,
  "processing": 0.0107128620147705,
  "date_start": "2024-07-03T14:42:36+00:00",
  "date_finish": "2024-07-03T14:42:36+00:00",
  "operating_reset_at": 1720018356,
  "operating": 0
 }
}
```
