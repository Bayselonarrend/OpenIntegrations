---
sidebar_position: 5
---

# Отправить документ
 Отправляет документ в чат или канал



`Функция ОтправитьДокумент(Знач Токен, Знач IDЧата, Знач Текст, Знач Документ, Знач Клавиатура = "", Знач Разметка = "Markdown", Знач ИмяФайла = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Документ | --doc | ДвоичныеДанные,Строка | Файл документа |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |
  | ИмяФайла | --filename | Строка | Отображаемое имя файла c расширением, если необходимо |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>




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
  
  Результат = OPI_Telegram.ОтправитьДокумент(Токен, IDЧата, Текст, Документ, , , "customname.docx");
  
  Результат = OPI_Telegram.ОтправитьДокумент(Токен, IDКанала, Текст, ДокументПуть);
  
  Результат = OPI_Telegram.ОтправитьДокумент(Токен, IDКанала, Текст, ДокументДД, , , "customname.docx");
```



```sh title="Пример команды CLI"
    
  oint telegram ОтправитьДокумент --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "Строковое значение" --doc "https://openintegrations.dev/test_data/document.docx" --keyboard %keyboard% --parsemode %parsemode%

```

```json title="Результат"
{
 "ok": true,
 "result": {
  "message_id": 4642,
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
  "date": 1717072414,
  "document": {
   "file_name": "document.docx",
   "mime_type": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
   "file_id": "BQACAgIAAxkDAAISImZYch5MDU2ibeJ0S46yZfw6Dmb2AAKtUAACYCjISp3o6gzXeDCVNQQ",
   "file_unique_id": "AgADrVAAAmAoyEo",
   "file_size": 24069
  },
  "caption": "Строковое значение"
 }
}
```
