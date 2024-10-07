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
    Токен  = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Папка  = "11496030465";

    Результат     = OPI_Dropbox.ОтменитьПубликациюПапки(Токен, Папка);
```



```sh title="Пример команды CLI"
    
  oint dropbox ОтменитьПубликациюПапки --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --folder %folder%

```

```json title="Результат"
{
 ".tag": "async_job_id",
 "async_job_id": "dbjid:AACGMJZb5XpAY4Wngz5kaqNLyhp6k-c0kYr_Wn6RFbxsAM25-uNaOJWbqMAWej0Dr12hMkiAhioUbkvZ_M1W1_MV"
}
```
