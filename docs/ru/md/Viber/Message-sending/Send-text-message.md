---
sidebar_position: 1
---

# Отправить текстовое сообщение
 Отправляет текстовое сообщение в чат или канал



`Функция ОтправитьТекстовоеСообщение(Знач Токен, Знач Текст, Знач IDПользователя, Знач ОтправкаВКанал, Знач Клавиатура = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Текст | --text | Строка | Текст сообщения |
  | IDПользователя | --user | Строка,Число | ID пользователя. Для канала > администратора, для бота > получателя |
  | ОтправкаВКанал | --ischannel | Булево | Отправка в канал или в чат бота |
  | Клавиатура | --keyboard | Структура из Строка | См. СформироватьКлавиатуруИзМассиваКнопок |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Viber

<br/>




```bsl title="Пример кода"
    Текст = "Тестовое сообщение";

    IDПользователя = "d3jxe61Z4W73nmNkjYGgZg==";
    Токен          = "523b5b25ed27e6ec-fdf013e4...";
    ОтправкаВКанал = Ложь;

    МассивКнопок  = Новый Массив;
    МассивКнопок.Добавить("Кнопка 1");
    МассивКнопок.Добавить("Кнопка 2");
    МассивКнопок.Добавить("Кнопка 3");

    Клавиатура = OPI_Viber.СформироватьКлавиатуруИзМассиваКнопок(МассивКнопок);

    Результат  = OPI_Viber.ОтправитьТекстовоеСообщение(Токен, Текст, IDПользователя, ОтправкаВКанал, Клавиатура);

    IDПользователя = "tMNGhftyUPrB3r1lD+bT4g==";
    Токен          = "523b58ba82afffaa-7ef3b426...";
    ОтправкаВКанал = Истина;

    Результат  = OPI_Viber.ОтправитьТекстовоеСообщение(Токен, Текст, IDПользователя, ОтправкаВКанал, Клавиатура);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint viber ОтправитьТекстовоеСообщение --token "***" \
              --text "Тестовое сообщение" \
              --user "tMNGhftyUPrB3r1lD+bT4g==" \
              --ischannel true \
              --keyboard "{'Buttons':[{'ActionType':'reply','ActionBody':'Кнопка 1','Text':'Кнопка 1','BgColor':'#2db9b9','Coloumns':3},{'ActionType':'reply','ActionBody':'Кнопка 2','Text':'Кнопка 2','BgColor':'#2db9b9','Coloumns':3},{'ActionType':'reply','ActionBody':'Кнопка 3','Text':'Кнопка 3','BgColor':'#2db9b9','Coloumns':3}],'Type':'keyboard'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint viber ОтправитьТекстовоеСообщение ^
              --token "***" ^
              --text "Тестовое сообщение" ^
              --user "tMNGhftyUPrB3r1lD+bT4g==" ^
              --ischannel true ^
              --keyboard "{'Buttons':[{'ActionType':'reply','ActionBody':'Кнопка 1','Text':'Кнопка 1','BgColor':'#2db9b9','Coloumns':3},{'ActionType':'reply','ActionBody':'Кнопка 2','Text':'Кнопка 2','BgColor':'#2db9b9','Coloumns':3},{'ActionType':'reply','ActionBody':'Кнопка 3','Text':'Кнопка 3','BgColor':'#2db9b9','Coloumns':3}],'Type':'keyboard'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "status": 0,
 "status_message": "ok",
 "message_token": 6024493435357382925,
 "chat_hostname": "SN-CHAT-03_",
 "billing_status": 3
}
```
