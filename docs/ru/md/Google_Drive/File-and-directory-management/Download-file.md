---
sidebar_position: 6
---

# Скачать файл
 Получает файл по ID



`Функция СкачатьФайл(Знач Токен, Знач Идентификатор, Знач ПутьСохранения = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор файла |
  | ПутьСохранения | --out | Строка | Путь сохранения файла |

  
  Возвращаемое значение:   ДвоичныеДанные,Строка - Двоичные данные или путь к файлу при указании параметра ПутьСохранения

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Идентификатор = "17pGWmj6IhPQB-wRJS3QOzqfqGghLRUGH";

    Результат = OPI_GoogleDrive.СкачатьФайл(Токен, Идентификатор);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gdrive СкачатьФайл --token "***" \
              --object "10MDksSJHfiN5TdiC9iG66f-BjZRTn_s6"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gdrive СкачатьФайл ^
              --token "***" ^
              --object "10MDksSJHfiN5TdiC9iG66f-BjZRTn_s6"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
НЕ JSON: FF D8 FF E1 54 C1 45 78 69 66 00 00 49 49 2A 00 08 00 00 00 0B 00 0E 01 02 00 20 00 00 00 92 00 00 00 0F 01 02 00 05 00 00 00 B2 00 00 00 10 01 02 00 07 00 00 00 B8 00 00 00 12 01 03 00 01 00…
```
