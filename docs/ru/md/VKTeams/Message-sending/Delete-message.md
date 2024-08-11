---
sidebar_position: 4
---

# Удалить сообщение
 Удаляет сообщение по ID



`Функция УдалитьСообщение(Знач Токен, Знач IDЧата, Знач IDСообщения) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата для отправки сообщения |
  | IDСообщения | --messageid | Строка, Число | ID сообщения для редактирования |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /messages/deleteMessages](https://teams.vk.com/botapi/#/messages/get_messages_deleteMessages)
:::
<br/>


	


```sh title="Пример команды CLI"
    
oint vkteams УдалитьСообщение --token %token% --chatid %chatid% --messageid %messageid%

```


