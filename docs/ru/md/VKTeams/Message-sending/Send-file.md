﻿---
sidebar_position: 2
---

# Отправить файл
 Отправляет файл в чат



`Функция ОтправитьФайл(Знач Токен, Знач IDЧата, Знач Файл, Знач Текст = "", Знач ИмяФайла = "", Знач Разметка = "MarkdownV2") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата для отправки файла |
  | Файл | --file | ДвоичныеДанные, Строка | Файл для отправки |
  | Текст | --text | Строка | Подпись к файлу |
  | ИмяФайла | --filename | Строка | Отображаемое имя файла |
  | Разметка | --parsemod | Строка | Вид разметки для текста сообщения: MarkdownV2 или HTML |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [POST /messages/sendFile](https://teams.vk.com/botapi/#/messages/post_messages_sendFile)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDЧата   = "AoLI0egLWBSLR1Ngn2w";
    Текст    = "Подпись к файлу";

    Файл     = "https://openyellow.neocities.org/test_data/document.docx";        // URL
    ФайлПуть = ПолучитьИмяВременногоФайла("docx");  // Путь

    КопироватьФайл(Файл, ФайлПуть);

    ФайлДД   = Новый ДвоичныеДанные(ФайлПуть);      // Двоичные

    Результат = OPI_VKTeams.ОтправитьФайл(Токен, IDЧата, Файл);

    Результат = OPI_VKTeams.ОтправитьФайл(Токен, IDЧата, ФайлПуть, Текст);

    Результат = OPI_VKTeams.ОтправитьФайл(Токен, IDЧата, ФайлДД, Текст, "ВажныйДокумент.docx");
```



```sh title="Пример команды CLI"
    
  oint vkteams ОтправитьФайл --token %token% --chatid %chatid% --file %file% --text %text% --filename %filename% --parsemod %parsemod%

```

```json title="Результат"
{
 "fileId": "kqNCDmWzJuzZn6ZHS9b5Yq6705714e1bd",
 "msgId": "7423464140611520793",
 "ok": true
}
```
