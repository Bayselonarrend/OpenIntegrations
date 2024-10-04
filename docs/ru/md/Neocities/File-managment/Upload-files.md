---
sidebar_position: 2
---

# Загрузить файлы
 Загружает несколько файлов на сервер Neocities



`Функция ЗагрузитьФайлы(Знач Токен, Знач СоответствиеФайлов, Знач ПоОдному = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен авторизации |
  | СоответствиеФайлов | --files | Соответствие Из КлючИЗначение | Файлы для загрузки: Ключ > путь на NC, Значение > Файл |
  | ПоОдному | --singly | Булево | Истина > отправляет файлы отдельными запросами |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities

<br/>

:::tip
Документация Neocities API: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Пример кода"
    Токен     = "7419cd51de4037f7...";

    Картинка1 = "https://openyellow.neocities.org/test_data/picture.jpg";  // URL, Путь или Двоичные данные
    Картинка2 = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Путь или Двоичные данные
    Гифка     = "https://openyellow.neocities.org/test_data/animation.gif";      // URL, Путь или Двоичные данные

    СоответствиеФайлов = Новый Соответствие;
    СоответствиеФайлов.Вставить("test/pic1.png", Картинка1);
    СоответствиеФайлов.Вставить("test/gif.gif" , Картинка2);
    СоответствиеФайлов.Вставить("pic2.png"     , Гифка);

    Результат = OPI_Neocities.ЗагрузитьФайлы(Токен, СоответствиеФайлов);
```



```sh title="Пример команды CLI"
    
  oint neocities ЗагрузитьФайлы --token "7419cd51de4037f7..." --files %files% --singly %singly%

```

```json title="Результат"
{
 "result": "success",
 "message": "your file(s) have been successfully uploaded"
}
```
