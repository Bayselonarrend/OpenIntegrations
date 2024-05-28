---
sidebar_position: 6
---

# Получить статус загрузки по URL
 Получает статус загрузки файла по URL


*Функция ПолучитьСтатусЗагрузкиПоURL(Знач Токен, Знач IDРаботы) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDРаботы | --job | Строка | ID асинхронной работы из ответа ЗагрузитьФайлПоURL |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен    = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    ИДРаботы = "mTzF6hWsswAAAAAAAAAAAQ";
    Статус   = "in_progress";    
    
    Пока Статус = "in_progress" Цикл 
        
        Результат = OPI_Dropbox.ПолучитьСтатусЗагрузкиПоURL(Токен, ИДРаботы);
        Статус    = Результат[".tag"];
        
        OPI_Инструменты.Пауза(5);
        
        OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ПолучитьСтатусЗагрузкиПоURL");
        
    КонецЦикла;

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьСтатусЗагрузкиПоURL --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --job %job%

```


```json title="Результат"



```
