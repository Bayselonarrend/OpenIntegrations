---
sidebar_position: 1
---

# Сформировать ссылку получения кода
 Возвращает URL для авторизации в браузере


*Функция СформироватьСсылкуПолученияКода(Знач ClientID, Знач Calendar = Истина, Знач Drive = Истина, Знач Sheets = Истина) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | ClientID | --id | Строка | Client ID |
  | Calendar | --calendar | Булево | разрешение на методы Calendar |
  | Drive | --drive | Булево | разрешение на методы Drive |
  | Sheets | --sheets | Булево | разрешение на методы Sheets |

  
  Вовзращаемое значение:   Строка - Ссылка получения кода

```bsl title="Пример кода"
	

  Ответ = OPI_GoogleWorkspace.СформироватьСсылкуПолученияКода(ClientID, Calendar, Drive, Sheets); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ); //JSON строка
	
```

```sh title="Пример команд CLI"
    
  oint google СформироватьСсылкуПолученияКода --id %id% --calendar %calendar% --drive %drive% --sheets %sheets%

```


```json title="Результат"



```
