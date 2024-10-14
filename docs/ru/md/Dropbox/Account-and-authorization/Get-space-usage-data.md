---
sidebar_position: 5
---

# Получить данные использования пространства
 Получает информацию о количестве использованного дискового пространства



`Функция ПолучитьДанныеИспользованияПространства(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";

    Результат = OPI_Dropbox.ПолучитьДанныеИспользованияПространства(Токен);
```



```sh title="Пример команды CLI"
    
  oint dropbox ПолучитьДанныеИспользованияПространства --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..."

```

```json title="Результат"
{
 "used": 1477704605,
 "allocation": {
  ".tag": "individual",
  "allocated": 2147483648
 }
}
```
