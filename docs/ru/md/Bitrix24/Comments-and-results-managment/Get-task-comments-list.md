---
sidebar_position: 1
---

# Получить список комментариев задачи
 Полчает список комментариев пользователей к задаче по ID



`Функция ПолучитьСписокКомментариевЗадачи(Знач URL, Знач IDЗадачи, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число, Строка | ID задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.commentitem.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/getlist.php)
:::
<br/>


```bsl title="Пример кода"
    URL         = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи    = "1398";

    Результат = OPI_Bitrix24.ПолучитьСписокКомментариевЗадачи(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "6476c766006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСписокКомментариевЗадачи(URL, IDЗадачи, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСписокКомментариевЗадачи --url %url% --task %task% --filter %filter% --token %token%

```

```json title="Результат"
{
 "result": [
  {
   "POST_MESSAGE_HTML": null,
   "ID": "1494",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-07-06T19:52:07+00:00",
   "POST_MESSAGE": "Задача изменена, не расходимся"
  },
  {
   "POST_MESSAGE_HTML": null,
   "ID": "1496",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-07-06T19:52:08+00:00",
   "POST_MESSAGE": "Задача изменена, расходимся"
  }
 ],
 "time": {
  "start": 1720295537.77876,
  "finish": 1720295537.83513,
  "duration": 0.0563700199127197,
  "processing": 0.0240809917449951,
  "date_start": "2024-07-06T19:52:17+00:00",
  "date_finish": "2024-07-06T19:52:17+00:00",
  "operating_reset_at": 1720296137,
  "operating": 0
 }
}
```
