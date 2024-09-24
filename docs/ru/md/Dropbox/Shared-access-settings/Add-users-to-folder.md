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
    Токен  = "sl.B7rnyEnvxxd-JcTKNUGp-osMJLfqK79ojSqINJc-rtpJlhgC6meGOUa-rM6gZGBAhHWVmrzuqt...";
    Почта  = "h5bk6ft62s@privaterelay.appleid.com";
    Папка  = "11156736001"; // shared_folder_id

    Результат = OPI_Dropbox.ДобавитьПользователейКПапке(Токен, Папка, Почта, Ложь);
```



```sh title="Пример команды CLI"
    
  oint dropbox ДобавитьПользователейКПапке --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --folder %folder% --emails %emails% --readonly %readonly%

```

```json title="Результат"
{}
```
