﻿---
sidebar_position: 1
---

# Создать ссылку получения токена
Получение ссылки для интерактивного получения токена (access_token), который необходим для дальнейших действий



`Функция СоздатьСсылкуПолученияТокена(Знач App_id) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | app_id | --app | Строка,Число | app_id из настроек приложения |

  
  Возвращаемое значение:   Строка - URL, по которому необходимо перейти в браузере

<br/>




```bsl title="Пример кода"
    Приложение = "51694790";
    Результат  = OPI_VK.СоздатьСсылкуПолученияТокена(Приложение);
```



```sh title="Пример команды CLI"
    
  oint vk СоздатьСсылкуПолученияТокена --app %app%

```

```json title="Результат"
"https://oauth.vk.com/authorize?client_id=51694790&scope=offline,wall,groups,photos,stats,stories,ads,market,video&v=5.131&response_type=token&redirect_uri=https://api.vk.com/blank.html"
```
