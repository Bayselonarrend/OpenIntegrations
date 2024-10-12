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
    Токен    = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
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
 "id": "1aLLPD2uD3xht-PmNHlZt-OIBzFd5qHgg",
 "name": "Тестовая папка",
 "mimeType": "application/vnd.google-apps.folder"
}
```
