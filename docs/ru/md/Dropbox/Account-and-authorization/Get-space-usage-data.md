---
sidebar_position: 5
---

# Получить данные использования пространства
 Получает информацию о количестве использованного дискового пространства


<br/>


`Функция ПолучитьДанныеИспользованияПространства(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
  Токен = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
  
  Результат = OPI_Dropbox.ПолучитьДанныеИспользованияПространства(Токен);
```
	


```sh title="Пример команды CLI"
    
  oint dropbox ПолучитьДанныеИспользованияПространства --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..."

```

```json title="Результат"
{
 "used": 1477493597,
 "allocation": {
  ".tag": "individual",
  "allocated": 2147483648
 }
}
```
