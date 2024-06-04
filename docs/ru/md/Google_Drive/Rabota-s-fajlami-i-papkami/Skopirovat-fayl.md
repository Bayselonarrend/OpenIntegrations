---
sidebar_position: 5
---

# Скопировать объект
Копирует существующий файл или каталог Google Drive

*Функция СкопироватьОбъект(Знач Токен, Знач Идентификатор, Знач НовоеИмя = "", Знач НовыйРодитель = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | Идентификатор | --object | Строка | ID копируемого объекта |
  | НовоеИмя | --title | Строка (необяз.) | Новое имя файла |
  | НовыйРодитель | --catalog | Строка (необяз.) | Новое расположение (каталог) файла |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Google

```bsl title="Пример кода"

    НовоеИмя          = "Скопированный файл.jpeg";
    НовоеРасположение = "1603PU_Hrkvj4HeFJKYSVxZJDRoGvd3SJ";
    Идентификатор     = "1F8pfXPgltiOG2fPv88uStwegYj1tRoFk";
    
    Ответ = OPI_GoogleDrive.СкопироватьОбъект(Токен, Идентификатор, НовоеИмя, НовоеРасположение)  //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                                   //Строка

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gdrive СкачатьФайл --token "%token%" --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa" --out ./picture.png

```

![Результат](img/2.png)

```json title="Результат"

{
 "mimeType": "image/jpeg",
 "name": "Скопированный файл.jpeg",
 "id": "1uxsMaxL1W5Y7z6-HhjE6QpyDxFPgW4Fy",
 "kind": "drive#file"
}

```
