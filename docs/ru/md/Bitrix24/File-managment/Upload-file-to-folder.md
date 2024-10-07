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
  "ID": 12300,
  "NAME": "Картинка1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12282",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8474,
  "SIZE": "805191",
  "CREATE_TIME": "2024-10-07T16:06:51+03:00",
  "UPDATE_TIME": "2024-10-07T16:06:51+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a9ea0367006e9f06006b12e4000000010000077cf7361dce36b4295333ecec6bf0f55c&token=disk%7CaWQ9MTIzMDAmXz1DSENQT2FuaDBCN01QNDFpQk5KNHZrNm91MnVlUlNndQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpNREFtWHoxRFNFTlFUMkZ1YURCQ04wMVFOREZwUWs1S05IWnJObTkxTW5WbFVsTm5kUT09fGE5ZWEwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3N2NmNzM2MWRjZTM2YjQyOTUzMzNlY2VjNmJmMGY1NWMi.lOowoma9xXjdJbMLZTtt0fwzLANNlRbj%2BvfJP0RKe2s%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Картинка1.jpg"
 }
}
```
