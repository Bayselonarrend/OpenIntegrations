---
sidebar_position: 1
---

# Получить список складов
 Получает список складов компании



`Функция ПолучитьСписокСкладов(Знач IDКлиента, Знач КлючAPI) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/warehouse/list](https://docs.ozon.ru/api/seller/#operation/WarehouseAPI_WarehouseList)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента     = ПараметрыФункции["Ozon_ClientID"];
    КлючAPI       = ПараметрыФункции["Ozon_ApiKey"];

    Результат = OPI_Ozon.ПолучитьСписокСкладов(IDКлиента, КлючAPI);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьСписокСкладов --clientid "2128753" --apikey "7cc90d26-33e4-499b..."

```

```json title="Результат"
{
 "result": []
}
```
