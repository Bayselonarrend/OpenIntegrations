---
sidebar_position: 4
---

# Закрепить сообщение
 Закрепляет сообщение в шапке чата



`Функция ЗакрепитьСообщение(Знач Токен, Знач IDЧата, Знач IDСообщения) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDЧата | --chat | Строка, Число | ID целевого чата |
  | IDСообщения | --message | Строка, Число | ID целевого сообщения |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>

:::tip
Метод в документации API: [pinChatMessage](https://core.telegram.org/bots/api#pinchatmessage)
:::
<br/>


```bsl title="Пример кода"
    Токен       = "6129457865:AAFyzNYOAFbu...";
    IDКанала    = "@testsichee";
    IDСообщения = "9480";

    Результат = OPI_Telegram.ЗакрепитьСообщение(Токен, IDКанала, IDСообщения);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint telegram ЗакрепитьСообщение --token "***" \
              --chat "@testsichee" \
              --message "9781"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint telegram ЗакрепитьСообщение ^
              --token "***" ^
              --chat "@testsichee" ^
              --message "9781"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true,
 "result": true
}
```
