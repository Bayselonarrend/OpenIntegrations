﻿---
sidebar_position: 1
---

# Получить список тегов
 Получает список тегов выбранных файлов



`Функция ПолучитьСписокТегов(Знач Токен, Знач Пути) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Пути | --paths | Строка, Массив Из Строка | Путь или набору путей к файлам |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";

    МассивПутей = Новый Массив;
    МассивПутей.Добавить("/New/Dogs.mp3");
    МассивПутей.Добавить("/New/mydoc.docx");

    Результат = OPI_Dropbox.ПолучитьСписокТегов(Токен, МассивПутей);
```



```sh title="Пример команды CLI"
    
  oint dropbox ПолучитьСписокТегов --token %token% --paths %paths%

```

```json title="Результат"
{
 "paths_to_tags": [
  {
   "path": "/New/Dogs.mp3",
   "tags": []
  },
  {
   "path": "/New/mydoc.docx",
   "tags": [
    {
     ".tag": "user_generated_tag",
     "tag_text": "важное"
    }
   ]
  }
 ]
}
```
