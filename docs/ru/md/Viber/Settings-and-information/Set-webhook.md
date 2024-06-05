---
sidebar_position: 1
---

# Установить Webhook
ВАЖНО: Установка Webhook обязательна по правилам Viber. Для этого надо иметь свободный URL, который будет возвращать 200 и подлинный SSL сертификат. Если есть сертификат и база опубликована на сервере - можно использовать http-сервис. Туда же будет приходить и информация о новых сообщениях Viber периодически стучит по адресу Webhook, так что если он будет неактивен, то все перестанет работать


*Функция УстановитьWebhook(Знач Токен, Знач URL) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен Viber |
  | URL | --url | Строка | URL для установки Webhook |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Viber

```bsl title="Пример кода"
	
      
      Ответ = OPI_Viber.УстановитьWebhook(Токен, "https://api.athenaeum.digital/opi/hs/viber");    //Соответствие
      Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                                  //JSON строка
      
    
	
```

```sh title="Пример команды CLI"
    
      oint viber УстановитьWebhook --token %token% --url %url%


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
