---
sidebar_position: 1
---

# Получить список хранилищ
 Получает список доступных хранилищ файлов



`Функция ПолучитьСписокХранилищ(Знач URL, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.storage.getlist](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getlist.php)
:::
<br/>


```bsl title="Пример кода"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    Результат = OPI_Bitrix24.ПолучитьСписокХранилищ(URL);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "ec4dc366006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСписокХранилищ(URL, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСписокХранилищ --url "b24-ar17wx.bitrix24.by" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": [
  {
   "ID": "3",
   "NAME": "Общий диск",
   "CODE": null,
   "MODULE_ID": "disk",
   "ENTITY_TYPE": "common",
   "ENTITY_ID": "shared_files_s1",
   "ROOT_OBJECT_ID": "3"
  },
  {
   "ID": "1",
   "NAME": "Антон Титовец",
   "CODE": null,
   "MODULE_ID": "disk",
   "ENTITY_TYPE": "user",
   "ENTITY_ID": "1",
   "ROOT_OBJECT_ID": "1"
  },
  {
   "ID": "16",
   "NAME": "iscript13@gmail.com",
   "CODE": null,
   "MODULE_ID": "disk",
   "ENTITY_TYPE": "user",
   "ENTITY_ID": "10",
   "ROOT_OBJECT_ID": "270"
  },
  {
   "ID": "4",
   "NAME": "Payment Processing Customer Support",
   "CODE": null,
   "MODULE_ID": "disk",
   "ENTITY_TYPE": "user",
   "ENTITY_ID": "2",
   "ROOT_OBJECT_ID": "4"
  },
  {
   "ID": "10",
   "NAME": "CoPilot",
   "CODE": null,
   "MODULE_ID": "disk",
   "ENTITY_TYPE": "user",
   "ENTITY_ID": "4",
   "ROOT_OBJECT_ID": "52"
  },
  {
   "ID": "12",
   "NAME": "Поддержка Битрикс24",
   "CODE": null,
   "MODULE_ID": "disk",
   "ENTITY_TYPE": "user",
   "ENTITY_ID": "6",
   "ROOT_OBJECT_ID": "70"
  },
  {
   "ID": "14",
   "NAME": "Марта",
   "CODE": null,
   "MODULE_ID": "disk",
   "ENTITY_TYPE": "user",
   "ENTITY_ID": "8",
   "ROOT_OBJECT_ID": "72"
  }
 ],
 "total": 7,
 "time": {
  "start": 1718783911.64028,
  "finish": 1718783911.69026,
  "duration": 0.0499801635742188,
  "processing": 0.00660109519958496,
  "date_start": "2024-06-19T07:58:31+00:00",
  "date_finish": "2024-06-19T07:58:31+00:00",
  "operating_reset_at": 1718784511,
  "operating": 0
 }
}
```
