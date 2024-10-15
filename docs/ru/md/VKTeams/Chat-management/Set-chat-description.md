---
sidebar_position: 13
---

# Установить описание чата
 Устанавливает новое описание чата



`Функция УстановитьОписаниеЧата(Знач Токен, Знач IDЧата, Знач Текст) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |
  | Текст | --text | Строка | Текст описания |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Для вызова этого метода бот должен быть администратором в чате.

 Метод в документации API: [GET ​​/chats/setAbout](https://teams.vk.com/botapi/#/chats/get_chats_setAbout)
:::
<br/>


```bsl title="Пример кода"
    Токен   = "001.3501506236.091...";
    IDЧата  = "689203963@chat.agent";
    Текст   = "Новое описание";

    Результат = OPI_VKTeams.УстановитьОписаниеЧата(Токен, IDЧата, Текст);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint vkteams УстановитьОписаниеЧата --token "***" \
              --chatid "689203963@chat.agent" \
              --text "Новое описание"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint vkteams УстановитьОписаниеЧата ^
              --token "***" ^
              --chatid "689203963@chat.agent" ^
              --text "Новое описание"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true
}
```
