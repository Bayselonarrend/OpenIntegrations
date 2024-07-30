---
sidebar_position: 3
---

# Покинуть чат
 Исключает текущего пользователя из чата



`Функция ПокинутьЧат(Знач URL, Знач IDЧата, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.chat.leave](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12101)
:::
<br/>


```bsl title="Пример кода"
  URL     = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDЧата  = "264";
  
  Результат = OPI_Bitrix24.ПокинутьЧат(URL, IDЧата);
  
  
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "adf89366006e9f06006b12e400000001000...";
  IDЧата    = "266";
  
  Результат = OPI_Bitrix24.ПокинутьЧат(URL, IDЧата, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПокинутьЧат --url %url% --chat %chat% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1720816599.74716,
  "finish": 1720816599.81746,
  "duration": 0.0702948570251465,
  "processing": 0.0438079833984375,
  "date_start": "2024-07-12T20:36:39+00:00",
  "date_finish": "2024-07-12T20:36:39+00:00",
  "operating_reset_at": 1720817199,
  "operating": 0
 }
}
```
