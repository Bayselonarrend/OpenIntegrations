---
sidebar_position: 4
---

# Получить информацию об аккаунте
 Получает информацию об аккаунте


*Функция ПолучитьИнформациюОбАккаунте(Знач Токен, Знач Аккаунт = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Аккаунт | --account | Строка | ID аккаунта. Текущий аккаунт токена, если не заполнено |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    
    Результат = OPI_Dropbox.ПолучитьИнформациюОбАккаунте(Токен);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьИнформациюОбАккаунте --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --account %account%

```


```json title="Результат"



```
