---
sidebar_position: 9
---

# Восстановить каталог
 Восстанавливает каталог из корзины



`Функция ВосстановитьКаталог(Знач URL, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDКаталога | --folderid | Строка, Число | Идентификатор каталога |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.folder.restore](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_restore.php)
:::
<br/>


```bsl title="Пример кода"
    URL        = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    IDКаталога = "5016";

    Результат  = OPI_Bitrix24.ВосстановитьКаталог(URL, IDКаталога);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "fe3fa966006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ВосстановитьКаталог(URL, IDКаталога, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ВосстановитьКаталог --url "b24-ar17wx.bitrix24.by" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
    {
 "result": {
  "ID": "936",
  "NAME": "Новый каталог",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "936",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "CREATE_TIME": "2024-07-01T13:44:01+00:00",
  "UPDATE_TIME": "2024-07-01T13:44:13+00:00",
  "DELETE_TIME": "2024-07-01T13:44:12+00:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог"
 },
 "time": {
  "start": 1719841454.36238,
  "finish": 1719841454.40451,
  "duration": 0.0421350002288818,
  "processing": 0.00979709625244141,
  "date_start": "2024-07-01T13:44:14+00:00",
  "date_finish": "2024-07-01T13:44:14+00:00",
  "operating_reset_at": 1719842054,
  "operating": 0
 }
}

```
