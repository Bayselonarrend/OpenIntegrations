---
sidebar_position: 3
---

# Установить Webhook
 Устанавливает URL обработчика событий бота для работы в режиме Webhook


<br/>


`Функция УстановитьWebhook(Знач Токен, Знач URL) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | URL | --url | Строка | Адрес обработки запросов от Telegram (с https:) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram





```bsl title="Пример кода"
  Токен       = "6129457865:AAFyzNYOAFbu...";
  URL         = "https://api.athenaeum.digital/opi/hs/twitter";
  
  Результат   = OPI_Telegram.УстановитьWebhook(Токен, URL);
```
	


```sh title="Пример команды CLI"
    
  oint telegram УстановитьWebhook --token "6129457865:AAFyzNYOAFbu..." --url "https://api.athenaeum.digital/opi/hs/twitter"

```

```json title="Результат"
    {
 "ok": true,
 "result": true,
 "description": "Webhook was set"
}
```
