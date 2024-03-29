---
sidebar_position: 2
---

# Получить статистику по постам
Получает статистику в разрезе постов

*Функция ПолучитьСтатистикуПостов(Знач МассивIDПостов, Знач Параметры = "") Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | МассивIDПостов | Массив из Строка,Число | Массив номеров постов |
  | Параметры | Структура (необяз.) | Параметры / перезапись стандартных параметров (см. [Получение необходимых данных](../)) |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от VK

```bsl title="Пример кода"
	
	МассивПостов = Новый Массив;
	МассивПостов.Добавить(214);
	МассивПостов.Добавить(215);
		
	Ответ = OPI_VK.ПолучитьСтатистикуПостов(МассивПостов, VK_Параметры);
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);

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
