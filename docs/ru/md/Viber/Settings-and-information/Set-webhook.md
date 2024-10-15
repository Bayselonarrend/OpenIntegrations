---
sidebar_position: 1
---

# Установить Webhook
ВАЖНО: Установка Webhook обязательна по правилам Viber. Для этого надо иметь свободный URL, который будет возвращать 200 и подлинный SSL сертификат. Если есть сертификат и база опубликована на сервере - можно использовать http-сервис. Туда же будет приходить и информация о новых сообщениях Viber периодически стучит по адресу Webhook, так что если он будет неактивен, то все перестанет работать



`Функция УстановитьWebhook(Знач Токен, Знач URL) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен Viber |
  | URL | --url | Строка | URL для установки Webhook |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Viber

<br/>




```bsl title="Пример кода"
    Токен     = "523b58ba82afffaa-7ef3b426...";
    URL       = "http://api.athenaeum.digital/hs/viber";

    Результат = OPI_Viber.УстановитьWebhook(Токен, URL);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint viber УстановитьWebhook --token "***" \
              --url "http://api.athenaeum.digital/hs/viber"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint viber УстановитьWebhook ^
              --token "***" ^
              --url "http://api.athenaeum.digital/hs/viber"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "status": 1,
 "status_message": "URL not valid or not HTTPS",
 "chat_hostname": "SN-CHAT-01_"
}
```
