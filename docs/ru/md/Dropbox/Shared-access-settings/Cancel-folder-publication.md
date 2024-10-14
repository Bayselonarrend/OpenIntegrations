---
sidebar_position: 2
---

# Отменить публикацию папки
 Отменяет режим общего доступа для каталога



`Функция ОтменитьПубликациюПапки(Знач Токен, Знач IDПапки) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDПапки | --folder | Строка | ID публичного каталога (shared folder ID) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен  = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";
    Папка  = "11727195745";

    Результат     = OPI_Dropbox.ОтменитьПубликациюПапки(Токен, Папка);
```



```sh title="Пример команды CLI"
    
  oint dropbox ОтменитьПубликациюПапки --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --folder %folder%

```

```json title="Результат"
{
 ".tag": "async_job_id",
 "async_job_id": "dbjid:AADtwNfCN9W_5zHUPzHqUjDmmt1pFYi933Ij6TGpKSjgMzZpJsSyyGwalhvYCzHMZeCmjajZBlgvLOqk0jscPd5m"
}
```
