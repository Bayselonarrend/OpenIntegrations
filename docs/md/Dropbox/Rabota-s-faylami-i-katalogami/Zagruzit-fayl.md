---
sidebar_position: 4
---

# Загрузить файл
 Загружает файл на облачный диск


*Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач Путь, Знач Перезаписывать = Ложь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Файл | --file | Строка, ДвоичныеДанные | Данные файл для загрузки |
  | Путь | --path | Строка | Путь сохранения на Dropbox |
  | Перезаписывать | --overwrite | Булево | Перезаписывать файл при конфликте путей |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox 

```bsl title="Пример кода"
	
    Путь      = "/New/pic.png";  
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    Картинка  = "https://openintegrations.dev/test_data/picture.jpg";
    
    КартинкаПуть = ПолучитьИмяВременногоФайла("png");
    КопироватьФайл(Картинка, КартинкаПуть);
    
    Результат = OPI_Dropbox.ЗагрузитьФайл(Токен, КартинкаПуть, Путь, Истина);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ЗагрузитьФайл --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --file %file% --path %path% --overwrite %overwrite%

```


```json title="Результат"



```
