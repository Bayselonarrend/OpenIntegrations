---
sidebar_position: 8
---

# Создать папку
Создает пустой каталог

*Функция СоздатьПапку(Знач Токен, Знач Имя, Знач Родитель = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | Имя | --title | Строка | Имя нового каталога |
  | Родитель | --catalog | Строка | ID родительского каталога (по умолчанию - корень) |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Google

```bsl title="Пример кода"
			
    Имя = "Тестовая папка";
 
    Ответ = OPI_GoogleDrive.СоздатьПапку(Токен, Имя);  //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);        //Строка

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gdrive СоздатьПапку --token "%token%" --title "Тестовая папка"

```

![Результат](img/4.png)

```json title="Результат"

{
 "mimeType": "application/vnd.google-apps.folder",
 "name": "Тестовая папка",
 "id": "1fIqr5pJV3QybT5sPeZhBD_0TIvtL5Ovc",
 "kind": "drive#file"
}

```
