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
    Токен    = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Каталог  = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";
    Имя      = "Тестовая папка";

    Результат = OPI_GoogleDrive.СоздатьПапку(Токен, Имя, Каталог);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gdrive СоздатьПапку --token "***" \
              --title "Тестовая папка"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gdrive СоздатьПапку ^
              --token "***" ^
              --title "Тестовая папка"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "kind": "drive#file",
 "id": "1aLLPD2uD3xht-PmNHlZt-OIBzFd5qHgg",
 "name": "Тестовая папка",
 "mimeType": "application/vnd.google-apps.folder"
}
```
