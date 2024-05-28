---
sidebar_position: 2
---

# Отменить публикацию папки
 Отменяет режим общего доступа для каталога


*Функция ОтменитьПубликациюПапки(Знач Токен, Знач IDПапки) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDПапки | --folder | Строка | ID публичного каталога (shared folder ID) |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен  = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    Папка  = "4994236449";
 
    Результат = OPI_Dropbox.ОтменитьПубликациюПапки(Токен, Папка);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ОтменитьПубликациюПапки --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --folder %folder%

```


```json title="Результат"



```
