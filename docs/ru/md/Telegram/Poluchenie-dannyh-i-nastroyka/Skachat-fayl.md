---
sidebar_position: 2
---

# Скачать файл
 Скачивает файл с серверов Telegram


*Функция СкачатьФайл(Знач Токен, Знач IDФайла) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDФайла | --fileid | Строка | ID файла для скачивания |

  
  Вовзращаемое значение:   ДвоичныеДанные - файл

```bsl title="Пример кода"
	
  IDФайла = "AgACAgIAAxkDAAIQYWY3Q1ubH6cv7c65T03-ZZm8SQcTAAKW1TEb3k7BScPgfLssKiXkAQADAgADcwADNQQ";
  Ответ = OPI_Telegram.СкачатьФайл(Токен, IDФайла); //Двоичные данные
	
```

```sh title="Пример команд CLI"
    
  oint telegram СкачатьФайл --token %token% --fileid "AgACAgIAAxkDAAIQYWY3Q1ubH6cv7c65T03-ZZm8SQcTAAKW1TEb3k7BScPgfLssKiXkAQADAgADcwADNQQ"

```


```json title="Результат"

Двоичные данные

```
