---
sidebar_position: 4
---

# Отправить аудио
 Отправляет аудиофайл в чат или канал


*Функция ОтправитьАудио(Знач Токен, Знач IDЧата, Знач Текст, Знач Аудио, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Аудио | --audio | ДвоичныеДанные,Строка | Файл аудио |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    IDКанала = "@testsichee";
    Текст    = "Строковое значение";
    Аудио    = "https://openintegrations.dev/test_data/song.mp3";
    
    АудиоПуть = ПолучитьИмяВременногоФайла("mp3");
    КопироватьФайл(Аудио, АудиоПуть);
    
    АудиоДД   = Новый ДвоичныеДанные(АудиоПуть);
    
    Результат = OPI_Telegram.ОтправитьАудио(Токен, IDЧата, Текст, Аудио);
    Результат = OPI_Telegram.ОтправитьАудио(Токен, IDКанала, Текст, АудиоПуть);
    Результат = OPI_Telegram.ОтправитьАудио(Токен, IDКанала, Текст, АудиоДД);

	
```

```sh title="Пример команды CLI"
    
  oint telegram ОтправитьАудио --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "Строковое значение" --audio "https://openintegrations.dev/test_data/song.mp3" --keyboard %keyboard% --parsemode %parsemode%


```


```json title="Результат"

{
 "ok": true,
 "result": {
  "message_id": 4641,
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
  "date": 1717072399,
  "audio": {
   "duration": 228,
   "file_name": "audio",
   "mime_type": "audio/mpeg",
   "title": "Dogs",
   "performer": "Motorhead",
   "file_id": "CQACAgIAAxkDAAISIWZYcg_Kxij0GylJNbAlQXeFsOL_AAKsUAACYCjISuJ28LqFPDf3NQQ",
   "file_unique_id": "AgADrFAAAmAoyEo",
   "file_size": 9229352
  },
  "caption": "Строковое значение"
 }
}

```
