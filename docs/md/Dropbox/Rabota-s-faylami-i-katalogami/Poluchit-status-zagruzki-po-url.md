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
	
    Токен    = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";
    ИДРаботы = "kwvJIcRS7eAAAAAAAAAAAQ";
    Статус   = "in_progress";    
    
    Пока Статус = "in_progress" Цикл 
        
        Результат = OPI_Dropbox.ПолучитьСтатусЗагрузкиПоURL(Токен, ИДРаботы);
        Статус    = Результат[".tag"];
        
        OPI_Инструменты.Пауза(5);
        
        OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ПолучитьСтатусЗагрузкиПоURL", "Dropbox");
        
    КонецЦикла;

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьСтатусЗагрузкиПоURL --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --job %job%

```


```json title="Результат"



```
