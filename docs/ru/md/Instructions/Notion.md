---
id: Notion
sidebar_class_name: Notion
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, Notion]
---

<img src={require('../../static/img/APIs/Notion.png').default} width='64px' />

# Notion

Этот раздел посвящен библиотеке для работы с Notion API в 1С:Предприятие, OneScript и CLI. На данной странице описаны все действия, необходимые для полноценного начала работы

## Начало работы

1. Перейдите **[в раздел интеграций портала для разработчиков](https://www.notion.so/my-integrations)**

![BF](../../static/img/Docs/Notion/1.png)

2. Введите название вашей интеграции

![BF](../../static/img/Docs/Notion/2.png)

3. После завершения создания интеграции, нажмите *Show* и скопируйте **Токен (Secret)**
	
![BF](../../static/img/Docs/Notion/3.png)

4. Перейдите в **[основной интерфейс Notion](https://notion.so)** и создайте новую страницу. Эта страница будет родительской для всех остальных объектов, создаваемых через API

![BF](../../static/img/Docs/Notion/4.png)

5. Нажмите три точки в правом верхнем углу и в самом низу найдите пункт *Add connections*. Выберите там свою интеграцию из пунктов 1-3

![BF](../../static/img/Docs/Notion/5.png)

6. Получите ID этой страницы. Это можно сделать нажав Share -> Copy link или просто скопировав из URL

![BF](../../static/img/Docs/Notion/6.png)	

**Токен** и **ID страницы** - два параметра, необходимые для работы через API