---
sidebar_position: 1
---

# Опубликовать папку
 Переводит каталог в режим публичного доступа


*Функция ОпубликоватьПапку(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к целевому каталогу |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    Путь      = "/New"; 
   
    Результат = OPI_Dropbox.ОпубликоватьПапку(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ОпубликоватьПапку --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --path %path%

```


```json title="Результат"



```
