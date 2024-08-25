﻿---
sidebar_position: 7
---

# Получить структуру фильтра сделок
 Возвращает структуру полей для фильтрации сделок в методе ПолучитьСписокСделок



`Функция ПолучитьСтруктуруФильтраСделок(Знач Пустая = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Пустая | --empty | Булево | Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей |

  
  Возвращаемое значение:   Структура Из КлючИЗначение - Структура полей

<br/>




```bsl title="Пример кода"
    Результат = OPI_Bitrix24.ПолучитьСтруктуруФильтраСделок();
```



```sh title="Пример команды CLI"
    
oint bitrix24 ПолучитьСтруктуруФильтраСделок --empty %empty%

```

```json title="Результат"

```