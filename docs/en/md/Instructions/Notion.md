---
id: Notion
sidebar_class_name: Notion
---

<img src={require('../../static/img/APIs/Notion.png').default} width='64px' />

# Notion

This section is dedicated to the library for working with Notion API. On this page, all the steps necessary to start working are described

## Getting started

1. Go to the **[section of integrations of the developer portal](https://www.notion.so/my-integrations)**

![BF](../../static/img/Docs/Notion/1.png)

2. Enter the name of your integration

![BF](../../static/img/Docs/Notion/2.png)

3. After finishing the integration creation, click *Show* and copy the **Token (Secret)**
	
![BF](../../static/img/Docs/Notion/3.png)

4. Go to the **[main interface of Notion](https://notion.so)** and create a new page. This page will serve as the parent for all other objects created through the API

![BF](../../static/img/Docs/Notion/4.png)

5. Click on the three dots in the upper right corner and at the very bottom find the item *Add connections*. Select your integration from items 1-3 there

![BF](../../static/img/Docs/Notion/5.png)

6. Get the ID of this page. You can do this by clicking Share -> Copy link or simply by copying it from the URL

![BF](../../static/img/Docs/Notion/6.png)	

**Token** and **Page ID** are the two parameters required for working through the API.
