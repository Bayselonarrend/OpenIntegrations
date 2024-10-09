---
sidebar_position: 3
---

# Обновить токен
 Обновляет v2 токен при помощи refresh_token



`Функция ОбновитьТокен(Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Параметры | --auth | Структура из Строка | Структура авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыАвторизацииТвиттер();
    Результат = OPI_Twitter.ОбновитьТокен(Параметры);
```



```sh title="Пример команды CLI"
    
  oint twitter ОбновитьТокен --auth %auth%

```

```json title="Результат"
{
 "token_type": "bearer",
 "expires_in": 7200,
 "access_token": "OV9FRzBrRnRHYUgzMm9Ka0J0VWVhTXdfS2Y5X01NenRBd05yYk0xRGo4TUdNOjE3Mjg0MDc4NTI0ODU6MToxOmF0OjE",
 "scope": "mute.write tweet.moderate.write block.read follows.read offline.access list.write bookmark.read list.read tweet.write space.read block.write like.write like.read users.read tweet.read bookmark.write mute.read follows.write",
 "refresh_token": "TDU0MWRoU0VpS2tkN21qNUVLeVVkaUV5Wl9JeVQ3ZXRiUEVIdGtoQUlGWHhNOjE3Mjg0MDc4NTI0ODU6MToxOnJ0OjE"
}
```
