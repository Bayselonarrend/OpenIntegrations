---
sidebar_position: 2
---

# Удалить лид
 Удаляет лид по ID



`Функция УдалитьЛид(Знач URL, Знач IDЛида, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЛида | --lead | Число, Строка | ID лида |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrix24

<br/>

:::tip
Метод в документации API: [crm.lead.delete](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_delete.php)
:::
<br/>


```bsl title="Пример кода"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЛида = "278";

    Результат = OPI_Bitrix24.УдалитьЛид(URL, IDЛида);

    URL    = "b24-ar17wx.bitrix24.by";
    Токен  = "37d1fe66006e9f06006b12e400000001000...";
    IDЛида = "280";

    Результат = OPI_Bitrix24.УдалитьЛид(URL, IDЛида, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 УдалитьЛид --url "b24-ar17wx.bitrix24.by" --lead %lead% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1728225307.02693,
  "finish": 1728225307.15703,
  "duration": 0.130099058151245,
  "processing": 0.104586839675903,
  "date_start": "2024-10-06T17:35:07+03:00",
  "date_finish": "2024-10-06T17:35:07+03:00",
  "operating_reset_at": 1728225907,
  "operating": 0.104566097259521
 }
}
```
