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
    Токен         = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Идентификатор = "1A0oqifjQs0coHvFLF4BFr7hCmOJxETDe";
    НовоеИмя      = "Скопированный файл.jpeg";
    НовыйРодитель = "root";

    Результат = OPI_GoogleDrive.СкопироватьОбъект(Токен, Идентификатор, НовоеИмя, НовыйРодитель);
```



```sh title="Пример команды CLI"
    
  oint gdrive СкопироватьОбъект --token %token% --object "1F8pfXPgltiOG2fPv88uStwegYj1tRoFk" --title "Скопированный файл.jpeg" --catalog %catalog%

```

```json title="Результат"
{
  "mimeType": "image/jpeg",
  "name": "Скопированный файл.jpeg",
  "id": "1uxsMaxL1W5Y7z6-HhjE6QpyDxFPgW4Fy",
  "kind": "drive#file"
  }
```
