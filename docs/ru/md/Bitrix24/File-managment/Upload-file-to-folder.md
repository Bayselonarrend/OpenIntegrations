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

    Картинка2 = "https://api.athenaeum.digital/test_data/picture.jpg";  // Локальный путь, URL или Двоичные данные
    Картинка  = "https://api.athenaeum.digital/test_data/picture2.jpg"; // Локальный путь, URL или Двоичные данные

    IDПриемника = "12882";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ЗагрузитьФайлВКаталог(URL, Наименование2, Картинка2, IDПриемника);

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "21750a67006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ЗагрузитьФайлВКаталог(URL, Наименование, Картинка, IDПриемника, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ЗагрузитьФайлВКаталог --url "b24-ar17wx.bitrix24.by" --title %title% --file %file% --folderid %folderid% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": 12480,
  "NAME": "Картинка1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12462",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8594,
  "SIZE": "805191",
  "CREATE_TIME": "2024-10-08T20:49:32+03:00",
  "UPDATE_TIME": "2024-10-08T20:49:32+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=717e0567006e9f06006b12e400000001000007c2ebc8f80264531d4fc09a27052a7fe2&token=disk%7CaWQ9MTI0ODAmXz14NDFwOTBFbFJlVmZzMUFwY3FGOHBNZVZJRk9pUTN4aw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USTBPREFtWHoxNE5ERndPVEJGYkZKbFZtWnpNVUZ3WTNGR09IQk5aVlpKUms5cFVUTjRhdz09fDcxN2UwNTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YzJlYmM4ZjgwMjY0NTMxZDRmYzA5YTI3MDUyYTdmZTIi.evQcDrGBB9TOd%2FfnpIiw%2FXueoUXFgvrkfNi%2B%2FfsUnPg%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Картинка1.jpg"
 }
}
```
