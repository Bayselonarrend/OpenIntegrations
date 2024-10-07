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
   "ID": "5856",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-10-07T21:46:17+03:00",
   "POST_MESSAGE": "Задача изменена, не расходимся"
  },
  {
   "POST_MESSAGE_HTML": null,
   "ID": "5858",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-10-07T21:46:17+03:00",
   "POST_MESSAGE": "Задача изменена, расходимся"
  }
 ],
 "time": {
  "start": 1728326778.61186,
  "finish": 1728326778.6567,
  "duration": 0.0448379516601562,
  "processing": 0.0199069976806641,
  "date_start": "2024-10-07T21:46:18+03:00",
  "date_finish": "2024-10-07T21:46:18+03:00",
  "operating_reset_at": 1728327378,
  "operating": 0
 }
}
```
