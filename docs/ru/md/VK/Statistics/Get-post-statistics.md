---
sidebar_position: 2
---

# Получить статистику по постам
 Получает статистику в разрезе постов


*Функция ПолучитьСтатистикуПостов(Знач МассивИДПостов, Знач Параметры = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | МассивИДПостов | --posts | Массив из Строка,Число | Массив ID постов |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Массив из Произвольный -  Массив данных статистики по постам

```bsl title="Пример кода"
	
  
  МассивПостов = Новый Массив;
  МассивПостов.Добавить(214);
  МассивПостов.Добавить(215);
  
  Ответ = OPI_VK.ПолучитьСтатистикуПостов(МассивПостов, VK_Параметры);
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
  

	
```

```sh title="Пример команды CLI"
    
  oint vk ПолучитьСтатистикуПостов --posts %posts% --auth %auth%


```


```json title="Результат"

[
  {
  "ad_report": 0,
  "ad_coverage": 0,
  "ad_to_group": 0,
  "ad_unsubscribe": 0,
  "ad_hide": 0,
  "ad_join_group": 0,
  "ad_subscribers": 0,
  "ad_links": 0,
  "ad_views": 0,
  "reach_viral": 0,
  "reach_total": 1,
  "reach_ads": 0,
  "report": 0,
  "join_group": 0,
  "links": 0,
  "unsubscribe": 0,
  "hide": 0,
  "reach_subscribers": 1,
  "to_group": 1,
  "post_id": 214
  },
  {
  "ad_report": 0,
  "ad_coverage": 0,
  "ad_to_group": 0,
  "ad_unsubscribe": 0,
  "ad_hide": 0,
  "ad_join_group": 0,
  "ad_subscribers": 0,
  "ad_links": 0,
  "ad_views": 0,
  "reach_viral": 0,
  "reach_total": 1,
  "reach_ads": 0,
  "report": 0,
  "join_group": 0,
  "links": 0,
  "unsubscribe": 0,
  "hide": 0,
  "reach_subscribers": 1,
  "to_group": 0,
  "post_id": 215
  }
  ]

```
