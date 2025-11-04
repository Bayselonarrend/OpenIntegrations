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

![BF](../../static/img/Docs/YandexDisk/1.png)

2. Введите название сервиса, выберите *Веб-сервисы* в качестве платформы. Redirect URI можно указать любой или выбрать пункт *Подставить URL для отладки* - для работы с библиотекой он не понадобится.

![BF](../../static/img/Docs/YandexDisk/3.png)

3. В поле *Доступ к данным* добавьте разрешения как на скриншоте ниже, после чего нажмите *Создать приложение*

![BF](../../static/img/Docs/YandexDisk/2.png)

4. Сохраните **ClientID** и **Client secret** со страницы приложения

![BF](../../static/img/Docs/YandexDisk/4.png)

5. Вызовите функцию *OPI_YandexID.ПолучитьКодПодтверждения()*, передав ClientID в качестве параметра. Она вернет ответ сервера Yandex, где будут поля:
		- **user_code** - необходимо будет ввести в браузере
		- **device_code** - необходимо будет передать в другую функцию
		- **verification_url** - URL, который нужно открыть в браузере
<br/>
		```json title="Результат функции ПолучитьКодПодтверждения(), если перевести его в JSON"
			{
			 "verification_url": "https://ya.ru/device",
			 "user_code": "gjehyruw",
			 "interval": 5,
			 "expires_in": 300,
			 "device_code": "12207cafec1b40ad8d0052af3faf0d12"
			}
		```

6. Откройте URL из **verification_url** в браузере. Скорее всего это будет https://ya.ru/device. В появившееся поле введите **user_code** из пункта 5 

![BF](../../static/img/Docs/YandexDisk/5.png)

7. После ввода кода в пункте 6, вызовите функцию *OPI_YandexID.ПреобразоватьКодВТокен()*, передав туда **ClientID** и **ClientSecret** из пункта 4, а также **device_code** из пункта 5. Сохраните полученные **access_token** и **refresh_token**

```json title="Результат функции ПреобразоватьКодВТокен(), если перевести его в JSON"
{
 "token_type": "bearer",
 "refresh_token": "1:Tj6nD2vgE2L8jwSm:YgWjQXPv6_y3e07GW70ig2AOyEXoRVsKKpApGHq2EOg7pfx0MKrXiCrfLBFtzgQawdawdwadad3Sasa9z2H0vSeZKNmZmA",
 "expires_in": 31535956,
 "access_token": "y0_AgAAAABWxxdkAAs0QgAAAAD59cawdawdwadadVKIiwGK__crw"
}
```

**access_token** используется во всех остальных функциях библиотеки, а при помощи **refresh_token** его можно обновить, когда срок жизни будет подходить к концу (при помощи функции *ОбновитьТокен()*)