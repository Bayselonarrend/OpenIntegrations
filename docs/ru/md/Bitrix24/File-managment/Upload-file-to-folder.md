---
sidebar_position: 2
---

# Загрузить файл в каталог
 Загружает переданный файл в каталог



`Функция ЗагрузитьФайлВКаталог(Знач URL, Знач Наименование, Знач Файл, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Наименование | --title | Строка | Наименование файла с расширением для сохранения |
  | Файл | --file | Строка, ДвоичныеДанные | Файл для загрузки |
  | IDКаталога | --folderid | Строка | Идентификатор каталога для загрузки |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.folder.uploadfile](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_uploadfile.php)
:::
<br/>


```bsl title="Пример кода"
    Наименование2  = "Картинка2.jpg";
    Наименование   = "Картинка1.jpg";

    Картинка2 = "https://openyellow.neocities.org/test_data/picture.jpg";  // Локальный путь, URL или Двоичные данные
    Картинка  = "https://openyellow.neocities.org/test_data/picture2.jpg"; // Локальный путь, URL или Двоичные данные

    IDПриемника = "10842";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ЗагрузитьФайлВКаталог(URL, Наименование2, Картинка2, IDПриемника);

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ЗагрузитьФайлВКаталог(URL, Наименование, Картинка, IDПриемника, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ЗагрузитьФайлВКаталог --url "b24-ar17wx.bitrix24.by" --title %title% --file %file% --folderid %folderid% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": 12180,
  "NAME": "Картинка1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12162",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8394,
  "SIZE": "805191",
  "CREATE_TIME": "2024-10-06T17:33:18+03:00",
  "UPDATE_TIME": "2024-10-06T17:33:18+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=76ad0267006e9f06006b12e400000001000007b25673cab9bbfe352545eeb9a0d9a9fe&token=disk%7CaWQ9MTIxODAmXz1vc2lwcko3Q1pBNndYUjlXTWJTZmRuWmk2Q2hoRHFVVg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXhPREFtWHoxdmMybHdja28zUTFwQk5uZFlVamxYVFdKVFptUnVXbWsyUTJob1JIRlZWZz09fDc2YWQwMjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YjI1NjczY2FiOWJiZmUzNTI1NDVlZWI5YTBkOWE5ZmUi.P7dPNgDcSUB1D%2Bxqn9ahC15PP%2BTPK0u1N8PzRbu2iEg%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Картинка1.jpg"
 }
}
```
