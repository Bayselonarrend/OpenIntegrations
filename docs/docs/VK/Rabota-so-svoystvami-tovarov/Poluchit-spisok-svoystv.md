---
sidebar_position: 1
---

# Получить список свойств
Получает информацию о свойствах товаров

*Функция ПолучитьСписокСвойств(Знач Параметры = "") Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Параметры | Структура (необяз.) | Параметры / перезапись стандартных параметров (см. [Получение необходимых данных](../)) |
  
  Вовзращаемое значение: Массив из Соответствие - массив свойств

```bsl title="Пример кода"
	
    Ответ = OPI_VK.ПолучитьСписокСвойств(Параметры);       
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);

```

```json title="Результат"

[
 {
  "variants": [
   {
    "title": "Желтый",
    "id": 962
   },
   {
    "title": "Синий",
    "id": 963
   },
   {
    "title": "Красный",
    "id": 964
   }
  ],
  "type": "text",
  "title": "Цвет",
  "id": 255
 }
]

```
