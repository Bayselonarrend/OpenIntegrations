---
sidebar_position: 5
---

# Создать папку
 Создает пустой каталог на диске



`Функция СоздатьПапку(Знач Токен, Знач Имя, Знач Родитель = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Имя | --title | Строка | Имя папки |
  | Родитель | --catalog | Строка | Родитель |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен    = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Каталог  = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";
    Имя      = "Тестовая папка";

    Результат = OPI_GoogleDrive.СоздатьПапку(Токен, Имя, Каталог);
```



```sh title="Пример команды CLI"
    
  oint gdrive СоздатьПапку --token %token% --title "Тестовая папка" --catalog %catalog%

```

```json title="Результат"
{
 "kind": "drive#file",
 "id": "1tTvPUeaH9fQcuJbgmjWNv98Y5kjs9CPZ",
 "name": "Тестовая папка",
 "mimeType": "application/vnd.google-apps.folder"
}
```
