﻿---
sidebar_position: 2
---

# Изменить аватар чата
 Изменяет картинку аватар чата



`Функция ИзменитьАватарЧата(Знач Токен, Знач IDЧата, Знач Файл) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |
  | Файл | --file | ДвоичныеДанные, Строка | Файл картинки |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [POST ​/chats​/avatar​/set](https://teams.vk.com/botapi/#/chats/post_chats_avatar_set)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDЧата   = "AoLI0egLWBSLR1Ngn2w";

    Файл     = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/spy2.png";        // URL
    ФайлПуть = ПолучитьИмяВременногоФайла("png");   // Путь

    КопироватьФайл(Файл, ФайлПуть);

    ФайлДД   = Новый ДвоичныеДанные(ФайлПуть);      // Двоичные

    Результат = OPI_VKTeams.ИзменитьАватарЧата(Токен, IDЧата, Файл);

    Результат = OPI_VKTeams.ИзменитьАватарЧата(Токен, IDЧата, ФайлПуть);

    Результат = OPI_VKTeams.ИзменитьАватарЧата(Токен, IDЧата, ФайлДД);
```



```sh title="Пример команды CLI"
    
  oint vkteams ИзменитьАватарЧата --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --file "https://openintegrations.dev/test_data/spy2.png"

```

```json title="Результат"
{
 "ok": true
}
```