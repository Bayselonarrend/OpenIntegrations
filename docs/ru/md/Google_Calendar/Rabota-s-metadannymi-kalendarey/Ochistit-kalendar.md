---
sidebar_position: 5
---

# Очистить основной календарь
Удаляет все события основного календаря (так как его, в отличии от остальных, нельзя удалить)

*Функция ОчиститьОсновнойКалендарь(Знач Токен) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  
  Вовзращаемое значение: Пустая строка

```bsl title="Пример кода"
			
    Ответ = OPI_GoogleCalendar.ОчиститьОсновнойКалендарь(Токен); 

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gcalendar ОчиститьОсновнойКалендарь --token "%token%"

```

```json title="Результат"

""

```
