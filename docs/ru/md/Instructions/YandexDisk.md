---
id: YandexDisk
sidebar_class_name: YandexDisk
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, YandexDisk, Yandex.Disk, Yandex Disk]
---

<img src={require('../../static/img/APIs/YandexDisk.png').default} width='64px' />

# Яндекс Диск

Этот раздел посвящен библиотеке для работы с Яндекс Диск API в 1С:Предприятие, OneScript и CLI. На данной странице описаны все действия, необходимые для полноценного начала работы

## Начало работы

Для начала работы необходимо получить токен доступа к диску:

1. Перейдите на [страницу создания приложения](https://oauth.yandex.ru/client/new/) 
2. Введите название сервиса, выберите *Веб-сервисы* в качестве платформы. Redirect URI можно указать любой или выбрать пункт *Подставить URL для отладки* - для работы с библиотекой он не понадобится.
3. В поле *Доступ к данным* добавьте разрешения как на скриншоте ниже, после чего нажмите *Создать приложение*
4. Сохраните **ClientID** и **Client secret** со страницы приложения
5. Вызовите функцию `ПолучитьКодПодтверждения`, передав ClientID в качестве параметра. Функция вернет ответ сервера Yandex, содержащий следующие поля:

	- **user_code** - необходимо будет ввести в браузере
	- **device_code** - необходимо будет передать в другую функцию
	- **verification_url** - URL, который нужно открыть в браузере

```json title="Результат функции ПолучитьКодПодтверждения в виде JSON"
{
 "verification_url": "https://ya.ru/device",
 "user_code": "gjehyruw",
 "interval": 5,
 "expires_in": 300,
 "device_code": "12207cafec1b40ad8d0052af3faf0d12"
}
```

6. Откройте URL из **verification_url** в браузере. В появившееся поле введите **user_code** из пункта 5 

7. После ввода кода в пункте 6, вызовите функцию `ПреобразоватьКодВТокен`, передав туда *ClientID* и *ClientSecret* из пункта 4, а также *device_code* из пункта 5. Сохраните полученные **access_token** и **refresh_token**

```json title="Результат функции ПреобразоватьКодВТокен в виде JSON"
{
 "token_type": "bearer",
 "refresh_token": "1:Tj6nD2vgE2L8jwSm:YgWjQXPv6_y3e07GW70ig2AOyEXoRVsKKpApGHq2EOg7pfx0MKrXiCrfLBFtzgQawdawdwadad3Sasa9z2H0vSeZKNmZmA",
 "expires_in": 31535956,
 "access_token": "y0_AgAAAABWxxdkAAs0QgAAAAD59cawdawdwadadVKIiwGK__crw"
}
```

**access_token** используется для авторизации во всех остальных функциях библиотеки. **refresh_token** необходимо передать в функцию `ОбновитьТокен` для полчения нового access_token, когда время жизни предыдущего подойдет к концу