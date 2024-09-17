---
sidebar_position: 6
---

# Установить скидку на уцененный товар
 Устанавливает размер скидки на уценённые товары, продающиеся по схеме FBS



`Функция УстановитьСкидкуНаУцененныйТовар(Знач IDКлиента, Знач КлючAPI, Знач IDТовара, Знач Скидка) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDТовара | --productid | Строка, Число | Идентификатор товара |
  | Скидка | --discount | Строка, Число | Размер скидки |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/product/update/discount](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUpdateDiscount)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента    = ПараметрыФункции["Ozon_ClientID"];
    КлючAPI      = ПараметрыФункции["Ozon_ApiKey"];
    IDТовара     = 1156646653;

    Скидка = 10;

    Результат = OPI_Ozon.УстановитьСкидкуНаУцененныйТовар(IDКлиента, КлючAPI, IDТовара, Скидка);
```



```sh title="Пример команды CLI"
    
  oint ozon УстановитьСкидкуНаУцененныйТовар --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid %productid% --discount %discount%

```

```json title="Результат"
{
 "code": 5,
 "message": "item discount not found",
 "details": []
}
```
