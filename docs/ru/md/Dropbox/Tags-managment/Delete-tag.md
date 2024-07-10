---
sidebar_position: 3
---

# Удалить тег
 Удаляет текстовый тег файла или каталога


<br/>


`Функция УдалитьТег(Знач Токен, Знач Путь, Знач Тег) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту, тег которого необходимо удалить |
  | Тег | --tag | Строка | Текст тега |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
  Тег       = "Важное";
  Токен     = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
  Путь      = "/New/mydoc.docx";
  
  Результат = OPI_Dropbox.УдалитьТег(Токен, Путь, Тег);
```
	


```sh title="Пример команды CLI"
    
  oint dropbox УдалитьТег --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --tag %tag%

```

```json title="Результат"
    {}
```
