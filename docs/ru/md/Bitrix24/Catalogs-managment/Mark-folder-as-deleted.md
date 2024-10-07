---
sidebar_position: 8
---

# Поместить каталог в корзину
 Перемещает каталог в корзину удаляемых файлов



`Функция ПоместитьКаталогВКорзину(Знач URL, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDКаталога | --folderid | Строка, Число | Идентификатор каталога |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.folder.markdeleted](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_markdeleted.php)
:::
<br/>


```bsl title="Пример кода"
    URL           = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDКаталога    = "10842";

    Результат  = OPI_Bitrix24.ПоместитьКаталогВКорзину(URL, IDКаталога);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПоместитьКаталогВКорзину(URL, IDКаталога, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПоместитьКаталогВКорзину --url "b24-ar17wx.bitrix24.by" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "12342",
  "NAME": "Новый каталог",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "12342",
  "PARENT_ID": "3",
  "DELETED_TYPE": "3",
  "CREATE_TIME": "2024-10-07T21:46:46+03:00",
  "UPDATE_TIME": "2024-10-07T21:46:50+03:00",
  "DELETE_TIME": "2024-10-07T21:46:51+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог"
 },
 "time": {
  "start": 1728326811.1974,
  "finish": 1728326811.23435,
  "duration": 0.0369529724121094,
  "processing": 0.00621891021728516,
  "date_start": "2024-10-07T21:46:51+03:00",
  "date_finish": "2024-10-07T21:46:51+03:00",
  "operating_reset_at": 1728327411,
  "operating": 0
 }
}
```
