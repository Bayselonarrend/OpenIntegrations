---
sidebar_position: 2
---

# Изменить заказ
 Изменяет значения полей выбранного заказа



`Функция ИзменитьЗаказ(Знач Токен, Знач UUID, Знач ОписаниеЗаказа, Знач ТестовыйAPI = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен авторизации |
  | UUID | --uuid | Строка | UUID заказа для изменение |
  | ОписаниеЗаказа | --order | Структура Из КлючИЗначение | Набор изменяемых полей заказа |
  | ТестовыйAPI | --testapi | Булево | Флаг использования API для тестовых запросов |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK

<br/>

:::tip
Метод в документации API: [Изменение заказа](https://api-docs.cdek.ru/36981178.html)
:::
<br/>


```bsl title="Пример кода"
    Токен = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg2ODEyNjEsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJhY2NvdW50LWxhbmc6cnVzIiwiY29udHJhY3Q60JjQnC3QoNCkLdCT0JvQky0yMiIsImFwaS12ZXJzaW9uOjEuMSIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJzb2xpZC1hZGRyZ...";
    UUID  = "f1799065-01de-448c-91cf-8afe7d4c0cfc";

    ОписаниеЗаказа = Новый Структура("comment", "Новый комментарий");

    Результат = OPI_CDEK.ИзменитьЗаказ(Токен, UUID, ОписаниеЗаказа, Истина);
```



```sh title="Пример команды CLI"
    
oint cdek ИзменитьЗаказ --token "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg2ODEyNjEsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJhY2NvdW50LWxhbmc6cnVzIiwiY29udHJhY3Q60JjQnC3QoNCkLdCT0JvQky0yMiIsImFwaS12ZXJzaW9uOjEuMSIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJzb2xpZC1hZGRyZ..." --uuid "f1799065-01de-448c-91cf-8afe7d4c0cfc" --order %order% --testapi %testapi%

```

```json title="Результат"

```
