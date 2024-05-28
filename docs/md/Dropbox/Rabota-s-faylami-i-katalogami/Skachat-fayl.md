---
sidebar_position: 11
---

# Скачать файл
 Скачивает файл по указанному пути или ID


*Функция СкачатьФайл(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь или ID файла |

  
  Вовзращаемое значение:   ДвоичныеДанные - двоичные данные файла

```bsl title="Пример кода"
	
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    Путь      = "/New/pic.png"; 
    
    Результат = OPI_Dropbox.СкачатьФайл(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox СкачатьФайл --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --path %path%

```


```json title="Результат"



```
