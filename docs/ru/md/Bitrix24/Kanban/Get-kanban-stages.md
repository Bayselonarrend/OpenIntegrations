---
sidebar_position: 3
---

# Получить стадии канбана
 Получает информацию о стадиях Канбана или Моего плана



`Функция ПолучитьСтадииКанбана(Знач URL, Знач IDСущности = 0, Знач КакАдминистратор = Ложь, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDСущности | --entityid | Строка, Число | ID группы или пользователя владельца канбан. Свой по умолчанию |
  | КакАдминистратор | --admin | Булево | Позволяет получать стадии без проверки прав (для администраторов) |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>




```bsl title="Пример кода"
  URL       = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.ПолучитьСтадииКанбана(URL, , Истина);
  
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "56898d66006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ПолучитьСтадииКанбана(URL, , , Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСтадииКанбана --url "b24-ar17wx.bitrix24.by" --entityid %entityid% --admin %admin% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "20": {
   "ID": "20",
   "TITLE": "Новая стадия",
   "SORT": "100",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "NEW",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "24": {
   "ID": "24",
   "TITLE": "Название",
   "SORT": "200",
   "COLOR": "75d900",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "16": {
   "ID": "16",
   "TITLE": "Новая стадия",
   "SORT": "300",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "18": {
   "ID": "18",
   "TITLE": "Новая стадия 2",
   "SORT": "400",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "12": {
   "ID": "12",
   "TITLE": "Новая стадия",
   "SORT": "500",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "14": {
   "ID": "14",
   "TITLE": "Новая стадия 2",
   "SORT": "600",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "8": {
   "ID": "8",
   "TITLE": "Новая стадия",
   "SORT": "700",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "10": {
   "ID": "10",
   "TITLE": "Новая стадия 2",
   "SORT": "800",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "6": {
   "ID": "6",
   "TITLE": "Новая стадия",
   "SORT": "900",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "130": {
   "ID": "130",
   "TITLE": "Новая стадия",
   "SORT": "1000",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "132": {
   "ID": "132",
   "TITLE": "Новая стадия 2",
   "SORT": "1100",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "122": {
   "ID": "122",
   "TITLE": "Новая стадия",
   "SORT": "1200",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "124": {
   "ID": "124",
   "TITLE": "Новая стадия 2",
   "SORT": "1300",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "120": {
   "ID": "120",
   "TITLE": "Новая стадия 2",
   "SORT": "1400",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "114": {
   "ID": "114",
   "TITLE": "Новая стадия",
   "SORT": "1500",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "116": {
   "ID": "116",
   "TITLE": "Новая стадия 2",
   "SORT": "1600",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "112": {
   "ID": "112",
   "TITLE": "Новая стадия 2",
   "SORT": "1700",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "108": {
   "ID": "108",
   "TITLE": "Новая стадия 2",
   "SORT": "1800",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "104": {
   "ID": "104",
   "TITLE": "Новая стадия 2",
   "SORT": "1900",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "100": {
   "ID": "100",
   "TITLE": "Новая стадия 2",
   "SORT": "2000",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "96": {
   "ID": "96",
   "TITLE": "Новая стадия 2",
   "SORT": "2100",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "90": {
   "ID": "90",
   "TITLE": "Новая стадия",
   "SORT": "2200",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "92": {
   "ID": "92",
   "TITLE": "Новая стадия 2",
   "SORT": "2300",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "74": {
   "ID": "74",
   "TITLE": "Новая стадия",
   "SORT": "2400",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "76": {
   "ID": "76",
   "TITLE": "Новая стадия 2",
   "SORT": "2500",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "70": {
   "ID": "70",
   "TITLE": "Новая стадия",
   "SORT": "2600",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "72": {
   "ID": "72",
   "TITLE": "Новая стадия 2",
   "SORT": "2700",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "66": {
   "ID": "66",
   "TITLE": "Новая стадия",
   "SORT": "2800",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "68": {
   "ID": "68",
   "TITLE": "Новая стадия 2",
   "SORT": "2900",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "62": {
   "ID": "62",
   "TITLE": "Новая стадия",
   "SORT": "3000",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "64": {
   "ID": "64",
   "TITLE": "Новая стадия 2",
   "SORT": "3100",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "46": {
   "ID": "46",
   "TITLE": "Новая стадия",
   "SORT": "3200",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "48": {
   "ID": "48",
   "TITLE": "Новая стадия 2",
   "SORT": "3300",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "42": {
   "ID": "42",
   "TITLE": "Новая стадия",
   "SORT": "3400",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "44": {
   "ID": "44",
   "TITLE": "Новая стадия 2",
   "SORT": "3500",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "38": {
   "ID": "38",
   "TITLE": "Новая стадия",
   "SORT": "3600",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "40": {
   "ID": "40",
   "TITLE": "Новая стадия 2",
   "SORT": "3700",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "34": {
   "ID": "34",
   "TITLE": "Новая стадия",
   "SORT": "3800",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "36": {
   "ID": "36",
   "TITLE": "Новая стадия 2",
   "SORT": "3900",
   "COLOR": "0026FF",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "2": {
   "ID": "2",
   "TITLE": "Не спланированы",
   "SORT": "4000",
   "COLOR": "00C4FB",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  },
  "4": {
   "ID": "4",
   "TITLE": "Сделаю на неделе",
   "SORT": "4100",
   "COLOR": "47D1E2",
   "SYSTEM_TYPE": "",
   "ENTITY_ID": "1",
   "ENTITY_TYPE": "U",
   "ADDITIONAL_FILTER": [],
   "TO_UPDATE": [],
   "TO_UPDATE_ACCESS": null
  }
 },
 "time": {
  "start": 1720600362.36054,
  "finish": 1720600362.39851,
  "duration": 0.0379610061645508,
  "processing": 0.00239396095275879,
  "date_start": "2024-07-10T08:32:42+00:00",
  "date_finish": "2024-07-10T08:32:42+00:00",
  "operating_reset_at": 1720600962,
  "operating": 0
 }
}
```
