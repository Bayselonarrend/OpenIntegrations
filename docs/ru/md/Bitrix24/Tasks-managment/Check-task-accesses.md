---
sidebar_position: 20
---

# Проверить доступ к задаче
 Проверяет доступность задачи для пользователей


<br/>


`Функция ПроверитьДоступКЗадаче(Знач URL, Знач IDЗадачи, Знач Пользователи = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | Пользователи | --users | Массив из Строка | ID пользователей для проверки доступа |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>




```bsl title="Пример кода"
  МассивПользователей = Новый Массив;
  МассивПользователей.Добавить("1");
  МассивПользователей.Добавить("10");
  
  URL      = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDЗадачи = "500";
  
  Результат = OPI_Bitrix24.ПроверитьДоступКЗадаче(URL, IDЗадачи, МассивПользователей);
  
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "56898d66006e9f06006b12e400000001000...";
  IDЗадачи  = "502";
  
  Результат = OPI_Bitrix24.ПроверитьДоступКЗадаче(URL, IDЗадачи, МассивПользователей, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПроверитьДоступКЗадаче --url "b24-ar17wx.bitrix24.by" --task "502" --users %users% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
    {
 "result": {
  "allowedActions": {
   "1": {
    "ACCEPT": false,
    "DECLINE": false,
    "COMPLETE": true,
    "APPROVE": false,
    "DISAPPROVE": false,
    "START": true,
    "PAUSE": false,
    "DELEGATE": true,
    "REMOVE": true,
    "EDIT": true,
    "DEFER": true,
    "RENEW": false,
    "CREATE": true,
    "CHANGE_DEADLINE": true,
    "CHECKLIST_ADD_ITEMS": true,
    "ADD_FAVORITE": true,
    "DELETE_FAVORITE": false,
    "RATE": true,
    "EDIT.ORIGINATOR": false,
    "CHECKLIST.REORDER": true,
    "ELAPSEDTIME.ADD": true,
    "DAYPLAN.TIMER.TOGGLE": false,
    "EDIT.PLAN": true,
    "CHECKLIST.ADD": true,
    "FAVORITE.ADD": true,
    "FAVORITE.DELETE": false
   },
   "10": {
    "ACCEPT": false,
    "DECLINE": false,
    "COMPLETE": true,
    "APPROVE": false,
    "DISAPPROVE": false,
    "START": true,
    "PAUSE": false,
    "DELEGATE": true,
    "REMOVE": false,
    "EDIT": false,
    "DEFER": true,
    "RENEW": false,
    "CREATE": true,
    "CHANGE_DEADLINE": false,
    "CHECKLIST_ADD_ITEMS": true,
    "ADD_FAVORITE": true,
    "DELETE_FAVORITE": false,
    "RATE": false,
    "EDIT.ORIGINATOR": false,
    "CHECKLIST.REORDER": false,
    "ELAPSEDTIME.ADD": true,
    "DAYPLAN.TIMER.TOGGLE": false,
    "EDIT.PLAN": false,
    "CHECKLIST.ADD": true,
    "FAVORITE.ADD": true,
    "FAVORITE.DELETE": false
   }
  }
 },
 "time": {
  "start": 1720017732.79312,
  "finish": 1720017732.85673,
  "duration": 0.0636129379272461,
  "processing": 0.0308799743652344,
  "date_start": "2024-07-03T14:42:12+00:00",
  "date_finish": "2024-07-03T14:42:12+00:00",
  "operating_reset_at": 1720018332,
  "operating": 0
 }
}
```
