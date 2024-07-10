---
sidebar_position: 11
---

# Переслать сообщение
 Пересылает сообщение между чатами или в рамках одного чата


<br/>


`Функция ПереслатьСообщение(Знач Токен, Знач IDОригинала, Знач ОткудаID, Знач КудаID) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDОригинала | --message | Строка,Число | ID оригинального сообщения |
  | ОткудаID | --from | Строка,Число | ID чата оригинального сообщения |
  | КудаID | --to | Строка,Число | ID целевого чата или IDЧата*IDТемы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>




```bsl title="Пример кода"
  Токен       = "6129457865:AAFyzNYOAFbu...";
  IDЧата      = "461699897";
  IDКанала    = "@testsichee";
  IDСообщения = "4951";
  
  Результат = OPI_Telegram.ПереслатьСообщение(Токен, IDСообщения, IDКанала, IDЧата);
```
	


```sh title="Пример команды CLI"
    
  oint telegram ПереслатьСообщение --token "6129457865:AAFyzNYOAFbu..." --message %message% --from %from% --to %to%

```

```json title="Результат"
{
 "ok": true,
 "result": {
  "message_id": 4649,
  "from": {
   "id": 6129457865,
   "is_bot": true,
   "first_name": "Бот Виталий",
   "username": "sicheebot"
  },
  "chat": {
   "id": 461699897,
   "first_name": "Anton",
   "last_name": "Titowets",
   "username": "JKIee",
   "type": "private"
  },
  "date": 1717072482,
  "forward_origin": {
   "type": "channel",
   "chat": {
    "id": -1001893407333,
    "title": "Тестовый канал",
    "username": "testsichee",
    "type": "channel"
   },
   "message_id": 4686,
   "date": 1717072354
  },
  "forward_from_chat": {
   "id": -1001893407333,
   "title": "Тестовый канал",
   "username": "testsichee",
   "type": "channel"
  },
  "forward_from_message_id": 4686,
  "forward_date": 1717072354,
  "text": "Строковое значение"
 }
}
```
