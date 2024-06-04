---
sidebar_position: 6
---

# Отменить публикацию файла
 Запрещает доступ к файлу для внешних пользователей


*Функция ОтменитьПубликациюФайла(Знач Токен, Знач IDФайла) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDФайла | --fileid | Строка | ID файла, к которому предоставляется доступ |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    Файл  = "kJU6-a-pT48AAAAAAAAABw";
    
    Результат = OPI_Dropbox.ОтменитьПубликациюФайла(Токен, Файл);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ОтменитьПубликациюФайла --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --fileid %fileid%

```


```json title="Результат"

{}

```
