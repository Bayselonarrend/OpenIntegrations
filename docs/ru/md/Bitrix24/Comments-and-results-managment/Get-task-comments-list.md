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
    IDЗадачи    = "2450";

    Результат = OPI_Bitrix24.ПолучитьСписокКомментариевЗадачи(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "21750a67006e9f06006b12e400000001000...";

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
   "ID": "5900",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-10-08T20:48:58+03:00",
   "POST_MESSAGE": "Задача изменена, не расходимся"
  },
  {
   "POST_MESSAGE_HTML": null,
   "ID": "5902",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-10-08T20:48:58+03:00",
   "POST_MESSAGE": "Задача изменена, расходимся"
  }
 ],
 "time": {
  "start": 1728409740.22109,
  "finish": 1728409740.26842,
  "duration": 0.0473270416259766,
  "processing": 0.0240099430084228,
  "date_start": "2024-10-08T20:49:00+03:00",
  "date_finish": "2024-10-08T20:49:00+03:00",
  "operating_reset_at": 1728410340,
  "operating": 0
 }
}
```
