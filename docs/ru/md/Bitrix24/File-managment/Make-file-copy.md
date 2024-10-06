---
sidebar_position: 8
---

# Скопировать файл
 Копирует файл из одного расположения в другое



`Функция СкопироватьФайл(Знач URL, Знач IDФайла, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | ID файла для копирования |
  | IDКаталога | --folderid | Строка, Число | ID каталога размещения копии |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.copyto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_copyto.php)
:::
<br/>


```bsl title="Пример кода"
    IDКаталога = "10840";
    IDФайла    = "10836";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.СкопироватьФайл(URL, IDФайла, IDКаталога);

    IDКаталога = "10842";

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.СкопироватьФайл(URL, IDФайла, IDКаталога, Токен);

    OPI_ПолучениеДанныхТестов.Проверка_БитриксОбъект(Результат);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 СкопироватьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": 12184,
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12162",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8398,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-06T17:33:19+03:00",
  "UPDATE_TIME": "2024-10-06T17:33:19+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=76ad0267006e9f06006b12e400000001000007b25673cab9bbfe352545eeb9a0d9a9fe&token=disk%7CaWQ9MTIxODQmXz12ZlMydXdRR29jYmZsNm9GWGt0cTJ1aE03VjBHMkZNNQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXhPRFFtWHoxMlpsTXlkWGRSUjI5alltWnNObTlHV0d0MGNUSjFhRTAzVmpCSE1rWk5OUT09fDc2YWQwMjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YjI1NjczY2FiOWJiZmUzNTI1NDVlZWI5YTBkOWE5ZmUi.0fb4JxIfycTPqTwyOio%2B7xKW5zRmqaups6Xi4nTfWtg%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728225199.14798,
  "finish": 1728225199.20676,
  "duration": 0.0587759017944336,
  "processing": 0.035027027130127,
  "date_start": "2024-10-06T17:33:19+03:00",
  "date_finish": "2024-10-06T17:33:19+03:00",
  "operating_reset_at": 1728225799,
  "operating": 0
 }
}
```
