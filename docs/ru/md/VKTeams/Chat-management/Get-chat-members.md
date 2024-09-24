---
sidebar_position: 5
---

# Получить пользователей чата
 Получает список пользователей чата



`Функция ПолучитьПользователейЧата(Знач Токен, Знач IDЧата, Знач Курсор = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |
  | Курсор | --cursor | Строка | Маркер продолжения списка из предыдущего запроса |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /chats/getMembers](https://teams.vk.com/botapi/#/chats/get_chats_getMembers)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDЧата   = "AoLI0egLWBSLR1Ngn2w";

    Результат = OPI_VKTeams.ПолучитьПользователейЧата(Токен, IDЧата);
```



```sh title="Пример команды CLI"
    
  oint vkteams ПолучитьПользователейЧата --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --cursor %cursor%

```

```json title="Результат"
{
 "members": [
  {
   "admin": true,
   "userId": "1011893356"
  },
  {
   "creator": true,
   "userId": "bayselonarrend@openintegrations.bizml.ru"
  },
  {
   "userId": "1011987091"
  }
 ],
 "ok": true
}
```
