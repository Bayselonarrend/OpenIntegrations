---
sidebar_position: 1
---

# Отправить текстовое сообщение
 Отправляет текстовое сообщение в чат или канал



`Функция ОтправитьТекстовоеСообщение(Знач Токен, Знач IDЧата, Знач Текст, Знач Клавиатура = "", Знач Разметка = "Markdown", Знач IDВходящего = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка, Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Клавиатура | --keyboard | Строка | Клавиатура. См. СформироватьКлавиатуруПоМассивуКнопок |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |
  | IDВходящего | --reply | Строка, Число | ID сообщения на которое надо ответить |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>

:::tip
Метод в документации API: [sendMessage](https://core.telegram.org/bots/api#sendmessage)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    IDКанала = "@testsichee";
    Текст    = "Строковое значение";

    Результат = OPI_Telegram.ОтправитьТекстовоеСообщение(Токен, IDЧата, Текст);

    Результат = OPI_Telegram.ОтправитьТекстовоеСообщение(Токен, IDКанала, Текст);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint telegram ОтправитьТекстовоеСообщение --token "***" \
              --chat "@testsichee" \
              --text "Текст %%F0%%9F%%A%5%9D и emoji \(10%%\)" \
              --parsemode "MarkdownV2"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint telegram ОтправитьТекстовоеСообщение ^
              --token "***" ^
              --chat "@testsichee" ^
              --text "Текст %%F0%%9F%%A%5%9D и emoji \(10%%\)" ^
              --parsemode "MarkdownV2"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true,
 "result": {
  "message_id": 8274,
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
  "date": 1728408204,
  "text": "Строковое значение"
 }
}
```
