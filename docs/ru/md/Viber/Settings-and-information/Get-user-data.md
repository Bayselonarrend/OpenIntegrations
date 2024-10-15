---
sidebar_position: 3
---

# Получить данные пользователя
 Получает информацию о пользователе по ID



`Функция ПолучитьДанныеПользователя(Знач Токен, Знач IDПользователя) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDПользователя | --user | Строка, Число | ID пользователя Viber |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Viber

<br/>




```bsl title="Пример кода"
    Токен          = "523b58ba82afffaa-7ef3b426...";
    IDПользователя = "tMNGhftyUPrB3r1lD+bT4g==";

    Результат    = OPI_Viber.ПолучитьДанныеПользователя(Токен, IDПользователя);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint viber ПолучитьДанныеПользователя --token "***" \
              --user "tMNGhftyUPrB3r1lD+bT4g=="
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint viber ПолучитьДанныеПользователя ^
              --token "***" ^
              --user "tMNGhftyUPrB3r1lD+bT4g=="
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "status": 6,
 "status_message": "notSubscribed",
 "chat_hostname": "SN-CHAT-03_"
}
```
