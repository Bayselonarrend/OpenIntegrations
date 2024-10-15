---
sidebar_position: 2
---

# Получить статистику по постам
 Получает статистику в разрезе постов



`Функция ПолучитьСтатистикуПостов(Знач МассивИДПостов, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | МассивИДПостов | --posts | Массив из Строка,Число | Массив ID постов |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Массив из Произвольный -  Массив данных статистики по постам

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();

    МассивПостов = Новый Массив;
    МассивПостов.Добавить(214);
    МассивПостов.Добавить(215);

    Результат = OPI_VK.ПолучитьСтатистикуПостов(МассивПостов, Параметры);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint vk ПолучитьСтатистикуПостов --posts "[214,215]" \
              --auth "{'access_token':'***','owner_id':'-218861756','app_id':'51694790','group_id':'218861756'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint vk ПолучитьСтатистикуПостов ^
              --posts "[214,215]" ^
              --auth "{'access_token':'***','owner_id':'-218861756','app_id':'51694790','group_id':'218861756'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
[
 {
  "post_id": 214,
  "hide": 0,
  "join_group": 0,
  "links": 0,
  "reach_subscribers": 1,
  "reach_total": 1,
  "reach_viral": 0,
  "reach_ads": 0,
  "report": 0,
  "to_group": 1,
  "unsubscribe": 0,
  "ad_views": 0,
  "ad_subscribers": 0,
  "ad_hide": 0,
  "ad_unsubscribe": 0,
  "ad_links": 0,
  "ad_to_group": 0,
  "ad_join_group": 0,
  "ad_coverage": 0,
  "ad_report": 0
 },
 {
  "post_id": 215,
  "hide": 0,
  "join_group": 0,
  "links": 0,
  "reach_subscribers": 1,
  "reach_total": 1,
  "reach_viral": 0,
  "reach_ads": 0,
  "report": 0,
  "to_group": 0,
  "unsubscribe": 0,
  "ad_views": 0,
  "ad_subscribers": 0,
  "ad_hide": 0,
  "ad_unsubscribe": 0,
  "ad_links": 0,
  "ad_to_group": 0,
  "ad_join_group": 0,
  "ad_coverage": 0,
  "ad_report": 0
 }
]
```
