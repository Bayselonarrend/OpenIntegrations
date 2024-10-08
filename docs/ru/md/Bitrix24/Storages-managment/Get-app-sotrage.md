﻿---
sidebar_position: 2
---

# Получить хранилище приложения
 Получает информацию о хранилище с которым может работать приложение для хранения своих данных



`Функция ПолучитьХранилищеПриложения(Знач URL, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.storage.getforapp](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getforapp.php)
:::
<br/>


```bsl title="Пример кода"
    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьХранилищеПриложения(URL, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьХранилищеПриложения --url "b24-ar17wx.bitrix24.by" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "18",
  "NAME": "New storage name",
  "CODE": null,
  "MODULE_ID": "disk",
  "ENTITY_TYPE": "restapp",
  "ENTITY_ID": "2",
  "ROOT_OBJECT_ID": "464"
 },
 "time": {
  "start": 1728409743.54306,
  "finish": 1728409743.5729,
  "duration": 0.0298421382904053,
  "processing": 0.00386214256286621,
  "date_start": "2024-10-08T20:49:03+03:00",
  "date_finish": "2024-10-08T20:49:03+03:00",
  "operating_reset_at": 1728410343,
  "operating": 0
 }
}
```
