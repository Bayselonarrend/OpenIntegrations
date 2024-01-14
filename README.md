<img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png" style="height: 256px; width: 256px;">

# Открытый пакет интеграций
Набор библиотек для интеграции с некоторыми популярными API для 1C:Enterprise. 

Проект состоит из общих модулей, каждый из которых отвечает за свой API, а также нескольких модулей-инструментов, общих для всех. Реализованные методы выполняют конечные задачи (вроде *ОтправитьСообщение()* или *СоздатьПост()*), что позволяет использовать их без углубления в реализацию. Однако, код, при этом, достаточно сильно декомпозирован - методы авторизации, получения данных и пр. по возможности вынесены в отдельные функции. Это позволяет легко добавлять новые методы, даже если они еще не реализованы в самой библиотеке на текущий момент. 

На данный момент реализованы методы для работы со следующими API:
<br>
  <div>
  <a href="https://opi.neocities.org/docs/Telegram/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Telegram.png" width="32"></a>
  <a href="https://opi.neocities.org/docs/VK/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/VK.png" width="32"></a>
  <a href="https://opi.neocities.org/docs/Viber/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Viber.png" width="32"></a>
  <a href="https://opi.neocities.org/docs/Twitter/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Twitter.png" width="32"></a>
</div>
<br>

## Релизы ##

Релизы библиотеки выходят в трех вариантах: XML файлов расширения для загрузки через конфигуратор, EDT проекта расширения и отдельного файла расширения формата cfe. Помимо этого, вы можете просто скопировать код общих модулей из релизов XML или EDT в свою конфигурацию вручную - кроме общих модулей там ничего нет.

Список релизова можно найти в [Releases данного репозитория](https://github.com/Bayselonarrend/OpenIntegrations/releases).  

## Документация ##

У ОПИ есть подробная документация с примерами по адресу [https://opi.neocities.org](https://opi.neocities.org). Там вы можете найти как общие положения о начаел работы с каждым конкретным API, так и описания каждого метода с примерами кода и возвращаемых значений.


