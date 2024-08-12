---
sidebar_position: 5
---

# Получить элемент чеклиста задачи
 Получить элемент чеклиста задачи по ID



`Функция ПолучитьЭлементЧеклистаЗадачи(Знач URL, Знач IDЗадачи, Знач IDЭлемента, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число, Строка | ID задачи |
  | IDЭлемента | --element | Число, Строка | ID элемента для получения |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.checklistitem.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/get.php)
:::
<br/>


```bsl title="Пример кода"
  URL        = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
  IDЗадачи   = "1078";
  IDЭлемента = "396";
  
  Результат = OPI_Bitrix24.ПолучитьЭлементЧеклистаЗадачи(URL, IDЗадачи, IDЭлемента);
  
  IDЗадачи   = "1080";
  IDЭлемента = "400";
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "fe3fa966006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ПолучитьЭлементЧеклистаЗадачи(URL, IDЗадачи, IDЭлемента, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьЭлементЧеклистаЗадачи --url %url% --task %task% --element %element% --token %token%

```

```json title="Результат"
{
 "result": {
  "ID": "96",
  "TASK_ID": "632",
  "PARENT_ID": "94",
  "CREATED_BY": "1",
  "TITLE": "Новый текст пункта чек-листа",
  "SORT_INDEX": "1",
  "IS_COMPLETE": "N",
  "IS_IMPORTANT": "N",
  "TOGGLED_BY": null,
  "TOGGLED_DATE": "",
  "MEMBERS": [],
  "ATTACHMENTS": []
 },
 "time": {
  "start": 1720816508.81324,
  "finish": 1720816508.85536,
  "duration": 0.0421209335327148,
  "processing": 0.0174088478088379,
  "date_start": "2024-07-12T20:35:08+00:00",
  "date_finish": "2024-07-12T20:35:08+00:00",
  "operating_reset_at": 1720817108,
  "operating": 0
 }
}
```
