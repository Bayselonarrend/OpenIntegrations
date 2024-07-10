---
sidebar_position: 2
---

# Получить токен
 Полеучает токен на основе кода со страницы ПолучитьСсылкуАвторизации


<br/>


`Функция ПолучитьТокен(Знач КлючПриложения, Знач СекретПриложения, Знач Код) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | КлючПриложения | --appkey | Строка | Ключ приложения |
  | СекретПриложения | --appsecret | Строка | Секрет приложения |
  | Код | --code | Строка | Код со страницы авторизации |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox





```bsl title="Пример кода"
  КлючПриложения   = "oynqxds...";
  СекретПриложения = "tk2oewn...";
  Код              = "bTCiUTzxe6kAAAAAAAAAGN1NMZIxyqETKr4o7OS2dU8";
  
  Результат = OPI_Dropbox.ПолучитьТокен(КлючПриложения, СекретПриложения, Код);
```
	


```sh title="Пример команды CLI"
    
  oint dropbox ПолучитьТокен --appkey "oynqxds..." --appsecret "tk2oewn..." --code "bTCiUTzxe6kAAAAAAAAAGN1NMZIxyqETKr4o7OS2dU8"

```

```json title="Результат"
    {
 "error": "invalid_grant",
 "error_description": "code doesn't exist or has expired"
}
```
