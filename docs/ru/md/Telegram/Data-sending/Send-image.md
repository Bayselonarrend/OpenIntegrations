---
sidebar_position: 2
---

# Отправить картинку
 Отправляет картинку в чат или канал


*Функция ОтправитьКартинку(Знач Токен, Знач IDЧата, Знач Текст, Знач Картинка, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Картинка | --picture | ДвоичныеДанные,Строка | Файл картинки |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
  Токен    = "6129457865:AAFyzNYOAFbu...";
  IDЧата   = "461699897";
  IDКанала = "@testsichee";
  Текст    = "Строковое значение";
  Картинка = "https://openintegrations.dev/test_data/picture.jpg";
  
  КартинкаПуть = ПолучитьИмяВременногоФайла("png");
  КопироватьФайл(Картинка, КартинкаПуть);
  
  КартинкаДД   = Новый ДвоичныеДанные(КартинкаПуть);
  
  Результат = OPI_Telegram.ОтправитьКартинку(Токен, IDЧата, Текст, Картинка);
  Результат = OPI_Telegram.ОтправитьКартинку(Токен, IDКанала, Текст, КартинкаПуть);
  Результат = OPI_Telegram.ОтправитьКартинку(Токен, IDКанала, Текст, КартинкаДД);
	
```

```sh title="Пример команды CLI"
    
      oint telegram ОтправитьКартинку --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "Строковое значение" --picture "https://openintegrations.dev/test_data/picture.jpg" --keyboard %keyboard% --parsemode %parsemode%


```


```json title="Результат"

{
 "ok": true,
 "result": {
  "message_id": 4639,
  "from": {
   "id": 6129457865,
   "is_bot": true,
   "first_name": "Бот Виталий",
   "username": "sicheebot"
  },
  "chat": {
   "id": 461699897,
   "first_name": "Anton",
   "last_name": "Titowets",
   "username": "JKIee",
   "type": "private"
  },
  "date": 1717072364,
  "photo": [
   {
    "file_id": "AgACAgIAAxkDAAISH2ZYcewv1LaJnVI1E6pdq0EyR0QJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADcwADNQQ",
    "file_unique_id": "AQADmtkxG77-sUp4",
    "file_size": 1568,
    "width": 90,
    "height": 67
   },
   {
    "file_id": "AgACAgIAAxkDAAISH2ZYcewv1LaJnVI1E6pdq0EyR0QJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADbQADNQQ",
    "file_unique_id": "AQADmtkxG77-sUpy",
    "file_size": 21633,
    "width": 320,
    "height": 240
   },
   {
    "file_id": "AgACAgIAAxkDAAISH2ZYcewv1LaJnVI1E6pdq0EyR0QJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADeAADNQQ",
    "file_unique_id": "AQADmtkxG77-sUp9",
    "file_size": 99260,
    "width": 800,
    "height": 600
   },
   {
    "file_id": "AgACAgIAAxkDAAISH2ZYcewv1LaJnVI1E6pdq0EyR0QJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADeQADNQQ",
    "file_unique_id": "AQADmtkxG77-sUp-",
    "file_size": 218651,
    "width": 1280,
    "height": 960
   },
   {
    "file_id": "AgACAgIAAxkDAAISH2ZYcewv1LaJnVI1E6pdq0EyR0QJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADdwADNQQ",
    "file_unique_id": "AQADmtkxG77-sUp8",
    "file_size": 650214,
    "width": 2560,
    "height": 1920
   }
  ],
  "caption": "Строковое значение"
 }
}

```
