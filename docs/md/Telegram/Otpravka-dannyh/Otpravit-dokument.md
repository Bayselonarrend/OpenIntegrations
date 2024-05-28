---
sidebar_position: 5
---

# Отправить документ
 Отправляет документ в чат или канал


*Функция ОтправитьДокумент(Знач Токен, Знач IDЧата, Знач Текст, Знач Документ, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Документ | --doc | ДвоичныеДанные,Строка | Файл документа |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    IDКанала = "@testsichee";
    Текст    = "Строковое значение";
    Документ = "https://openintegrations.dev/test_data/document.docx";
    
    ДокументПуть = ПолучитьИмяВременногоФайла("docx");
    КопироватьФайл(Документ, ДокументПуть);
    
    ДокументДД   = Новый ДвоичныеДанные(ДокументПуть);
    
    Результат = OPI_Telegram.ОтправитьДокумент(Токен, IDЧата, Текст, Документ);
    
    OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ОтправитьДокумент");
    
  
    Результат = OPI_Telegram.ОтправитьДокумент(Токен, IDКанала, Текст, ДокументПуть);
    
    OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ОтправитьДокумент (Путь)");
    
      
    Результат = OPI_Telegram.ОтправитьДокумент(Токен, IDКанала, Текст, ДокументДД);

	
```

```sh title="Пример команд CLI"
    
  oint telegram ОтправитьДокумент --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "Строковое значение" --doc "https://openintegrations.dev/test_data/document.docx" --keyboard %keyboard% --parsemode %parsemode%

```


```json title="Результат"

{
 "ok": true,
 "result": {
  "message_id": 4582,
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
  "date": 1716912913,
  "document": {
   "file_name": "document.docx",
   "mime_type": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
   "file_id": "BQACAgIAAxkDAAIR5mZWAxGBzDO-Ba-VbDLdA7CHe__pAAI6UwACvv6xShs9fULOA8Z9NQQ",
   "file_unique_id": "AgADOlMAAr7-sUo",
   "file_size": 24069
  },
  "caption": "Строковое значение"
 }
}

```
