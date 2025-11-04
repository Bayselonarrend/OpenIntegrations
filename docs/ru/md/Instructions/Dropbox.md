---
id: Dropbox
sidebar_class_name: Dropbox
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, Dropbox]
---

<img src={require('../../static/img/APIs/Dropbox.png').default} width='64px' />

# Dropbox

Этот раздел посвящен библиотеке для работы с Dropbox API в 1С:Предприятие, OneScript и CLI. На данной странице описаны все действия, необходимые для полноценного начала работы

## Начало работы

1. Войдите в свой аккаунт на сайте [Dropbox Developers](https://www.dropbox.com/developers)

![BF](../../static/img/Docs/Dropbox/1.png)

1. Перейдите к **App Console**

![BF](../../static/img/Docs/Dropbox/2.png)

2. Нажмите **Create app**

![BF](../../static/img/Docs/Dropbox/3.png)

4. Введите имя нового приложения и выберите **Full Dropbox**

![BF](../../static/img/Docs/Dropbox/4.png)

5. После создания, на странице приложения нажмите **Scoped app** и выберите разрешения, которые необходимы для решения ваших задач. Сохраните **AppKey** и **AppSecret**

![BF](../../static/img/Docs/Dropbox/5.png)

6. Получите ссылку авторизации при помощи функции *ПолучитьСсылкуАвторизации(Знач КлючПриложения)* и перейдите по ней в браузере

![BF](../../static/img/Docs/Dropbox/6.png)

7. Передайте **полученный код**, **AppKey** и **AppSecret** в функцию *ПолучитьТокен(Знач КлючПриложения, Знач СекретПриложения, Знач Код)*, сохраните полученные **access_token** и **refresh_token**

8. По истечении времени жизни access_token, его можно обновить при помощи функции *ОбновитьТокен(Знач КлючПриложения, Знач СекретПриложения, Знач РефрешТокен)*