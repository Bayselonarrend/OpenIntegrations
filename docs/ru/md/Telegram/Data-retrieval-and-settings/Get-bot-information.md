---
sidebar_position: 1
---

# Получить информацию о боте
 Выполняет запрос /getMe, возвращающий базовую информацию о боте: имя, id, возможность добавлять бота в группы и т.д.



`Функция ПолучитьИнформациюБота(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>




```bsl title="Пример кода"
    Токен       = "6129457865:AAFyzNYOAFbu...";
    Результат   = OPI_Telegram.ПолучитьИнформациюБота(Токен);
```



```sh title="Пример команды CLI"
    
  oint telegram ПолучитьИнформациюБота --token "6129457865:AAFyzNYOAFbu..."

```

```json title="Результат"
    {
 "ok": true,
 "result": {
  "id": 6129457865,
  "is_bot": true,
  "first_name": "Бот Виталий",
  "username": "sicheebot",
  "can_join_groups": true,
  "can_read_all_group_messages": false,
  "supports_inline_queries": false,
  "can_connect_to_business": false
 }
}

```
