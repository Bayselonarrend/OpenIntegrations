﻿---
sidebar_position: 5
---

# Переслать файл
 Отправляет ранее загруженный файл по его ID



`Функция ПереслатьФайл(Знач Токен, Знач IDЧата, Знач IDФайла, Знач Текст = "", Знач ИмяФайла = "", Знач Разметка = "MarkdownV2") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата для отправки файла |
  | IDФайла | --fileid | Строка, Число | ID Файла для отправки |
  | Текст | --text | Строка | Подпись к файлу |
  | ИмяФайла | --filename | Строка | Отображаемое имя файла |
  | Разметка | --parsemod | Строка | Вид разметки для текста сообщения: MarkdownV2 или HTML |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /messages/sendFile](https://teams.vk.com/botapi/#/messages/get_messages_sendFile)
:::
<br/>


	


```sh title="Пример команды CLI"
    
oint vkteams ПереслатьФайл --token %token% --chatid %chatid% --fileid %fileid% --text %text% --filename %filename% --parsemod %parsemod%

```

```json title="Результат"
{
 "fileId": "XrJ30XSsGyVg0tOK52eUzi66b7e3a21bd",
 "msgId": "7401634819005743172",
 "ok": true
}
```