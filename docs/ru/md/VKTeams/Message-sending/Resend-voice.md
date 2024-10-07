﻿---
sidebar_position: 7
---

# Переслать голосовое сообщение
 Отправляет ранее загруженное голосовое сообщение по ID



`Функция ПереслатьГолосовоеСообщение(Знач Токен, Знач IDЧата, Знач IDФайла) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата для отправки файла |
  | IDФайла | --fileid | Строка, Число | ID Файла голосового сообщения |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /messages/sendVoice](https://teams.vk.com/botapi/#/messages/get_messages_sendVoice)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDЧата   = "AoLI0egLWBSLR1Ngn2w";
    IDФайла  = "I000bknkWbWwh8Fy0kkt9l66f69ea61bd";

    Результат = OPI_VKTeams.ПереслатьГолосовоеСообщение(Токен, IDЧата, IDФайла);
```



```sh title="Пример команды CLI"
    
  oint vkteams ПереслатьГолосовоеСообщение --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --fileid "I000bPVBYaNQkn9Fg3oY0066ba35811bd"

```

```json title="Результат"
{
 "fileId": "I000bBSx3WYmSbMXLe1ilU67042d4d1bd",
 "msgId": "7423107916023990521",
 "ok": true
}
```
