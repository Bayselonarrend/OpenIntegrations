---
sidebar_position: 1
---

# Получить информацию о боте
 Получает основную информацию о боте



`Функция ПолучитьИнформациюОБоте(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
  
  
  Ответ = OPI_Slack.ПолучитьИнформациюОБоте(Токен); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);       //JSON строка
```



```sh title="Пример команды CLI"
    
  oint slack ПолучитьИнформациюОБоте --token %token%

```

```json title="Результат"
{
  "ok": true,
  "url": "https://openintegrationsgroup.slack.com/",
  "team": "OpenIntegrations",
  "user": "openintegrations",
  "team_id": "T06UD92BS3C",
  "user_id": "U06UG1CAYH2",
  "bot_id": "B06TZ0MJV5M",
  "is_enterprise_install": false
  }
```
