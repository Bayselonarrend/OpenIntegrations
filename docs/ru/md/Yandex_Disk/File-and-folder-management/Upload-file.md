﻿---
sidebar_position: 10
---

# Загрузить файл
 Загружает файл на диск по заданному пути



`Функция ЗагрузитьФайл(Знач Токен, Знач Путь, Знач Файл, Знач Перезаписывать = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь для сохранение файла на Диске |
  | Файл | --file | Строка,ДвоичныеДанные | Файл для загрузки |
  | Перезаписывать | --rewrite | Булево | Перезаписывать, если файл с таким именем уже существует |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
  
  Токен = "y0_AgAAAABdylaOAA...";
  Путь  = "/АльпакаИзФайла.png";
  Файл  = "C:\logo.png";
  
  Ответ = OPI_YandexDisk.ЗагрузитьФайл(Токен, Путь, Файл); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);              //Строка
```
	


```sh title="Пример команды CLI"
    
  oint yadisk ЗагрузитьФайл --token "y0_AgAAAABdylaOAA..." --path "/АльпакаИзФайла.png" --file "C:\logo.png" --rewrite %rewrite%

```

```json title="Результат"
<пустая строка>
```
