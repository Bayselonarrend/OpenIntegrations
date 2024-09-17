---
sidebar_position: 2
---

# Получить доступные товары акции
 Получает товары, доступные в выбранной акции



`Функция ПолучитьДоступныеТоварыАкции(Знач IDКлиента, Знач КлючAPI, Знач IDАкции, Знач Отступ = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDАкции | --actionid | Число | ID акции |
  | Отступ | --offset | Число | Отступ получения элементов списка |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/actions/candidates](https://docs.ozon.ru/api/seller/#operation/PromosCandidates)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента     = ПараметрыФункции["Ozon_ClientID"];
    КлючAPI       = ПараметрыФункции["Ozon_ApiKey"];
    IDАкции       = 111111111;

    Результат = OPI_Ozon.ПолучитьДоступныеТоварыАкции(IDКлиента, КлючAPI, IDАкции);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьДоступныеТоварыАкции --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --actionid %actionid% --offset %offset%

```

```json title="Результат"
{
 "code": 5,
 "message": "Resource not found",
 "details": []
}
```
