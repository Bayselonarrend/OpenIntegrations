---
sidebar_position: 7
---

# Удалить объект
 Удаляет объект с облачного диска


*Функция УдалитьОбъект(Знач Токен, Знач Путь, Знач Безвозвратно = Ложь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту удаления |
  | БезВозвратно | --permanently | Строка | Удалить объект без возможности востановления |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Путь      = "/New/pic.png";  
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";  
    
    Результат = OPI_Dropbox.УдалитьОбъект(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox УдалитьОбъект --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --path %path% --permanently %permanently%

```


```json title="Результат"



```
