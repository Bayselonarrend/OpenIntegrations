---
sidebar_position: 9
---

# Удалить объект
Удаляет файл или каталог

*Функция УдалитьОбъект(Знач Токен, Знач Идентификатор) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | Идентификатор | --object | Строка | Идентификатор объекта |
  
  Вовзращаемое значение: Пустой ответ

```bsl title="Пример кода"
			
    Идентификатор = "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"; 

    Ответ = OPI_GoogleDrive.УдалитьОбъект(Токен, Идентификатор);  //Соответствие

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gdrive УдалитьОбъект --token "%token%" --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Результат"

''

```
