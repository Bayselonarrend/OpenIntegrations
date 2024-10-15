---
sidebar_position: 4
---

# Создать твит гифки
 Создает твит с вложением-гифкой



`Функция СоздатьТвитГифки(Знач Текст, Знач МассивГифок, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Текст | --text | Строка | Текст твита |
  | МассивГифок | --gifs | Массив из Строка,ДвоичныеДанные | Массив файлов гифок |
  | Параметры | --auth | Структура из Строка | Данные авторизации. См.ПолучитьСтандартныеПараметры |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыАвторизацииТвиттер();
    Текст     = "Тестовый твитт" + Строка(Новый УникальныйИдентификатор);

    Гифка   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/animation.gif"; // URL, Двоичные или Путь к файлу
    Гифка2  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/animation.gif"; // URL, Двоичные или Путь к файлу

    МассивГифок = Новый Массив;
    МассивГифок.Добавить(Гифка);
    МассивГифок.Добавить(Гифка2);

    Результат = OPI_Twitter.СоздатьТвитГифки(Текст, МассивГифок, Параметры);

    Текст     = "Тестовый твитт" + Строка(Новый УникальныйИдентификатор);
    Результат = OPI_Twitter.СоздатьТвитГифки(Текст, Гифка, Параметры);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint twitter СоздатьТвитГифки --text "Тестовый твитт87e832c1-266b-4b63-80cf-d1c58048aa20" \
              --gifs C:\Users\Administrator\AppData\Local\Temp\2yqchovj31l.tmp \
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint twitter СоздатьТвитГифки ^
              --text "Тестовый твитт87e832c1-266b-4b63-80cf-d1c58048aa20" ^
              --gifs C:\Users\Administrator\AppData\Local\Temp\2yqchovj31l.tmp ^
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "data": {
  "id": "1843703120704008495",
  "edit_history_tweet_ids": [
   "1843703120704008495"
  ],
  "text": "Тестовый твитт7bb8366e-e270-4284-957c-19ec2ecda762 https://t.co/eufWFKfOpX"
 }
}
```
