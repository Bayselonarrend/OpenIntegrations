﻿---
sidebar_position: 22
---

# Получить структуру обновления характеристик
 Получает структуру для обновления характеристик товара в функции ОбновитьХарактеристикиТоваров()



`Функция ПолучитьСтруктуруОбновленияХарактеристик(Знач Пустая = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Пустая | --empty | Булево | Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей |

  
  Возвращаемое значение:   Структура Из КлючИЗначение - Структура полей товара

<br/>

:::tip
Характеристики представляют из себя структуры с полями complex_id, id и массивом values. Для их быстрого создания есть метод ДополнитьКомплексныйАтрибут()
:::
<br/>


```bsl title="Пример кода"
    Результат = OPI_Ozon.ПолучитьСтруктуруОбновленияХарактеристик();
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьСтруктуруОбновленияХарактеристик --empty %empty%

```

```json title="Результат"
{
 "offer_id": "<артикул>",
 "attributes": "<массив обновляемых атрибутов>"
}
```
