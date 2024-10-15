---
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
    IDФайла  = "I000bSf79DXZ6WLpkXR5ux67068fa41bd";

    Результат = OPI_VKTeams.ПереслатьГолосовоеСообщение(Токен, IDЧата, IDФайла);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint vkteams ПереслатьГолосовоеСообщение --token "***" \
              --chatid "AoLI0egLWBSLR1Ngn2w" \
              --fileid "I000bde2Hh0irg0qrY9Cyd670e0aec1bd"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint vkteams ПереслатьГолосовоеСообщение ^
              --token "***" ^
              --chatid "AoLI0egLWBSLR1Ngn2w" ^
              --fileid "I000bde2Hh0irg0qrY9Cyd670e0aec1bd"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "fileId": "I000b9oIbxV4CRazpAottg670571601bd",
 "msgId": "7423464243690735899",
 "ok": true
}
```
