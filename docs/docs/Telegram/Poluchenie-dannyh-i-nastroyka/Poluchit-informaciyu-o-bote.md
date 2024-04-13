---
sidebar_position: 1
---

# Получить информацию о боте
Выполняет запрос **/getMe**, возвращающий базовую информацию о боте: имя, id, возможность добавлять бота в группы и т.д.


*Функция ПолучитьИнформациюБота(Знач Токен) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Telegram


```bsl title="Пример кода"
	
	Токен = "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ";
	
	Ответ = OPI_Telegram.ПолучитьИнформациюБота(Токен); //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);         //JSON строка
	
```

```sh title="Пример команд CLI"

    oint telegram ПолучитьИнформациюБота --token "%token%"

```

```json title="Результат"
{
 "result": {
  "supports_inline_queries": false,
  "can_read_all_group_messages": false,
  "can_join_groups": true,
  "username": "mynewcoolbot",
  "first_name": "Me cool new bot",
  "is_bot": true,
  "id": 1234567890
 },
 "ok": true
}
```
