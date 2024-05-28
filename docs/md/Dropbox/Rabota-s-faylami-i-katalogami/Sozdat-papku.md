---
sidebar_position: 10
---

# Создать папку
 Создает пустой каталог по выбранному пути


*Функция СоздатьПапку(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Целевой путь создания каталога |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    Путь      = "/Новый каталог";
    
    Результат = OPI_Dropbox.СоздатьПапку(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox СоздатьПапку --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --path %path%

```


```json title="Результат"



```
