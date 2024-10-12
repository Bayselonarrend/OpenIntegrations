---
sidebar_position: 4
---

# Удалить комментарий
 Удаляет комментарий по ID



`Функция УдалитьКомментарий(Знач Токен, Знач ИДОбъекта, Знач ИДКомментария) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДОбъекта | --object | Строка | Идентификатор файла или каталога размещения комментария |
  | ИДКомментария | --comment | Строка | Идентификатор комментария |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Идентификатор = "1rjQ1PytDjJVgTIkNK600sQEPGqHDIeWW";
    ИДКомментария = "AAABRYFG8BM";

    Результат = OPI_GoogleDrive.УдалитьКомментарий(Токен, Идентификатор, ИДКомментария);
```



```sh title="Пример команды CLI"
    
  oint gdrive УдалитьКомментарий --token %token% --object %object% --comment %comment%

```

```json title="Результат"
null
```
