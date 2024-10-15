---
sidebar_position: 4
---

# Архивировать канал
 Архивирует активный канал



`Функция АрхивироватьКанал(Знач Токен, Знач Канал) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен = "xoxb-6965308400114-696804637...";
    Канал = "C07RTRYK673";

    Результат = OPI_Slack.АрхивироватьКанал(Токен, Канал);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint slack АрхивироватьКанал --token "***" \
              --channel "C07SJFNT9SL"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint slack АрхивироватьКанал ^
              --token "***" ^
              --channel "C07SJFNT9SL"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true
}
```
