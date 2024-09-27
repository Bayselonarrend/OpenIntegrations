﻿---
sidebar_position: 5
---

# Скачать файл
 Скачивает файл с серверов Telegram



`Функция СкачатьФайл(Знач Токен, Знач IDФайла) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDФайла | --fileid | Строка | ID файла для скачивания |

  
  Возвращаемое значение:   ДвоичныеДанные - данные файла

<br/>




```bsl title="Пример кода"
    IDФайла = "CQACAgIAAx0EcNsaZQACImZm9pPui9hMzeHjDGBJNv2_bVwSJwAC4VwAAskduUsOtQWU6xUwOzYE";
    Токен   = "6129457865:AAFyzNYOAFbu...";

    Результат = OPI_Telegram.СкачатьФайл(Токен, IDФайла);
```



```sh title="Пример команды CLI"
    
  oint telegram СкачатьФайл --token "6129457865:AAFyzNYOAFbu..." --fileid "AgACAgIAAx0EcNsaZQACE1lmXraQ7CsFNZ2Jrqimp9A0ir3mQQACmtkxG77-sUoMcnd_RvALsgEAAwIAA3MAAzUE"

```

```json title="Результат"
<Двоичные данные файла>
```
