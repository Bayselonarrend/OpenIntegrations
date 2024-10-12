---
sidebar_position: 7
---

# Скоприровать объект
 Копирует файл или каталог



`Функция СкопироватьОбъект(Знач Токен, Знач Идентификатор, Знач НовоеИмя = "", Знач НовыйРодитель = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор объекта |
  | НовоеИмя | --title | Строка | Новое имя объекта |
  | НовыйРодитель | --catalog | Строка | Новый каталог размещения |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Идентификатор = "1rjQ1PytDjJVgTIkNK600sQEPGqHDIeWW";
    НовоеИмя      = "Скопированный файл.jpeg";
    НовыйРодитель = "root";

    Результат = OPI_GoogleDrive.СкопироватьОбъект(Токен, Идентификатор, НовоеИмя, НовыйРодитель);
```



```sh title="Пример команды CLI"
    
  oint gdrive СкопироватьОбъект --token %token% --object "1F8pfXPgltiOG2fPv88uStwegYj1tRoFk" --title "Скопированный файл.jpeg" --catalog %catalog%

```

```json title="Результат"
{
 "kind": "drive#file",
 "id": "1P8WK9Wn2710HiQYkKzYMFso2FmFenV6d",
 "name": "Скопированный файл.jpeg",
 "mimeType": "image/jpeg"
}
```
