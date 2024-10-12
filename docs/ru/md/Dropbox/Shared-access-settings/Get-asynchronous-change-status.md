---
sidebar_position: 5
---

# Получить статус асинхронного изменения
 Получает статус асинхронной работы по изменению доступов



`Функция ПолучитьСтатусАсинхронногоИзменения(Знач Токен, Знач IDРаботы) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDРаботы | --job | Строка | ID асинхронной работы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен     = "sl.B-q5XQaxJtwx0uMZIwtpBtvwgWmplxOVWNQyY1gbKG31NYy3fDHqe4IuADj33al8uD1l3FYARn...";
    IDРаботы  = "dbjid:AABFXDgwbQggiyOnRhhmSt5mv1e1wUaZTgSWf0QEmkH_ID0iNGoqboF2xvZdmGEUzFEPbztCB3chaMBS3k9NnsVc";

    Результат = OPI_Dropbox.ПолучитьСтатусАсинхронногоИзменения(Токен, IDРаботы);
```



```sh title="Пример команды CLI"
    
  oint dropbox ПолучитьСтатусАсинхронногоИзменения --token %token% --job %job%

```

```json title="Результат"
{
 ".tag": "complete"
}
```
