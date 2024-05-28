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

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
    IDФайла = "CQACAgIAAx0EcNsaZQACEZRmUbbz_bhDX_wPiSnMclSID6CD7wACC00AAoaTiEpOTiNykV_72zUE";
    Токен   = "6129457865:AAFyzNYOAFbu...";

    Результат = OPI_Telegram.СкачатьФайл(Токен, IDФайла);

	
```

```sh title="Пример команд CLI"
    
  oint telegram СкачатьФайл --token "6129457865:AAFyzNYOAFbu..." --fileid "CQACAgIAAx0EcNsaZQACEZRmUbbz_bhDX_wPiSnMclSID6CD7wACC00AAoaTiEpOTiNykV_72zUE"

```


```json title="Результат"



```
