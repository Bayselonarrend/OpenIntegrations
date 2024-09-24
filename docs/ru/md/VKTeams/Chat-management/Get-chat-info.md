---
sidebar_position: 3
---

# Получить информацию о чате
 Получает основную информацию о чате



`Функция ПолучитьИнформациюОЧате(Знач Токен, Знач IDЧата) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /chats/getInfo](https://teams.vk.com/botapi/#/chats/get_chats_getInfo)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDЧата   = "AoLI0egLWBSLR1Ngn2w";

    Результат = OPI_VKTeams.ПолучитьИнформациюОЧате(Токен, IDЧата);
```



```sh title="Пример команды CLI"
    
  oint vkteams ПолучитьИнформациюОЧате --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w"

```

```json title="Результат"
{
 "inviteLink": "https://icq.com/chat/AoLI0egLWBSLR1Ngn2w",
 "joinModeration": false,
 "public": false,
 "title": "Тест2",
 "type": "group",
 "ok": true
}
```
