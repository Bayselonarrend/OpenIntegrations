﻿---
sidebar_position: 4
---

# Получить список сделок
 Получает список сделок (50 шт. за запрос максимум) с фильтром или без (см. ПолучитьСтруктуруФильтраСделок)



`Функция ПолучитьСписокСделок(Знач URL, Знач Фильтр = "", Знач Отступ = 0, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Фильтр | --filter | Структура из КлючИЗначение | Структура отбора сделок (см. ПолучитьСтруктуруФильтраСделок) |
  | Отступ | --offset | Число, Строка | Отступ от начала списка для получения сделок > 50 шт. рекурсивно |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrix24

<br/>

:::tip
Метод в документации API: [crm.deal.list](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_list.php)
:::
<br/>


```bsl title="Пример кода"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПолучитьСписокСделок(URL);

    URL    = "b24-ar17wx.bitrix24.by";
    Токен  = "6476c766006e9f06006b12e400000001000...";

    Фильтр = Новый Структура;
    Фильтр.Вставить("TITLE"      , "Продажа в RUB");
    Фильтр.Вставить("CURRENCY_ID", "RUB");

    Результат = OPI_Bitrix24.ПолучитьСписокСделок(URL, Фильтр, , Токен);
```



```sh title="Пример команды CLI"
    
oint bitrix24 ПолучитьСписокСделок --url "b24-ar17wx.bitrix24.by" --filter %filter% --offset %offset% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Результат"

```