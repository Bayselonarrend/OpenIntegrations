---
sidebar_position: 5
---

# Получить содержимое хранилища
 Получает список файлов и каталогов, находящихся в корне хранилища



`Функция ПолучитьСодержимоеХранилища(Знач URL, Знач IDХранилища, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDХранилища | --storageid | Строка, Число | Идентификатор хранилища |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.storage.getchildren](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getchildren.php)
:::
<br/>


```bsl title="Пример кода"
    URL         = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDХранилища = 3;

    Результат   = OPI_Bitrix24.ПолучитьСодержимоеХранилища(URL, IDХранилища);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСодержимоеХранилища(URL, IDХранилища, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСодержимоеХранилища --url "b24-ar17wx.bitrix24.by" --storageid %storageid% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": [
  {
   "ID": "12274",
   "NAME": "Картинка2.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8464",
   "SIZE": "2114023",
   "CREATE_TIME": "2024-10-07T16:06:24+03:00",
   "UPDATE_TIME": "2024-10-07T16:06:24+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a9ea0367006e9f06006b12e4000000010000077cf7361dce36b4295333ecec6bf0f55c&token=disk%7CaWQ9MTIyNzQmXz03RUtQdGhuTzlVZ0pyalZ0SFlSOGpRSFBxZVRobnNiag%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlOelFtWHowM1JVdFFkR2h1VHpsVlowcHlhbFowU0ZsU09HcFJTRkJ4WlZSb2JuTmlhZz09fGE5ZWEwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3N2NmNzM2MWRjZTM2YjQyOTUzMzNlY2VjNmJmMGY1NWMi.sfljB4tSFIef5YfG%2BpZdWIkjwsyC%2FUO39QijwmdpF%2Fo%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка2.jpg"
  },
  {
   "ID": "12276",
   "NAME": "Картинка1.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8466",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-07T16:06:25+03:00",
   "UPDATE_TIME": "2024-10-07T16:06:25+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a9ea0367006e9f06006b12e4000000010000077cf7361dce36b4295333ecec6bf0f55c&token=disk%7CaWQ9MTIyNzYmXz1OMlFyaGhvTHJ6ZnIwY0FBdUNWRjF2MDFoRGFLZUl0aA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlOelltWHoxT01sRnlhR2h2VEhKNlpuSXdZMEZCZFVOV1JqRjJNREZvUkdGTFpVbDBhQT09fGE5ZWEwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3N2NmNzM2MWRjZTM2YjQyOTUzMzNlY2VjNmJmMGY1NWMi.%2BgJnKap22blbe1rJdVGTxaNLNyzmP99D2Tq4bY1tf4o%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка1.jpg"
  }
 ],
 "total": 2,
 "time": {
  "start": 1728306386.01905,
  "finish": 1728306386.06056,
  "duration": 0.0415170192718506,
  "processing": 0.00873708724975586,
  "date_start": "2024-10-07T16:06:26+03:00",
  "date_finish": "2024-10-07T16:06:26+03:00",
  "operating_reset_at": 1728306986,
  "operating": 0
 }
}
```
