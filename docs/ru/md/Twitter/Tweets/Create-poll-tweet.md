---
sidebar_position: 6
---

# Создать твит опрос
 Создает твит с опросом



`Функция СоздатьТвитОпрос(Знач Текст, Знач МассивВариантов, Знач Длительность, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Текст | --text | Строка | Текст твита |
  | МассивВариантов | --options | Массив из Строка | Массив вариантов опроса |
  | Длительность | --duration | Строка,Число | Длительность опроса |
  | Параметры | --auth | Структура из Строка | Данные авторизации. См.ПолучитьСтандартныеПараметры |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

<br/>




```bsl title="Пример кода"
    Параметры  = ПолучитьПараметрыАвторизацииТвиттер();
    Текст      = "Тестовый твитт" + Строка(Новый УникальныйИдентификатор);

    МассивОтветов = Новый Массив;
    МассивОтветов.Добавить("Вариант 1");
    МассивОтветов.Добавить("Вариант 2");

    Результат = OPI_Twitter.СоздатьТвитОпрос(Текст, МассивОтветов, 60, Параметры);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint twitter СоздатьТвитОпрос --text "Тестовый твитт239b5631-21ce-4267-a2fd-d1ffb4b5aca8" \
              --options "['Вариант 1','Вариант 2']" \
              --duration 60 \
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint twitter СоздатьТвитОпрос ^
              --text "Тестовый твитт239b5631-21ce-4267-a2fd-d1ffb4b5aca8" ^
              --options "['Вариант 1','Вариант 2']" ^
              --duration 60 ^
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "data": {
  "text": "Тестовый твиттa06201e3-4fa7-403b-bdda-f9a6b14e5e94",
  "id": "1843703421678887363",
  "edit_history_tweet_ids": [
   "1843703421678887363"
  ]
 }
}
```
