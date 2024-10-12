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
    Токен         = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Идентификатор = "1jUonZ73Ck_Wyv5FDpsBr7UVSwx1mt0dp";
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
