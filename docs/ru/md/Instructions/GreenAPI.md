---
id: GreenAPI
sidebar_class_name: GreenAPI
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, GreenAPI]
---

<img src={require('../../static/img/APIs/GreenAPI.png').default} width='64px' />

# WhatsApp (GreenAPI)

Этот раздел посвящен библиотеке для работы с WhatsApp через Green API в 1С:Предприятие, OneScript и CLI. На данной странице описаны все действия, необходимые для полноценного начала работы

### Начало работы

1. Перейдите в [Личный кабинет Green API](https://console.green-api.com/registration) и пройдите процедуру регистрации
2. Перейдите к [списку инстансов](https://console.green-api.com/instanceList) и создайте новый
3. Выберите новый инстанс и свяжите его с аккаунтом WhatsApp по QR-коду или номеру телефона
4. Сохраните учетные данны инстанса. Для работы с библиотекой необходимы `apiUrl`, `mediaUrl`, `idInstance` и `apiTokenInstance`

Полученные данные необходимо передать в функцию `СформироватьПараметрыДоступа`. Полученная в ее результате структура будет использоваться для авторизации во всех остальных функциях работы с GreenAPI

```bsl
    ApiUrl           = "https://7105.api.greenapi.com";
    MediaUrl         = "https://7105.media.greenapi.com";
    IdInstance       = "71051...";
    ApiTokenInstance = "425010d90e114aa6b78f0969e...";

    Результат = OPI_GreenAPI.СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
```

