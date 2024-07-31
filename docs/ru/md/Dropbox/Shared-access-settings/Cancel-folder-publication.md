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
  Токен  = "sl.B5DKxgWeuOJQRiKaP3qEV_mcJXoc4byIFf1vAj1olHf6D9wUJRhHVWbXWZwmUYId6zZCWSPgiO...";
  Папка  = "4999224241";
  
  Результат     = OPI_Dropbox.ОтменитьПубликациюПапки(Токен, Папка);
  ТекущийСтатус = "in_progress";
  IDРаботы      = Результат["async_job_id"];
  
  Пока ТекущийСтатус = "in_progress" Цикл
  Результат      = OPI_Dropbox.ПолучитьСтатусАсинхронногоИзменения(Токен, IDРаботы);
  ТекущийСтатус  = Результат[".tag"];
  OPI_Инструменты.Пауза(3);
  КонецЦикла;
```
	


```sh title="Пример команды CLI"
    
  oint dropbox ОтменитьПубликациюПапки --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --folder %folder%

```

```json title="Результат"
{
 ".tag": "complete"
}
```
