---
sidebar_position: 1
---

# Получить ссылку авторизации
Формирует URL для авторизации через браузер


Функция ПолучитьСсылкуАвторизации(Параметры = "") Экспорт

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Параметры | --auth | Структура (необяз.) | Параметры / перезапись стандартных параметров (см. [Получение необходимых данных](../)) |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Telegram


```bsl title="Пример кода"
	
	Ответ = OPI_Twitter.ПолучитьСсылкуАвторизации(Параметры);
	
```

```sh title="Пример команд CLI"

    oint twitter ПолучитьСсылкуАвторизации --auth C:\twitter.json

```

```json title="Результат"
"https://twitter.com/i/oauth2/authorize?response_type=code&client_id=ZG1vSmxlVTJXYi05M2c0ek9iV246MTpjaQ&redirect_uri=https%3A%2F%2Fapi.athenaeum.digital%2Fopi%2Fhs%2Ftwitter&scope=tweet.read%20tweet.write%20tweet.moderate.write%20users.read%20follows.read%20follows.write%20offline.access%20space.read%20mute.read%20mute.write%20like.read%20like.write%20list.read%20list.write%20block.read%20block.write%20bookmark.read%20bookmark.write&state=state&code_challenge=challenge&code_challenge_method=plain"
```
