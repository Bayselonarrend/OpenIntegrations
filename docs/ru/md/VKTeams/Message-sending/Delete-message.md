---
sidebar_position: 5
---

# Удалить сообщение
 Удаляет сообщение по ID



`Функция УдалитьСообщение(Знач Токен, Знач IDЧата, Знач IDСообщения) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата для отправки сообщения |
  | IDСообщения | --messageid | Строка, Число | ID сообщения для редактирования |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /messages/deleteMessages](https://teams.vk.com/botapi/#/messages/get_messages_deleteMessages)
:::
<br/>


```bsl title="Пример кода"
    Токен       = "001.3501506236.091...";
    IDЧата      = "689203963@chat.agent";
    IDСообщения = "7424418276186262625";

    Результат = OPI_VKTeams.УдалитьСообщение(Токен, IDЧата, IDСообщения);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint vkteams УдалитьСообщение --token "***" \
              --chatid "689203963@chat.agent" \
              --messageid "7425884578021117348"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint vkteams УдалитьСообщение ^
              --token "***" ^
              --chatid "689203963@chat.agent" ^
              --messageid "7425884578021117348"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true
}
```
