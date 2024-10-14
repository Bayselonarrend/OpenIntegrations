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
    Токен     = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";
    IDРаботы  = "dbjid:AACP-Bd0jYrnvlGEezhk65FDN-1sAlXg1FmEfjWibO2qt3sc3Yca2HQhzQuHu7aSqBCdN2pmgpS2ZUd8RkM2Yu8J";

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
