---
sidebar_position: 4
---

# Получить онлайн пользователей
 Получает статус пользователя или нескольких пользователей по ID



`Функция ПолучитьОнлайнПользователей(Знач Токен, Знач IDПользователей) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен Viber |
  | IDПользователей | --users | Строка,Число,Массив из Строка,Число | ID пользователей(я) Viber |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Viber

<br/>




```bsl title="Пример кода"
    Токен          = "523b58ba82afffaa-7ef3b426...";
    IDПользователя = "tMNGhftyUPrB3r1lD+bT4g==";

    Результат    = OPI_Viber.ПолучитьОнлайнПользователей(Токен, IDПользователя);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint viber ПолучитьОнлайнПользователей --token "***" \
              --users "tMNGhftyUPrB3r1lD+bT4g=="
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint viber ПолучитьОнлайнПользователей ^
              --token "***" ^
              --users "tMNGhftyUPrB3r1lD+bT4g=="
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "status": 0,
 "status_message": "ok",
 "users": [
  {
   "id": "tMNGhftyUPrB3r1lD+bT4g==",
   "online_status": 4,
   "online_status_message": "unavailable",
   "last_online": 0
  }
 ]
}
```
