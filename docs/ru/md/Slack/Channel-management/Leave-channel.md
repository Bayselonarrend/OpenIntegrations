---
sidebar_position: 10
---

# Покинуть канал
 Удаляет текущего бота из канала



`Функция ПокинутьКанал(Знач Токен, Знач Канал) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен = "xoxb-6965308400114-696804637...";
    Канал = "C07R7MSSPDM";

    Результат = OPI_Slack.ПокинутьКанал(Токен, Канал);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint slack ПокинутьКанал --token "***" \
              --channel "C07SJFNT9SL"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint slack ПокинутьКанал ^
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
