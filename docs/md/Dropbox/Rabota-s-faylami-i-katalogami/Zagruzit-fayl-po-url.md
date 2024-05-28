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
    Токен = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";
    URL   = "https://openintegrations.dev/test_data/document.docx";
    
    Результат = OPI_Dropbox.ЗагрузитьФайлПоURL(Токен, URL, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ЗагрузитьФайлПоURL --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --url %url% --path %path%

```


```json title="Результат"



```
