---
sidebar_position: 5
---

# Удалить календарь из списка
Удаляет календарь из списка календарей пользователя

*Функция УдалитьКалендарьИзСписка(Знач Токен, Знач Календарь) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Токен | Строка | Токен доступа |
  | Календарь | Строка | ID календаря для получения |
  
  Вовзращаемое значение: Пустая строка

```bsl title="Пример кода"
			
    Ответ = OPI_GoogleCalendar.УдалитьКалендарьИзСписка(Токен, "55868c32be16935f0..."); //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                         //Строка

```

```json title="Результат"

""

```
