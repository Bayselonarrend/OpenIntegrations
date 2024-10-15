---
sidebar_position: 4
---

# Получить заказ
 Получает заказ по UUID



`Функция ПолучитьЗаказ(Знач Токен, Знач UUID, Знач ТестовыйAPI = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен авторизации |
  | UUID | --uuid | Строка | UUID заказа |
  | ТестовыйAPI | --testapi | Булево | Флаг использования API для тестовых запросов |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK

<br/>

:::tip
Метод в документации API: [Информация о заказе](https://api-docs.cdek.ru/29923975.html)
:::
<br/>


```bsl title="Пример кода"
    Токен = "...";
    UUID  = "";

    Результат = OPI_CDEK.ПолучитьЗаказ(Токен, UUID, Истина);
```
    



```json title="Результат"
{
 "entity": {
  "uuid": "0c6b403d-000a-4d64-a282-798607b5e01f",
  "type": 1,
  "number": "ddOererre7450813980068",
  "tariff_code": 139,
  "comment": "Новый заказ",
  "delivery_recipient_cost": {
   "value": 50
  },
  "delivery_recipient_cost_adv": [
   {
    "threshold": 200,
    "sum": 3000
   }
  ],
  "sender": {
   "name": "Петров Петр"
  },
  "recipient": {
   "name": "Иванов Иван",
   "phones": [
    {
     "number": "+79134637228"
    }
   ]
  },
  "from_location": {
   "code": 44,
   "city": "Москва",
   "address": "пр. Ленинградский, д.4"
  },
  "to_location": {
   "code": 270,
   "city": "Новосибирск",
   "address": "ул. Блюхера, 32"
  },
  "services": [
   {
    "code": "SECURE_PACKAGE_A2",
    "parameter": "10"
   }
  ],
  "packages": [
   {
    "number": "bar-001",
    "weight": 4000,
    "length": 10,
    "width": 10,
    "height": 10,
    "comment": "Упаковка",
    "items": [
     {
      "name": "Товар",
      "ware_key": "00055",
      "payment": {
       "value": 3000
      },
      "weight": 700,
      "amount": 2,
      "url": "www.item.ru",
      "cost": 300
     }
    ]
   }
  ],
  "statuses": [
   {
    "code": "ACCEPTED",
    "name": "Принят",
    "date_time": "2024-10-12T17:43:53+03:00",
    "city": "Офис СДЭК"
   }
  ]
 },
 "requests": [
  {
   "request_uuid": "8f4e5a29-7954-4f53-9b87-f8fe7573345e",
   "type": "CREATE",
   "date_time": "2024-10-12T17:43:53+03:00",
   "state": "ACCEPTED"
  }
 ],
 "related_entities": []
}
```
