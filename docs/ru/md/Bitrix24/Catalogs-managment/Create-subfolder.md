---
sidebar_position: 2
---

# Создать подкаталог
 Создает каталог внутри другого каталога



`Функция СоздатьПодкаталог(Знач URL, Знач IDКаталога, Знач Наименование, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDКаталога | --folderid | Строка, Число | Идентификатор каталога родителя |
  | Наименование | --title | Строка | Наименование нового каталога |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.folder.addsubfolder](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_addsubfolder.php)
:::
<br/>


```bsl title="Пример кода"
    IDКаталога    = "5016";
    Наименование  = "Новый подкаталог";
    Наименование2 = "Новый подкаталог 2";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";

    Результат = OPI_Bitrix24.СоздатьПодкаталог(URL, IDКаталога, Наименование2);

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "fe3fa966006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.СоздатьПодкаталог(URL, IDКаталога, Наименование, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 СоздатьПодкаталог --url "b24-ar17wx.bitrix24.by" --folderid "2490" --title %title% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
    {
 "result": {
  "ID": 850,
  "NAME": "Новый подкаталог",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": 850,
  "PARENT_ID": "846",
  "DELETED_TYPE": 0,
  "CREATE_TIME": "2024-06-27T07:19:57+00:00",
  "UPDATE_TIME": "2024-06-27T07:19:57+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог/Новый подкаталог"
 },
 "time": {
  "start": 1719472797.42827,
  "finish": 1719472797.50854,
  "duration": 0.080265998840332,
  "processing": 0.0455958843231201,
  "date_start": "2024-06-27T07:19:57+00:00",
  "date_finish": "2024-06-27T07:19:57+00:00",
  "operating_reset_at": 1719473397,
  "operating": 0
 }
}

```
