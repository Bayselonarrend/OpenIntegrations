---
sidebar_position: 4
---

# Получить администраторов чата
 Получает список администраторов чата



`Функция ПолучитьАдминистраторовЧата(Знач Токен, Знач IDЧата) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /chats/getAdmins](https://teams.vk.com/botapi/#/chats/get_chats_getAdmins)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDЧата   = "AoLI0egLWBSLR1Ngn2w";

    Результат = OPI_VKTeams.ПолучитьАдминистраторовЧата(Токен, IDЧата);
```



```sh title="Пример команды CLI"
    
  oint vkteams ПолучитьАдминистраторовЧата --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w"

```

```json title="Результат"
{
 "admins": [
  {
   "userId": "1011893356"
  },
  {
   "creator": true,
   "userId": "bayselonarrend@openintegrations.bizml.ru"
  }
 ],
 "ok": true
}
```
