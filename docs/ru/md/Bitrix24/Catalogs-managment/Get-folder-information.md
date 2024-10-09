---
sidebar_position: 1
---

# Получить информацию о каталоге
 Получает информацию о каталоге



`Функция ПолучитьИнформациюОКаталоге(Знач URL, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDКаталога | --folderid | Строка, Число | Идентификатор каталога |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.folder.get](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_get.php)
:::
<br/>


```bsl title="Пример кода"
    URL        = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDКаталога = "10842";

    Результат  = OPI_Bitrix24.ПолучитьИнформациюОКаталоге(URL, IDКаталога);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьИнформациюОКаталоге(URL, IDКаталога, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьИнформациюОКаталоге --url "b24-ar17wx.bitrix24.by" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "12462",
  "NAME": "Новый каталог",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "12462",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "CREATE_TIME": "2024-10-08T20:49:28+03:00",
  "UPDATE_TIME": "2024-10-08T20:49:28+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог"
 },
 "time": {
  "start": 1728409769.15226,
  "finish": 1728409769.18372,
  "duration": 0.0314629077911377,
  "processing": 0.00575494766235352,
  "date_start": "2024-10-08T20:49:29+03:00",
  "date_finish": "2024-10-08T20:49:29+03:00",
  "operating_reset_at": 1728410369,
  "operating": 0
 }
}
```
