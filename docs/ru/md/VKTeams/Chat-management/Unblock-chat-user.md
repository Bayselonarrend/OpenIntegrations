﻿---
sidebar_position: 9
---

# Разблокировать пользователя чата
 Разблокирует ранее заблокированного пользователя в чате



`Функция РазблокироватьПользователяЧата(Знач Токен, Знач IDЧата, Знач IDПользователя) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |
  | IDПользователя | --userid | Строка, Число | ID пользователя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Для вызова этого метода бот должен быть администратором в чате.

 Метод в документации API: [GET ​​/chats/unblockUser](https://teams.vk.com/botapi/#/chats/get_chats_unblockUser)
:::
<br/>


```bsl title="Пример кода"
    Токен        = "001.3501506236.091...";
    IDЧата       = "689203963@chat.agent";
    Пользователь = 1011987091;

    Результат = OPI_VKTeams.РазблокироватьПользователяЧата(Токен, IDЧата, Пользователь);
```



```sh title="Пример команды CLI"
    
  oint vkteams РазблокироватьПользователяЧата --token "001.3501506236.091..." --chatid "689203963@chat.agent" --userid %userid%

```

```json title="Результат"
{
 "ok": true
}
```
