---
sidebar_position: 4
---

# Добавить пользователей к папке
 Предоставляет стороннии пользователям доступ к каталогу



`Функция ДобавитьПользователейКПапке(Знач Токен, Знач IDПапки, Знач АдресаПочты, Знач ТолькоПросмотр = Истина) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDПапки | --folder | Строка | ID публичного каталога (shared folder ID) |
  | АдресаПочты | --emails | Строка, Массив Из Строка | Список адресов почты добавляемых пользователей |
  | ТолькоПросмотр | --readonly | Булево | Запрещает редактирование файла для стороннего пользователя |

  
  Возвращаемое значение:   Неопределено - пустой ответ

<br/>




```bsl title="Пример кода"
    Токен  = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Почта  = "h5bk6ft62s@privaterelay.appleid.com";
    Папка  = "11705714929"; // shared_folder_id

    Результат = OPI_Dropbox.ДобавитьПользователейКПапке(Токен, Папка, Почта, Ложь);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ДобавитьПользователейКПапке --token "***" \
              --folder "11741910385" \
              --emails "['h5bk6ft62s@privaterelay.appleid.com']" \
              --readonly true
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ДобавитьПользователейКПапке ^
              --token "***" ^
              --folder "11741910385" ^
              --emails "['h5bk6ft62s@privaterelay.appleid.com']" ^
              --readonly true
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{}
```
