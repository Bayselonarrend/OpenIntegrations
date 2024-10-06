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
  "ID": "12162",
  "NAME": "Новый каталог",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "12162",
  "PARENT_ID": "3",
  "DELETED_TYPE": "3",
  "CREATE_TIME": "2024-10-06T17:33:15+03:00",
  "UPDATE_TIME": "2024-10-06T17:33:19+03:00",
  "DELETE_TIME": "2024-10-06T17:33:20+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог"
 },
 "time": {
  "start": 1728225200.1151,
  "finish": 1728225200.14606,
  "duration": 0.03096604347229,
  "processing": 0.00552797317504883,
  "date_start": "2024-10-06T17:33:20+03:00",
  "date_finish": "2024-10-06T17:33:20+03:00",
  "operating_reset_at": 1728225800,
  "operating": 0
 }
}
```
