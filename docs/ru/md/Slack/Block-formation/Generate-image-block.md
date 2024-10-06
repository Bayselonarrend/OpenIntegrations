---
sidebar_position: 1
---

# Сформировать блок картинку
 Формирует блок с картинкой для добавления в массив блоков сообщения



`Функция СформироватьБлокКартинку(Знач URL, Знач АльтернативныйТекст = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --picture | Строка | URL картинки |
  | АльтернативныйТекст | --alt | Строка | Альтернативный текст картинки |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение -  Блок картинки

<br/>




```bsl title="Пример кода"
    Картинка  = "https://openyellow.neocities.org/test_data/picture.jpg";

    Результат = OPI_Slack.СформироватьБлокКартинку(Картинка, "Картинка");
```



```sh title="Пример команды CLI"
    
  oint slack СформироватьБлокКартинку --picture "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1" --alt %alt%

```

```json title="Результат"
{
 "type": "image",
 "image_url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
 "alt_text": "Картинка"
}
```
