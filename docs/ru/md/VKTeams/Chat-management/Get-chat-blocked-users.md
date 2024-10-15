﻿---
sidebar_position: 6
---

# Получить заблокированных пользователей чата
 Получает список заблокированных пользователей чата



`Функция ПолучитьЗаблокированныхПользователейЧата(Знач Токен, Знач IDЧата) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Для вызова этого метода бот должен быть администратором в чате.

 Метод в документации API: [GET ​/chats​/getBlockedUsers](https://teams.vk.com/botapi/#/chats/get_chats_getBlockedUsers)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDЧата   = "AoLI0egLWBSLR1Ngn2w";

    Результат = OPI_VKTeams.ПолучитьЗаблокированныхПользователейЧата(Токен, IDЧата);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint vkteams ПолучитьЗаблокированныхПользователейЧата --token "***" \
              --chatid "AoLI0egLWBSLR1Ngn2w"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint vkteams ПолучитьЗаблокированныхПользователейЧата ^
              --token "***" ^
              --chatid "AoLI0egLWBSLR1Ngn2w"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "users": [],
 "ok": true
}
```
