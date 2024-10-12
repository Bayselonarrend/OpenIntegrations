---
sidebar_position: 9
---

# Получить блок файла
 Формирует блок файла для отправки в функции ОтправитьСообщение



`Функция ПолучитьБлокФайла(Знач Наименование, Знач URL) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Наименование | --title | Строка | Наименование картинки |
  | URL | --url | Строка | URL файла для отправки |

  
  Возвращаемое значение:   Структура - Блок с файлом

<br/>

:::tip
Блоки в документации API: [Ссылка](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&CHAPTER_ID=07867)
:::
<br/>


```bsl title="Пример кода"
    Наименование = "Картинка";
    URL          = "https://api.athenaeum.digital/test_data/document.docx";

    Результат = OPI_Bitrix24.ПолучитьБлокФайла(Наименование, URL);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьБлокФайла --title %title% --url %url%

```

```json title="Результат"
{
 "FILE": {
  "NAME": "Картинка",
  "LINK": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx"
 }
}
```
