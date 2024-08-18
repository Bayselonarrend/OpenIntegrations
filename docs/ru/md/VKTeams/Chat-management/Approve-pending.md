﻿---
sidebar_position: 10
---

# Одобрить заявку на вступление
 Подтверждает вступление пользователя в закрытый чат



`Функция ОдобритьЗаявкуНаВступление(Знач Токен, Знач IDЧата, Знач IDПользователя = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |
  | IDПользователя | --userid | Строка, Число | ID пользователя. Ответ на все заявки, если не заполнено |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Для вызова этого метода бот должен быть администратором в чате.

 Метод в документации API: [GET ​​/chats/resolvePending](https://teams.vk.com/botapi/#/chats/get_chats_resolvePending)
:::
<br/>


```bsl title="Пример кода"
    Токен        = "001.3501506236.091...";
    IDЧата       = "689203963@chat.agent";
    Пользователь = 1011987091;

    Результат = OPI_VKTeams.ОдобритьЗаявкуНаВступление(Токен, IDЧата, Пользователь);

    Результат = OPI_VKTeams.ОдобритьЗаявкуНаВступление(Токен, IDЧата);
```



```sh title="Пример команды CLI"
    
  oint vkteams ОдобритьЗаявкуНаВступление --token "001.3501506236.091..." --chatid "689203963@chat.agent" --userid %userid%

```

```json title="Результат"

```