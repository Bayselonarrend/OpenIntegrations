---
sidebar_position: 1
---

# Установить Webhook
Устанавливает адрес обработчика событий бота для работы в режиме webhook. При появлении нового события у бота, на данный адрес будет приходить http-запрос с информацией


*Функция УстановитьWebhook(Знач Токен, Знач URL) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Токен | Строка | Токен бота |
  | URL | Строка | Адрес обработки запросов от Telegram (с https://) |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Telegram


```bsl title="Пример кода"
	
	Токен = "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ";
	
	Ответ = OPI_Telegram.УстановитьWebhook(Токен, "https://api.athenaeum.digital/opi/hs/telegram"); //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                                     //JSON строка
	
```

```json title="Результат"
{
 "description": "Webhook was set",
 "result": true,
 "ok": true
}
```
