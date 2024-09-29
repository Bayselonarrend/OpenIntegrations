---
sidebar_position: 4
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

:::tip
Метод в документации API: [task.stages.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_get.php)
:::
<br/>


```bsl title="Пример кода"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПолучитьСтадииКанбана(URL, , Истина);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "c3abf666006e9f06006b12e400000001000...";

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
...
```
