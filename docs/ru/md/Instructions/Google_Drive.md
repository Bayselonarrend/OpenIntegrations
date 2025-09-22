---
id: GoogleDrive
sidebar_class_name: GoogleDrive
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, Google Drive]
---

<img src={require('../../static/img/APIs/GoogleDrive.png').default} width='64px' />

# Google Drive

Этот раздел посвящен библиотеке для работы с API Google Drive в 1С:Предприятие, OneScript и CLI. На данной странице описаны все действия, необходимые для полноценного начала работы

:::important
Если вы уже используете ОПИ для работы с другими сервисами Google Workspaсe и выполняли стартовую настройку, то пункты **Создание проекта** и **Настройка OAuth** можно пропустить. Необходимо лишь **включить сервис Google Drive** в своем проекте и **заново получить токен** (последние два пункта инструкции). 
:::

## Начало работы

<hr/>

### Создание проекта

1. Перейдите на [главную страницу Google Cloud](https://console.cloud.google.com) и создайте проект

![BF](../../static/img/Docs/GoogleCalendar/1.png)

2. Выберите созданный проект и в боковом меню перейдите APIs and Services -> OAuth consent screen

![BF](../../static/img/Docs/GoogleCalendar/2.png)

3. Выберите пункт External

![BF](../../static/img/Docs/GoogleCalendar/3.png)

4. Заполните поля App name, User support email и Email addresses (все поля со звездочками)

![BF](../../static/img/Docs/GoogleCalendar/4.png)

5. Нажимайте далее и Save and continue на последней вкладке

![BF](../../static/img/Docs/GoogleCalendar/5.png)

6. Нажмите Publish App

![BF](../../static/img/Docs/GoogleCalendar/6.png)

<hr/>

### Настройка OAuth

1. В боковом меню выберите пункт Credentials -> Create Credentials -> OAuth client ID

![BF](../../static/img/Docs/GoogleCalendar/7.png)

2. Введите имя и выберите Application type - Desktop app

![BF](../../static/img/Docs/GoogleCalendar/8.png)

3. Сохраните ClientID и Client Secret

![BF](../../static/img/Docs/GoogleCalendar/9.png)

<hr/>

### Включение сервиса Google Drive

1. Перейдите на [страницу Drive в Marketplace](https://console.cloud.google.com/marketplace/product/google/drive.googleapis.com) 

2. Нажмите Enable

![BF](../../static/img/Docs/GoogleDrive/1.png)

<hr/>

### Получение Токена

1. Передайте ClientID в функцию OPI_GoogleWorkspace.СформироватьСсылкуПолученияКода() с булево параметрами используемых вами сервисов. Результатом функции будет URL, который необходимо открыть в браузере. Авторизуйтесь при помощи своего аккаунта Google

![BF](../../static/img/Docs/GoogleCalendar/10.png)

2. Скопируйте код из URL после авторизации

![BF](../../static/img/Docs/GoogleCalendar/11.png)

:::important
**Время жизни кода крайне мало.** После его получения нужно выполнить шаг 3 максимально быстро. Лучше всего заранее подготовить обработку с полем для ввода и кнопкой (в 1С), либо же использовать CLI версию ОПИ. В случае истечения срока жизни кода до выполнения пункта 3, будет получена ошибка `invalid_grant`
:::

3. Используйте полученный код, ClientID и Client Secret для вызова функции OPI_GoogleWorkspace.ПолучитьТокенПоКоду(ClientID, ClientSecret, Code)

```json title="Результат функции ПолучитьТокенПоКоду(), если перевести его в JSON"

{
 "token_type": "Bearer",
 "refresh_token": "1//09au6OES3JN9oCgYIARAAGAkSNwF-L9Ir1B7uawfwafT1wE0FKO519Xj6JxawfawfyjMyJ_QlUZYLHZqw",
 "scope": "https://www.googleapis.com/auth/...",
 "expires_in": 3599,
 "access_token": "ya29.a0AfB_byA344tXkIawdawdwadadhyZQV8bSZn_snNXtY2HLb7l71awdawdawdad-ASgpzyOSWIvEmPruhUa_1yCCq6jvoD0r_q-fNEsARrH8zpJ3c6LNGWvwdg8CXsSxYaCgYKAWkSawfwafawfrCK0EP5kZY_A0171"
}

```

4. Используйте **access_token** для передачи в качестве параметра Токен при вызове функций библиотеки, а refresh_token - для получения нового access_token (функция OPI_GoogleWorkspace.ОбновитьТокен(ClientID, ClientSecret, RefreshToken)), когда время жизни старого истечет. При обновлении токена refresh_token не обновляется - вы можете использовать его один и тот же для получения нового access_token каждый раз.
