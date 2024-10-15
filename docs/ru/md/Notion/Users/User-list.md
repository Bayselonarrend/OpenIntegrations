---
sidebar_position: 1
---

# Список пользователей
 Возвращает список пользователей рабочего пространства



`Функция СписокПользователей(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";

    Результат = OPI_Notion.СписокПользователей(Токен);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint notion СписокПользователей --token "***"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint notion СписокПользователей ^
              --token "***"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "object": "list",
 "results": [
  {
   "object": "user",
   "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
   "name": "Techno Pizza",
   "avatar_url": null,
   "type": "person",
   "person": {
    "email": "iscript13@gmail.com"
   }
  },
  {
   "object": "user",
   "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
   "name": "1C Integration",
   "avatar_url": null,
   "type": "bot",
   "bot": {
    "owner": {
     "type": "workspace",
     "workspace": true
    },
    "workspace_name": "Bayselonarrends Notion"
   }
  }
 ],
 "next_cursor": null,
 "has_more": false,
 "type": "user",
 "user": {},
 "request_id": "1918c0b8-859f-4adc-ab9c-15df111d1b26"
}
```
