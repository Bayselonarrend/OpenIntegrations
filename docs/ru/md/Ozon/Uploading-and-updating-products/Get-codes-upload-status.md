---
sidebar_position: 19
---

# Получить статус добавления кодов
 Получает статус добавления кодов цифрового товара по ID задачи



`Функция ПолучитьСтатусДобавленияКодов(Знач IDКлиента, Знач КлючAPI, Знач IDЗадачи) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDЗадачи | --taskid | Строка, Число | ID задачи добавления товара |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/product/upload_digital_codes/info](https://docs.ozon.ru/api/seller/#operation/ProductAPI_UploadDigitalCodeInfo)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента  = "2128753";
    КлючAPI    = "7cc90d26-33e4-499b...";
    IDЗадачи   = "";

    Результат  = OPI_Ozon.ПолучитьСтатусДобавленияКодов(IDКлиента, КлючAPI, IDЗадачи);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьСтатусДобавленияКодов --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --taskid %taskid%

```

```json title="Результат"
{
 "code": 5,
 "message": "Upload task not found",
 "details": []
}
```
