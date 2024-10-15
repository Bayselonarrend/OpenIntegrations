---
sidebar_position: 3
---

# Отправить файл
 Отправляет файл (документ) в чат или канал



`Функция ОтправитьФайл(Знач Токен, Знач URL, Знач IDПользователя, Знач ОтправкаВКанал, Знач Расширение, Знач Размер = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URL | --file | Строка | URL файла |
  | IDПользователя | --user | Строка,Число | ID пользователя. Для канала > администратора, для бота > получателя |
  | ОтправкаВКанал | --ischannel | Булево | Отправка в канал или в чат бота |
  | Расширение | --ext | Строка | Расширение файла |
  | Размер | --size | Число | Размер файла. Если не заполнен > определяется автоматически скачиванием файла |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Viber

<br/>




```bsl title="Пример кода"
    Расширение = "docx";
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    IDПользователя = "d3jxe61Z4W73nmNkjYGgZg==";
    Токен          = "523b5b25ed27e6ec-fdf013e4...";
    ОтправкаВКанал = Ложь;

    Результат  = OPI_Viber.ОтправитьФайл(Токен, URL, IDПользователя, ОтправкаВКанал, Расширение);

    IDПользователя = "tMNGhftyUPrB3r1lD+bT4g==";
    Токен          = "523b58ba82afffaa-7ef3b426...";
    ОтправкаВКанал = Истина;

    Результат  = OPI_Viber.ОтправитьФайл(Токен, URL, IDПользователя, ОтправкаВКанал, Расширение);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint viber ОтправитьФайл --token "***" \
              --file "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx" \
              --user "tMNGhftyUPrB3r1lD+bT4g==" \
              --ischannel true \
              --ext "docx"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint viber ОтправитьФайл ^
              --token "***" ^
              --file "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx" ^
              --user "tMNGhftyUPrB3r1lD+bT4g==" ^
              --ischannel true ^
              --ext "docx"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "status": 0,
 "status_message": "ok",
 "message_token": 6024493484262966074,
 "chat_hostname": "SN-CHAT-01_",
 "billing_status": 3
}
```
