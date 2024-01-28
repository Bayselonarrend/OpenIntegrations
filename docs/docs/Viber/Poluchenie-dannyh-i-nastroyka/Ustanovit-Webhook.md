---
sidebar_position: 1
---

# Установить Webhook
Устанавливает адрес обработчика событий бота для работы в режиме webhook. При появлении нового события у бота, на данный адрес будет приходить http запрос с информацией

*Функция УстановитьWebhook(Знач Токен, Знач URL) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Токен | Строка | Токен бота |
  | URL | Строка | Адрес обработки запросов от Viber (с https://) |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Viber


```bsl title="Пример кода"
	
	Ответ = OPI_Viber.УстановитьWebhook(Токен, "https://api.athenaeum.digital/opi/hs/viber");    //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                                  //JSON строка
	
```

```json title="Результат"

{
 "event_types": [
  "subscribed",
  "unsubscribed",
  "webhook",
  "conversation_started",
  "client_status",
  "action",
  "delivered",
  "failed",
  "message",
  "seen"
 ],
 "chat_hostname": "SN-CHAT-12_",
 "status_message": "ok",
 "status": 0
}

```
