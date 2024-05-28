---
sidebar_position: 12
---

# Скачать папку
 Скачивает zip архив с содержимым указанного каталога


*Функция СкачатьПапку(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь или ID каталога |

  
  Вовзращаемое значение:   ДвоичныеДанные - двоичные данные zip архива с содержимым каталога

```bsl title="Пример кода"
	
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    Путь      = "/New";
    
    Результат = OPI_Dropbox.СкачатьПапку(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox СкачатьПапку --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --path %path%

```


```json title="Результат"



```
