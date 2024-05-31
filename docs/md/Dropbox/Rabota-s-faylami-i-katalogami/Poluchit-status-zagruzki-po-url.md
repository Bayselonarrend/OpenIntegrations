---
sidebar_position: 6
---

# Получить статус загрузки по URL
 Получает статус загрузки файла по URL


*Функция ПолучитьСтатусЗагрузкиПоURL(Знач Токен, Знач IDРаботы) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDРаботы | --job | Строка | ID асинхронной работы из ответа ЗагрузитьФайлПоURL |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен    = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    ИДРаботы = "mTzF6hWsswAAAAAAAAAAAQ";
    Статус   = "in_progress";    
    
    Пока Статус = "in_progress" Цикл 
        
        Результат = OPI_Dropbox.ПолучитьСтатусЗагрузкиПоURL(Токен, ИДРаботы);
        Статус    = Результат[".tag"];
        
        OPI_Инструменты.Пауза(5);
        
        OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ПолучитьСтатусЗагрузкиПоURL", "Dropbox");
        
    КонецЦикла;

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьСтатусЗагрузкиПоURL --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --job %job%

```


```json title="Результат"

{
 ".tag": "complete",
 "name": "url_doc.docx",
 "path_lower": "/new/url_doc.docx",
 "path_display": "/New/url_doc.docx",
 "id": "id:kJU6-a-pT48AAAAAAAABYw",
 "client_modified": "2024-05-30T12:33:07Z",
 "server_modified": "2024-05-30T12:33:08Z",
 "rev": "619ab11c37fb9bd841553",
 "size": 24069,
 "is_downloadable": true,
 "content_hash": "8d63c5989ceec1a90f3fde2ffaa76efcd2c050191e6b55a1761e4e352590bd8c"
}

```
