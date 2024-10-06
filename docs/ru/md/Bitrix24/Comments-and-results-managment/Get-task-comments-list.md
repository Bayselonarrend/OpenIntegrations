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
    IDЗадачи    = "2108";

    Результат = OPI_Bitrix24.ПолучитьСписокКомментариевЗадачи(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

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
   "ID": "5790",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-10-06T17:32:46+03:00",
   "POST_MESSAGE": "Задача изменена, не расходимся"
  },
  {
   "POST_MESSAGE_HTML": null,
   "ID": "5792",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-10-06T17:32:46+03:00",
   "POST_MESSAGE": "Задача изменена, расходимся"
  }
 ],
 "time": {
  "start": 1728225167.67628,
  "finish": 1728225167.71991,
  "duration": 0.0436251163482666,
  "processing": 0.0212640762329102,
  "date_start": "2024-10-06T17:32:47+03:00",
  "date_finish": "2024-10-06T17:32:47+03:00",
  "operating_reset_at": 1728225767,
  "operating": 0
 }
}
```
