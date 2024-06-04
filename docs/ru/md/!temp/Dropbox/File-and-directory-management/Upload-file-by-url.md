---
sidebar_position: 5
---

# Загрузить файл по URL
 Загружает файл на облачный диск, получая его по указанному URL


*Функция ЗагрузитьФайлПоURL(Знач Токен, Знач URLФайла, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URLФайла | --url | Строка | URL источник файла |
  | Путь | --path | Строка | Путь сохранения на Dropbox |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Путь  = "/New/url_doc.docx";  
    Токен = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    URL   = "https://openintegrations.dev/test_data/document.docx";
    
    Результат = OPI_Dropbox.ЗагрузитьФайлПоURL(Токен, URL, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ЗагрузитьФайлПоURL --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --url %url% --path %path%

```


```json title="Результат"

{
 ".tag": "async_job_id",
 "async_job_id": "41d0vPCn2mYAAAAAAAAAAQ"
}

```
