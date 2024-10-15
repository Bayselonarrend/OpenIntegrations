---
sidebar_position: 6
---

# Удалить тему форума
 Удаляет тему форума



`Функция УдалитьТемуФорума(Знач Токен, Знач IDЧата, Знач IDТемы) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDЧата | --forum | Строка, Число | ID чата темы |
  | IDТемы | --topic | Строка, Число | ID темы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>

:::tip
Метод в документации API: [deleteForumTopic](https://core.telegram.org/bots/api#deleteforumtopic)
:::
<br/>


```bsl title="Пример кода"
    Токен          = "6129457865:AAFyzNYOAFbu...";
    Чат            = "-1001971186208";
    Тема           = "5429";

    Результат = OPI_Telegram.УдалитьТемуФорума(Токен, Чат, Тема);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint telegram УдалитьТемуФорума --token "***" \
              --forum "-1001971186208" \
              --topic "5598"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint telegram УдалитьТемуФорума ^
              --token "***" ^
              --forum "-1001971186208" ^
              --topic "5598"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true,
 "result": true
}
```
