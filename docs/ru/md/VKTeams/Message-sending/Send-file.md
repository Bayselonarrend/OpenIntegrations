---
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


	


```sh title="Пример команды CLI"
    
oint vkteams ОтправитьФайл --token %token% --chatid %chatid% --file %file% --text %text% --filename %filename% --parsemod %parsemod%

```

```json title="Результат"
{
 "fileId": "XrJ30XSsGyVg0tOK52eUzi66b7e3a21bd",
 "msgId": "7401634797530906691",
 "ok": true
}
```
