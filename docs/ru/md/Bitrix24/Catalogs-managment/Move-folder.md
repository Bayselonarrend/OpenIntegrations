---
sidebar_position: 4
---

# Переместить каталог
 Перемещает один каталог внутрь другого



`Функция ПереместитьКаталог(Знач URL, Знач IDКаталога, Знач IDПриемника, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDКаталога | --folderid | Строка, Число | Идентификатор каталога |
  | IDПриемника | --tagetid | Строка, Число | ID каталога назначения |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.folder.moveto](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_moveto.php)
:::
<br/>


```bsl title="Пример кода"
    IDПриемника = "5014";
    IDКаталога  = "5020";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";

    Результат = OPI_Bitrix24.ПереместитьКаталог(URL, IDКаталога, IDПриемника);

    IDКаталога  = "5018";

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "fe3fa966006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПереместитьКаталог(URL, IDКаталога, IDПриемника, Токен);

    Проверка_БитриксОбъект(Результат);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПереместитьКаталог --url "b24-ar17wx.bitrix24.by" --folderid "2492" --tagetid "2488" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
    {
 "result": {
  "ID": "938",
  "NAME": "Новый подкаталог 2",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "938",
  "PARENT_ID": 934,
  "DELETED_TYPE": "0",
  "CREATE_TIME": "2024-07-01T13:44:06+00:00",
  "UPDATE_TIME": "2024-07-01T13:44:07+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог 2/Новый подкаталог 2"
 },
 "time": {
  "start": 1719841451.89089,
  "finish": 1719841451.95846,
  "duration": 0.0675740242004394,
  "processing": 0.0360250473022461,
  "date_start": "2024-07-01T13:44:11+00:00",
  "date_finish": "2024-07-01T13:44:11+00:00",
  "operating_reset_at": 1719842051,
  "operating": 0
 }
}

```
