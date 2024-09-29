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
    Токен    = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Каталог  = "1Q3vl7hcmdeJvd86jC84pdGKW5772apUy";
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
