---
sidebar_position: 8
---

# Копировать объект
 Копирует файл или каталог по выбранному пути


*Функция КопироватьОбъект(Знач Токен, Знач Откуда, Знач Куда) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Откуда | --form | Строка | Путь к объекту оригинала |
  | Куда | --to | Строка | Целевой путь для нового объекта |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Оригинал  = "/New/pic.png";
    Копия     = "/New/pic_copy.png";  
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    
    Результат = OPI_Dropbox.КопироватьОбъект(Токен, Оригинал, Копия);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox КопироватьОбъект --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --form %form% --to %to%

```


```json title="Результат"



```
