---
sidebar_position: 1
---

# Открыть диалог
 Открывает новый диалог с одним или несколькими пользователями



`Функция ОткрытьДиалог(Знач Токен, Знач МассивПользователей) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | МассивПользователей | --users | Массив из Строка | Массив ID пользователей |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен        = "xoxb-6965308400114-696804637...";
    Пользователь = "U06UABH3APP";

    Результат = OPI_Slack.ОткрытьДиалог(Токен, Пользователь);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint slack ОткрытьДиалог --token "***" \
              --users "U06UABH3APP"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint slack ОткрытьДиалог ^
              --token "***" ^
              --users "U06UABH3APP"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true,
 "no_op": false,
 "already_open": false,
 "channel": {
  "id": "D06UAKK1C6R"
 }
}
```
