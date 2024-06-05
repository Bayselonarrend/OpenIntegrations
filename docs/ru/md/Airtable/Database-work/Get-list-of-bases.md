---
sidebar_position: 1
---

# Получить список баз
 Получает список доступных баз


*Функция ПолучитьСписокБаз(Знач Токен, Знач Отступ = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Отступ | --offset | Строка | Идентификатор следующей страницы списка баз из перыдудщего запроса |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable 

```bsl title="Пример кода"
	
  
  
  Ответ = OPI_Airtable.ПолучитьСписокБаз(Токен); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);    //JSON строка
  

	
```

```sh title="Пример команды CLI"
    
  oint airtable ПолучитьСписокБаз --token %token% --offset %offset%


```


```json title="Результат"

{
  "bases": [
  {
  "id": "appGarzKZ0lu3gzoa",
  "name": "Test",
  "permissionLevel": "create"
  },
  {
  "id": "app9WRfJirwn3yXuG",
  "name": "Product catalog",
  "permissionLevel": "create"
  },
  {
  "id": "app6gigUYTzlDEq4X",
  "name": "Тестовая база",
  "permissionLevel": "create"
  },
  {
  "id": "app5hJGyK8asYYe1Q",
  "name": "Тестовая база",
  "permissionLevel": "create"
  },
  {
  "id": "appRQ6VxxOZb40Uwi",
  "name": "Тестовая база",
  "permissionLevel": "create"
  },
  {
  "id": "appM6FaGofV2XSfFA",
  "name": "Тестовая база",
  "permissionLevel": "create"
  },
  {
  "id": "apptm8Xqo7TwMaipQ",
  "name": "Тестовая база",
  "permissionLevel": "create"
  },
  {
  "id": "appsyQyGrF8aVN2Wm",
  "name": "Тестовая база",
  "permissionLevel": "create"
  },
  {
  "id": "applEsyJmBRm12AuN",
  "name": "Тестовая база",
  "permissionLevel": "create"
  }
  ]
  }

```
