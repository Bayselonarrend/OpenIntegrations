---
sidebar_position: 4
---

# Удалить Webhook
 Удаляет URL обработчика событий бота для работы в режиме Webhook




<br/>


*Функция УдалитьWebhook(Знач Токен) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram


```bsl title="Пример кода"
  Токен     = "6129457865:AAFyzNYOAFbu...";
  Результат = OPI_Telegram.УдалитьWebhook(Токен);
```
	


```sh title="Пример команды CLI"
    
  oint telegram УдалитьWebhook --token "6129457865:AAFyzNYOAFbu..."

```

```json title="Результат"
    {
 "ok": true,
 "result": true,
 "description": "Webhook was deleted"
}
```
