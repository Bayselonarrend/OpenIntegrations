---
sidebar_position: 1
---

# Бан
 Банит пользователя в выбранном чате



`Функция Бан(Знач Токен, Знач IDЧата, Знач IDПользователя) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка, Число | ID целевого чата или IDЧата*IDТемы |
  | IDПользователя | --user | Строка, Число | ID целевого пользователя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>

:::tip
Метод в документации API: [banChatMember](https://core.telegram.org/bots/api#banchatmember)
:::
<br/>


```bsl title="Пример кода"
    Токен             = "6129457865:AAFyzNYOAFbu...";
    IDПользователя    = "461699897";
    IDКанала          = "@testsichee";

    Результат = OPI_Telegram.Бан(Токен, IDКанала, IDПользователя);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint telegram Бан --token "***" \
              --chat "@testsichee" \
              --user "461699897"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint telegram Бан ^
              --token "***" ^
              --chat "@testsichee" ^
              --user "461699897"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": false,
 "error_code": 400,
 "description": "Bad Request: can't remove chat owner"
}
```
