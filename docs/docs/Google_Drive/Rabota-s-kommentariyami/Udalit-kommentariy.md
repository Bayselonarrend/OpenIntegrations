---
sidebar_position: 4
---

# Удалить комментарий
Удаляет комментарий по ID

*Функция УдалитьКомментарий(Знач Токен, Знач ИДОбъекта, Знач ИДКомментария) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | ИДОбъекта | --object | Строка | Идентификатор объекта-владельца комментария |
  | ИДКомментария | --comment | Строка | Идентификатор комментария |
  
  Вовзращаемое значение: Пустой ответ

```bsl title="Пример кода"
			
    Идентификатор = "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"; 

    Ответ = OPI_GoogleDrive.УдалитьКомментарий(Токен, Идентификатор, Комментарий);  //Соответствие

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gdrive УдалитьКомментарий --token "%token%" --object "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW" --comment "%commetn%"

```


```json title="Результат"

''

```
