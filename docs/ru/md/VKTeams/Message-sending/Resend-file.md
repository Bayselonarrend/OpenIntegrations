---
sidebar_position: 6
---

# Переслать файл
 Отправляет ранее загруженный файл по его ID



`Функция ПереслатьФайл(Знач Токен, Знач IDЧата, Знач IDФайла, Знач Текст = "", Знач Разметка = "MarkdownV2") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата для отправки файла |
  | IDФайла | --fileid | Строка, Число | ID Файла для отправки |
  | Текст | --text | Строка | Подпись к файлу |
  | Разметка | --parsemod | Строка | Вид разметки для текста сообщения: MarkdownV2 или HTML |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /messages/sendFile](https://teams.vk.com/botapi/#/messages/get_messages_sendFile)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDЧата   = "AoLI0egLWBSLR1Ngn2w";
    IDФайла  = "vaFI6GPPHMw21IwjOd8bQ76708d5441bd";
    Текст    = "Подпись к файлу";

    Результат = OPI_VKTeams.ПереслатьФайл(Токен, IDЧата, IDФайла, Текст);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint vkteams ПереслатьФайл --token "***" \
              --chatid "AoLI0egLWBSLR1Ngn2w" \
              --fileid "xNjCbcI70PvUmFRTcD3t0c670e0acf1bd" \
              --text "Подпись к файлу"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint vkteams ПереслатьФайл ^
              --token "***" ^
              --chatid "AoLI0egLWBSLR1Ngn2w" ^
              --fileid "xNjCbcI70PvUmFRTcD3t0c670e0acf1bd" ^
              --text "Подпись к файлу"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "fileId": "kqNCDmWzJuzZn6ZHS9b5Yq6705714e1bd",
 "msgId": "7423464162086357274",
 "ok": true
}
```
