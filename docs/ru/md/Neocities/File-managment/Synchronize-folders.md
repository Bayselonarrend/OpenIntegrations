﻿---
sidebar_position: 5
---

# Синхронизировать каталоги
 Создает копию локального каталога по выбранному пути на сервере



`Функция СинхронизироватьКаталоги(Знач Токен, Знач ЛокальныйКаталог, Знач УдаленныйКаталог = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен авторизации |
  | ЛокальныйКаталог | --local | Строка | Локальный каталог источник |
  | УдаленныйКаталог | --remote | Строка | Удаленный каталог приемника. Корень, если не заполнено |

  
  Возвращаемое значение:   Структура Из КлючИЗначение - информация об ошибках синхронизации

<br/>

:::tip
Документация Neocities API: [neocities.org/api](https://neocities.org/api)

 Метод удаляет файлы на сервере, если они отсутствуют в локальном каталоге
:::
<br/>


```bsl title="Пример кода"
    Токен = "7419cd51de4037f7...";

    ЛокальныйКаталог  = "C:\test_site";
    УдаленныйКаталог  = "test_sync";

    Результат = OPI_Neocities.СинхронизироватьКаталоги(Токен, ЛокальныйКаталог, УдаленныйКаталог);
```



```sh title="Пример команды CLI"
    
  oint neocities СинхронизироватьКаталоги --token "7419cd51de4037f7..." --local %local% --remote %remote%

```

```json title="Результат"
{
 "errors": 0,
 "items": []
}
```
