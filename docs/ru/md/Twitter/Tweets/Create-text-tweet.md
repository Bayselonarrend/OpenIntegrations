---
sidebar_position: 2
---

# Создать текстовый твит
 Создает твит без вложений



`Функция СоздатьТекстовыйТвит(Знач Текст, Знач Параметры = "") ЭкспортВозврат СоздатьПроизвольныйТвит(Текст, , , , Параметры);КонецФункции`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Текст | --text | Строка | Текст твита |
  | Параметры | --auth | Структура из Строка | Данные авторизации. См.ПолучитьСтандартныеПараметры |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыАвторизацииТвиттер();
    Текст     = "Тестовый твитт" + Строка(Новый УникальныйИдентификатор);

    Результат = OPI_Twitter.СоздатьТекстовыйТвит(Текст, Параметры);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint twitter СоздатьТекстовыйТвит --text "Тестовый твиттba79585d-fd72-4bf5-8c16-32da70569d89" \
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint twitter СоздатьТекстовыйТвит ^
              --text "Тестовый твиттba79585d-fd72-4bf5-8c16-32da70569d89" ^
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "data": {
  "edit_history_tweet_ids": [
   "1843702311643721803"
  ],
  "text": "Тестовый твиттc6e90c85-c8f1-42e2-93d6-417465165081",
  "id": "1843702311643721803"
 }
}
```
