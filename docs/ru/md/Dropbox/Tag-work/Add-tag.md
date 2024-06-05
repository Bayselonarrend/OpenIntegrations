---
sidebar_position: 2
---

# Добавить тег
 Добавляет новый текстовый тег к файлу или каталогу


*Функция ДобавитьТег(Знач Токен, Знач Путь, Знач Тег) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту, для которого необходимо создать тег |
  | Тег | --tag | Строка | Текст тега |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Тег       = "Важное";
    Токен     = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
    Путь      = "/New/mydoc.docx";  
    
    Результат = OPI_Dropbox.ДобавитьТег(Токен, Путь, Тег);

	
```

```sh title="Пример команды CLI"
    
  oint dropbox ДобавитьТег --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --tag %tag%

```


```json title="Результат"

{}

```
