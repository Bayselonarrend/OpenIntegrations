---
sidebar_position: 6
---

# Отправить ссылку
 Отправляет URL с предпросмотром в чат или канал



`Функция ОтправитьСсылку(Знач Токен, Знач URL, Знач IDПользователя, Знач ОтправкаВКанал) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URL | --url | Строка | Отправляемая ссылка |
  | IDПользователя | --user | Строка,Число | ID пользователя. Для канала > администратора, для бота > получателя |
  | ОтправкаВКанал | --ischannel | Булево | Отправка в канал или в чат бота |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Viber

<br/>




```bsl title="Пример кода"
    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    IDПользователя = "d3jxe61Z4W73nmNkjYGgZg==";
    Токен          = "523b5b25ed27e6ec-fdf013e4...";
    ОтправкаВКанал = Ложь;

    Результат  = OPI_Viber.ОтправитьСсылку(Токен, URL, IDПользователя, ОтправкаВКанал);

    IDПользователя = "tMNGhftyUPrB3r1lD+bT4g==";
    Токен          = "523b58ba82afffaa-7ef3b426...";
    ОтправкаВКанал = Истина;

    Результат  = OPI_Viber.ОтправитьСсылку(Токен, URL, IDПользователя, ОтправкаВКанал);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint viber ОтправитьСсылку --token "***" \
              --url "https://github.com/Bayselonarrend/OpenIntegrations" \
              --user "tMNGhftyUPrB3r1lD+bT4g==" \
              --ischannel true
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint viber ОтправитьСсылку ^
              --token "***" ^
              --url "https://github.com/Bayselonarrend/OpenIntegrations" ^
              --user "tMNGhftyUPrB3r1lD+bT4g==" ^
              --ischannel true
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "status": 0,
 "status_message": "ok",
 "message_token": 6024493557554233637,
 "chat_hostname": "SN-CHAT-01_",
 "billing_status": 3
}
```
