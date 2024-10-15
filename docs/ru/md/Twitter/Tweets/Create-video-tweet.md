---
sidebar_position: 5
---

# Создать твит видео
 Создает твит с видеовложением



`Функция СоздатьТвитВидео(Знач Текст, Знач МассивВидео, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Текст | --text | Строка | Текст твита |
  | МассивВидео | --videos | Массив из Строка,ДвоичныеДанные | Массив файлов видео |
  | Параметры | --auth | Структура из Строка | Данные авторизации. См.ПолучитьСтандартныеПараметры |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыАвторизацииТвиттер();
    Текст     = "Тестовый твитт" + Строка(Новый УникальныйИдентификатор);

    Видео   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/video.mp4"; // URL, Двоичные или Путь к файлу
    Видео2  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/video.mp4"; // URL, Двоичные или Путь к файлу

    МассивВидео = Новый Массив;
    МассивВидео.Добавить(Видео);
    МассивВидео.Добавить(Видео2);

    Результат = OPI_Twitter.СоздатьТвитВидео(Текст, МассивВидео, Параметры);

    Текст     = "Тестовый твитт" + Строка(Новый УникальныйИдентификатор);
    Результат = OPI_Twitter.СоздатьТвитВидео(Текст, Видео, Параметры);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint twitter СоздатьТвитВидео --text "Тестовый твитт14a548af-c125-420a-8b58-bdf6790580cc" \
              --videos C:\Users\Administrator\AppData\Local\Temp\aoyarkkvwz3.tmp \
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint twitter СоздатьТвитВидео ^
              --text "Тестовый твитт14a548af-c125-420a-8b58-bdf6790580cc" ^
              --videos C:\Users\Administrator\AppData\Local\Temp\aoyarkkvwz3.tmp ^
              --auth "{'redirect_uri':'https://api.athenaeum.digital/opi/hs/twitter','client_id':'***','client_secret':'***','access_token':'***','refresh_token':'***','oauth_token':'***','oauth_token_secret':'***','oauth_consumer_key':'***','oauth_consumer_secret':'***'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "data": {
  "edit_history_tweet_ids": [
   "1843702415477895473"
  ],
  "text": "Тестовый твитт3d643580-f681-495e-9b5e-1f8af82745d4 https://t.co/0e9OmASUoP",
  "id": "1843702415477895473"
 }
}
```
