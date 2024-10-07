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
 "access_token": "enk0dUxuc3lqT2p3ZF95UVp3aFFhX3R6TkhOc094MzhpaEFxeEFfMzZ0bVVwOjE3MjgyODA4MDM3NDg6MToxOmF0OjE",
 "scope": "mute.write tweet.moderate.write block.read follows.read offline.access list.write bookmark.read list.read tweet.write space.read block.write like.write like.read users.read tweet.read bookmark.write mute.read follows.write",
 "refresh_token": "WE9SRHduU1FSLVhnSDFSRHBCR19pbHRLVVp0YS1XdDdIMG9UNXpvNU1JR2w5OjE3MjgyODA4MDM3NDg6MToxOnJ0OjE"
}
```
