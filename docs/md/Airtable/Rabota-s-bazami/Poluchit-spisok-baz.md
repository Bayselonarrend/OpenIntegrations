---
sidebar_position: 1
---

# Получить список баз
 Получает список доступных баз


*Функция ПолучитьСписокБаз(Знач Токен, Знач Отступ = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Отступ | --offser | Строка | Идентификатор следующей страницы списка баз из перыдудщего запроса |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable 

```bsl title="Пример кода"
	

  Ответ = OPI_Airtable.ПолучитьСписокБаз(Токен, Отступ); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ); //JSON строка
	
```

```sh title="Пример команд CLI"
    
  oint Airtable ПолучитьСписокБаз --token %token% --offser %offser%

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
   "id": "app2kzmhwzbUvKHLP",
   "name": "Test base",
   "permissionLevel": "create"
  },
  {
   "id": "app9WRfJirwn3yXuG",
   "name": "Product catalog",
   "permissionLevel": "create"
  },
  {
   "id": "appAWuS4kQyzePBub",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "apptQFtDdfViN9aLE",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appvBVaSkxn7oGYie",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appnTO6yFTDbhBUx7",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appWeUAzdXS0CuR9h",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "app9HF38vD9gTMol4",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "app2J9tECjhmUgMbE",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appxcBEzMXAcji4cu",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appxmPVa3V6JKgEOR",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appkAuXy6BLr6zaiZ",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appWZhpTTVL3OCjSg",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appuRFlghrHUJ8X37",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appEqto2nFyF2h9pO",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "app4kxM2OQy7vumJo",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appw4Qs1acLKlQZ4z",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appTWeuSzMSwCoPwm",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "app9BeBl4qHOEc7Pb",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appwyKpw2MMJMU7xN",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appy3ONWZ6r6YiPuF",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appzh34EQ6dRkWHT6",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appr7gAHFMDyuyZcc",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appCIrs9NWI8UIHxM",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appLZ1QtmLBBy0v6o",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appLU0Oq8fc0i4x8F",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "app4Gd8QknEuCqC8D",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appU4BYEPcrG5FlqP",
   "name": "Тестовая база",
   "permissionLevel": "create"
  }
 ]
}

```
