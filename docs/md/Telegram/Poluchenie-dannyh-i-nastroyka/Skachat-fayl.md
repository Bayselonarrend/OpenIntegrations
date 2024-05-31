---
sidebar_position: 5
---

# Скачать файл
 Скачивает файл с серверов Telegram


*Функция СкачатьФайл(Знач Токен, Знач IDФайла) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDФайла | --fileid | Строка | ID файла для скачивания |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
    IDФайла = "CQACAgIAAx0EcNsaZQACEgRmVgMIOr9Q0NEt9l4OXJuwUgbl-wAC3kYAAnFFsUp2dLSNM3JeRjUE";
    Токен   = "6129457865:AAFyzNYOAFbu...";

    Результат = OPI_Telegram.СкачатьФайл(Токен, IDФайла);

	
```

```sh title="Пример команд CLI"
    
  oint telegram СкачатьФайл --token "6129457865:AAFyzNYOAFbu..." --fileid "CQACAgIAAx0EcNsaZQACEgRmVgMIOr9Q0NEt9l4OXJuwUgbl-wAC3kYAAnFFsUp2dLSNM3JeRjUE"

```


```json title="Результат"

НЕ JSON: 49 44 33 03 00 00 00 05 1F 76 54 49 54 32 00 00 00 0B 00 00 01 FF FE 44 00 6F 00 67 00 73 00 54 50 45 31 00 00 00 15 00 00 01 FF FE 4D 00 6F 00 74 00 6F 00 72 00 68 00 65 00 61 00 64 00 54 59…

```
