---
sidebar_position: 2
---

# Разбан
 Разбанивает забаненного ранее пользователя



`Функция Разбан(Знач Токен, Знач IDЧата, Знач IDПользователя) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка, Число | ID целевого чата или IDЧата*IDТемы |
  | IDПользователя | --user | Строка, Число | ID целевого пользователя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>

:::tip
Метод в документации API: [unbanChatMember](https://core.telegram.org/bots/api#unbanchatmember)
:::
<br/>


```bsl title="Пример кода"
    Токен          = "6129457865:AAFyzNYOAFbu...";
    IDПользователя = "461699897";
    IDКанала       = "@testsichee";

    Результат = OPI_Telegram.Разбан(Токен, IDКанала, IDПользователя);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint telegram Разбан --token "***" \
              --chat "@testsichee" \
              --user "461699897"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint telegram Разбан ^
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
