---
sidebar_position: 8
---

# Получить блок картинки
 Формирует картинку для отправки в функции ОтправитьСообщение



`Функция ПолучитьБлокКартинки(Знач Наименование, Знач URL) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Наименование | --title | Строка | Наименование картинки |
  | URL | --url | Строка | URL картинки для отправки |

  
  Возвращаемое значение:   Структура - Блок с картинкой

<br/>

:::tip
Блоки в документации API: [Ссылка](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&CHAPTER_ID=07867)
:::
<br/>


```bsl title="Пример кода"
    Наименование = "Картинка";
    URL          = "https://api.athenaeum.digital/test_data/picture.jpg";

    Результат = OPI_Bitrix24.ПолучитьБлокКартинки(Наименование, URL);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьБлокКартинки --title %title% --url %url%

```

```json title="Результат"
{
 "IMAGE": {
  "NAME": "Картинка",
  "LINK": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"
 }
}
```
