---
sidebar_position: 3
---

# Добавить пользователя к файлу
 Определяет доступ к файлу для стороннего пользователя




<br/>


*Функция ДобавитьПользователейКФайлу(Знач Токен, Знач IDФайла, Знач АдресаПочты, Знач ТолькоПросмотр = Истина) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDФайла | --fileid | Строка | ID файла, к которому предоставляется доступ |
  | АдресаПочты | --emails | Строка, Массив Из Строка | Список адресов почты добавляемых пользователей |
  | ТолькоПросмотр | --readonly | Булево | Запрещает редактирование файла для стороннего пользователя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox


```bsl title="Пример кода"
  Токен = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
  Почта = "h5bk6ft62s@privaterelay.appleid.com";
  Файл  = "kJU6-a-pT48AAAAAAAAABw";
  
  Результат = OPI_Dropbox.ДобавитьПользователейКФайлу(Токен, Файл, Почта, Ложь);
```
	


```sh title="Пример команды CLI"
    
  oint dropbox ДобавитьПользователейКФайлу --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --fileid %fileid% --emails %emails% --readonly %readonly%

```

```json title="Результат"
    [
 {
  "member": {
   ".tag": "email",
   "email": "h5bk6ft62s@privaterelay.appleid.com"
  },
  "result": {
   ".tag": "success",
   "success": {
    ".tag": "editor"
   }
  },
  "sckey_sha1": "ee2d8fd2cee052e103a52aa74be85bbebb8e6bb4",
  "invitation_signature": [
   "ee2d8fd2cee052e103a52aa74be85bbebb8e6bb4:ed7721b375882c806612d4056dad9f317cc98a22"
  ]
 }
]
```
