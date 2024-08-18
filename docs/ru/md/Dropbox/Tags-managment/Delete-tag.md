---
sidebar_position: 3
---

# Удалить тег
 Удаляет текстовый тег файла или каталога



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
    Токен     = "sl.B4gp-iE6U2BXAeEhqhHwN00_GAOFjvVi4j_C9r2yZ5sjIUcTga38IbFN49TKhxrmzyrNjttkXA...";
    Путь      = "/New/mydoc.docx";

    Результат = OPI_Dropbox.УдалитьТег(Токен, Путь, Тег);
```



```sh title="Пример команды CLI"
    
  oint dropbox УдалитьТег --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --tag %tag%

```

```json title="Результат"
{}
```
