﻿---
sidebar_position: 6
---

# Выполнить элемент чеклиста задачи
 Помечает элемент чеклиста задачи как выполненный



`Функция ВыполнитьЭлементЧеклистаЗадачи(Знач URL, Знач IDЗадачи, Знач IDЭлемента, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число, Строка | ID задачи |
  | IDЭлемента | --element | Число, Строка | ID элемента |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.checklistitem.complete](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/complete.php)
:::
<br/>


```bsl title="Пример кода"
    URL        = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи   = "2262";
    IDЭлемента = "1344";

    Результат = OPI_Bitrix24.ВыполнитьЭлементЧеклистаЗадачи(URL, IDЗадачи, IDЭлемента);

    IDЗадачи   = "2264";
    IDЭлемента = "1348";

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ВыполнитьЭлементЧеклистаЗадачи(URL, IDЗадачи, IDЭлемента, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ВыполнитьЭлементЧеклистаЗадачи --url %url% --task %task% --element %element% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1728409732.20665,
  "finish": 1728409732.26204,
  "duration": 0.0553958415985107,
  "processing": 0.0293397903442383,
  "date_start": "2024-10-08T20:48:52+03:00",
  "date_finish": "2024-10-08T20:48:52+03:00",
  "operating_reset_at": 1728410332,
  "operating": 0
 }
}
```
