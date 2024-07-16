﻿---
sidebar_position: 3
---

# Удалить элемент чеклиста задачи
 Удаляет элемент из чеклиста задачи



`Функция УдалитьЭлементЧеклистаЗадачи(Знач URL, Знач IDЗадачи, Знач IDЭлемента, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число, Строка | ID задачи |
  | IDЭлемента | --element | Число, Строка | ID элемента для удаления |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.checklistitem.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/delete.php)
:::
<br/>


```bsl title="Пример кода"
  URL        = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDЗадачи   = "720";
  IDЭлемента = "164";
  
  Результат = OPI_Bitrix24.УдалитьЭлементЧеклистаЗадачи(URL, IDЗадачи, IDЭлемента);
  
  
  IDЗадачи   = "722";
  IDЭлемента = "168";
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "adf89366006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.УдалитьЭлементЧеклистаЗадачи(URL, IDЗадачи, IDЭлемента, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 УдалитьЭлементЧеклистаЗадачи --url %url% --task %task% --element %element% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1720816512.25818,
  "finish": 1720816512.30984,
  "duration": 0.0516610145568848,
  "processing": 0.0264489650726318,
  "date_start": "2024-07-12T20:35:12+00:00",
  "date_finish": "2024-07-12T20:35:12+00:00",
  "operating_reset_at": 1720817112,
  "operating": 0
 }
}
```