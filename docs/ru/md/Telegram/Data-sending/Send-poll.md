---
sidebar_position: 10
---

# Отправить опрос
 Отправляет опрос с вариантами ответа



`Функция ОтправитьОпрос(Знач Токен, Знач IDЧата, Знач Вопрос, Знач МассивОтветов, Знач Анонимный = Истина) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка, Число | ID целевого чата или IDЧата*IDТемы |
  | Вопрос | --question | Строка | Вопрос опроса |
  | МассивОтветов | --options | Массив из Строка | Массив вариантов ответа |
  | Анонимный | --anonymous | Булево | Флаг анонимности опроса |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>

:::tip
Метод в документации API: [sendPoll](https://core.telegram.org/bots/api#sendpoll)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    IDКанала = "@testsichee";
    Вопрос   = "Какой ваш любимый цвет?";

    МассивОтветов     = Новый Массив;
    МассивОтветов.Добавить("Красный");
    МассивОтветов.Добавить("Желтый");
    МассивОтветов.Добавить("Зеленый");
    МассивОтветов.Добавить("Синий");

    Результат = OPI_Telegram.ОтправитьОпрос(Токен, IDЧата  , Вопрос, МассивОтветов, Ложь);

    Результат = OPI_Telegram.ОтправитьОпрос(Токен, IDКанала, Вопрос, МассивОтветов, Истина);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint telegram ОтправитьОпрос --token "***" \
              --chat "@testsichee" \
              --question "Какой ваш любимый цвет?" \
              --options "['Красный','Желтый','Зеленый','Синий']"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint telegram ОтправитьОпрос ^
              --token "***" ^
              --chat "@testsichee" ^
              --question "Какой ваш любимый цвет?" ^
              --options "['Красный','Желтый','Зеленый','Синий']"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true,
 "result": {
  "message_id": 8286,
  "from": {
   "id": 6129457865,
   "is_bot": true,
   "first_name": "Бот Виталий",
   "username": "sicheebot"
  },
  "chat": {
   "id": 461699897,
   "first_name": "Anton",
   "last_name": "Titowets",
   "username": "JKIee",
   "type": "private"
  },
  "date": 1728408390,
  "poll": {
   "id": "5201878558565206764",
   "question": "Какой ваш любимый цвет?",
   "options": [
    {
     "text": "Красный",
     "voter_count": 0
    },
    {
     "text": "Желтый",
     "voter_count": 0
    },
    {
     "text": "Зеленый",
     "voter_count": 0
    },
    {
     "text": "Синий",
     "voter_count": 0
    }
   ],
   "total_voter_count": 0,
   "is_closed": false,
   "is_anonymous": false,
   "type": "regular",
   "allows_multiple_answers": false
  }
 }
}
```
