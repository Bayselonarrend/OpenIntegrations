---
sidebar_position: 1
---

# Сформировать блок картинку
 Формирует блок с картинкой для добавления в массив блоков сообщения


*Функция СформироватьБлокКартинку(Знач URL, Знач АльтернативныйТекст = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --picture | Строка | URL картинки |
  | АльтернативныйТекст | --alt | Строка | Альтернативный текст картинки |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение -  Блок картинки

```bsl title="Пример кода"
	
  
  Текст = "Картинка альпаки";
  URL   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1";
  
  Ответ = OPI_Slack.СформироватьБлокКартинку(URL, Текст); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);             //JSON строка
  
	
```

```sh title="Пример команды CLI"
    
  oint slack СформироватьБлокКартинку --picture "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1" --alt %alt%

```


```json title="Результат"

{
  "alt_text": "Yo",
  "image_url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1",
  "type": "image"
  }

```
