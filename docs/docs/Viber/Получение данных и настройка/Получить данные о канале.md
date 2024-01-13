---
sidebar_position: 2
---

# Получить данные о канале
Получает общие данные о канале и информацию об участниках

*Функция ПолучитьИнформациюОКанале(Знач Токен) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Токен | Строка | Токен канала |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Viber


```bsl title="Пример кода"
	
	Ответ = OPI_Viber.ПолучитьИнформациюОКанале(ТокенКанала);    //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                  //JSON строка
	
```

```json title="Результат"

{
 "members": [
  {
   "role": "admin",
   "name": "John",
   "id": "d3jxe611111111kjYGgZg=="
  }
 ],
 "subcategory": "Advertising Service",
 "category": "Local Businesses",
 "location": {
  "lon": -73.96878,
  "lat": 40.7691018
 },
 "icon": "https://media-direct.cdn.viber.com/pg_download?pgtp=icons&dlid=0-04-01-05bfe24da13dddf32cf52976b099dc6965c03300763e6a9316de26986e5dea05&fltp=jpg&imsz=0000",
 "subscribers_count": 0,
 "name": "1CTestBot",
 "chat_hostname": "SN-CHAT-01_",
 "id": "pa:5925429953186752236",
 "country": "US",
 "uri": "1ctestbot",
 "status_message": "ok",
 "status": 0
}

```
