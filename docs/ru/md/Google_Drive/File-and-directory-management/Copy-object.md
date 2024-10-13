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
    Токен         = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Идентификатор = "14hysfOxsStktI4JZEXRiSZ9Rl69wNJwX";
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
