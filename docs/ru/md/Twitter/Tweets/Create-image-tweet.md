---
sidebar_position: 3
---

# Создать твит картинки
 Создает твит с картинкой вложением



`Функция СоздатьТвитКартинки(Знач Текст, Знач МассивКартинок, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Текст | --text | Строка | Текст твита |
  | МассивКартинок | --pictures | Массив из Строка,ДвоичныеДанные | Массив файлов картинок |
  | Параметры | --auth | Структура из Строка | Данные авторизации. См.ПолучитьСтандартныеПараметры |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыАвторизацииТвиттер();
    Текст     = "Тестовый твитт" + Строка(Новый УникальныйИдентификатор);

    Картинка   = "https://api.athenaeum.digital/test_data/picture.jpg";  // URL, Двоичные или Путь к файлу
    Картинка2  = "https://api.athenaeum.digital/test_data/picture2.jpg"; // URL, Двоичные или Путь к файлу

    МассивКартинок = Новый Массив;
    МассивКартинок.Добавить(Картинка);
    МассивКартинок.Добавить(Картинка2);

    Результат = OPI_Twitter.СоздатьТвитКартинки(Текст, МассивКартинок, Параметры);

    Текст     = "Тестовый твитт" + Строка(Новый УникальныйИдентификатор);
    Результат = OPI_Twitter.СоздатьТвитКартинки(Текст, Картинка, Параметры);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint twitter СоздатьТвитКартинки --text "Тестовый твиттe17ad33a-3564-4a01-a426-be88395376c1" \
              --pictures C:\Users\Administrator\AppData\Local\Temp\mta1akidbh2.tmp \
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint twitter СоздатьТвитКартинки ^
              --text "Тестовый твиттe17ad33a-3564-4a01-a426-be88395376c1" ^
              --pictures C:\Users\Administrator\AppData\Local\Temp\mta1akidbh2.tmp ^
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "data": {
  "edit_history_tweet_ids": [
   "1843702764976603573"
  ],
  "text": "Тестовый твитт434c5e75-7284-4ee5-b4ce-ffbc33febd80 https://t.co/4j5KPuRULH",
  "id": "1843702764976603573"
 }
}
```
