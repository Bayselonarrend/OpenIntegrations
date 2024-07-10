---
sidebar_position: 19
---

# Загрузить файл в каталог
 Загружает переданный файл в каталог


<br/>


`Функция ЗагрузитьФайлВКаталог(Знач URL, Знач Наименование, Знач Файл, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Наименование | --title | Строка | Наименование файла с расширением для сохранения |
  | Файл | --file | Строка, ДвоичныеДанные | Файл для загрузки |
  | IDКаталога | --folderid | Строка | Идентификатор каталога для загрузки |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24





```bsl title="Пример кода"
  Наименование2  = "Картинка2.jpg";
  Наименование   = "Картинка1.jpg";
  
  Картинка2 = "https://openintegrations.dev/test_data/picture.jpg";  // Локальный путь, URL или Двоичные данные
  Картинка  = "https://openintegrations.dev/test_data/picture2.jpg"; // Локальный путь, URL или Двоичные данные
  
  IDПриемника = "2490";
  
  URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.ЗагрузитьФайлВКаталог(URL, Наименование2, Картинка2, IDПриемника);
  
  
  
  URL   = "b24-ar17wx.bitrix24.by";
  Токен = "56898d66006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ЗагрузитьФайлВКаталог(URL, Наименование, Картинка, IDПриемника, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ЗагрузитьФайлВКаталог --url "b24-ar17wx.bitrix24.by" --title %title% --file %file% --folderid %folderid% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
    {
 "result": {
  "ID": 1740,
  "NAME": "Картинка1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "1722",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 1142,
  "SIZE": "805189",
  "CREATE_TIME": "2024-07-03T14:42:52+00:00",
  "UPDATE_TIME": "2024-07-03T14:42:52+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTc0MCZfPTFqN3RzcGx4UndmRkk0cmlvVGVFQUEzQ05lOHZ0U1RR%7CImRvd25sb2FkfGRpc2t8YVdROU1UYzBNQ1pmUFRGcU4zUnpjR3g0VW5kbVJrazBjbWx2VkdWRlFVRXpRMDVsT0haMFUxUlJ8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.yWcwutXSoxydbwTQ7d1Aapgpo69Iyc2LhhtmuH442Uo%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Картинка1.jpg"
 }
}
```
