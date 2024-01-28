---
sidebar_position: 1
---

# Получить обновления (информацию о новых событиях)
Выполняет запрос **/getUpdates**, возвращающий информацию о последних событиях бота. Используется при работе в *polling* режиме


*Функция ПолучитьОбновления(Знач Токен) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Токен | Строка | Токен бота |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Telegram


```bsl title="Пример кода"
	
	Токен = "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ";
	
	Ответ = OPI_Telegram.ПолучитьОбновления(Токен); //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);     //JSON строка
	
```

```json title="Результат"
{
 "result": [
  {
   "message": {
    "text": "Yo",
    "date": 1704531153,
    "chat": {
     "username": "JKIee",
     "type": "private",
     "last_name": "Titowets",
     "first_name": "Anton",
     "id": 1234567890
    },
    "from": {
     "language_code": "ru",
     "username": "JKIee",
     "last_name": "Titowets",
     "first_name": "Anton",
     "is_bot": false,
     "id": 1234567890
    },
    "message_id": 3
   },
   "update_id": 291363467
  }
 ],
 "ok": true
}
```
