#Область ПрограммныйИнтерфейс

#Область РаботаСФайламиИПапками

// Получить информацию о диске.
// 
// Параметры:
//  Токен - Строка - Токен
// 
// Возвращаемое значение:
//  ДвоичныеДанные, Неопределено, Строка, Произвольный - Ответ сервера Yandex
Функция ПолучитьИнформациюОДиске(Знач Токен) Экспорт
	
	Заголовки = ЗаголовокАвторизации(Токен);
	Ответ     = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk", , Заголовки);
	
	Возврат Ответ;
	
КонецФункции

// Создать папку.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к созаваемой папке
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex
Функция СоздатьПапку(Знач Токен, Знач Путь) Экспорт
	
	Заголовки = ЗаголовокАвторизации(Токен);
	URL       = "https://cloud-api.yandex.net/v1/disk/resources";
	
	Параметры = Новый Структура;
	Параметры.Вставить("path", Путь);
	
	Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры);	
	Ответ     = OPI_Инструменты.Put(URL + Параметры, , Заголовки, Ложь);
	
	Возврат Ответ;

КонецФункции

// Получить объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к папке или файлу, о котором необходимо получить информацию
// 
// Возвращаемое значение:
//  ДвоичныеДанные, Неопределено, Строка, Произвольный - Ответ сервера Yandex
Функция ПолучитьОбъект(Знач Токен, Знач Путь) Экспорт
	
	Заголовки = ЗаголовокАвторизации(Токен);
	Параметры = Новый Структура;
	Параметры.Вставить("path", Путь);
	
	Ответ     = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources", Параметры, Заголовки);
	
	Возврат Ответ;

КонецФункции

// Удалить объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к удаляемой папке или файлу
//  ВКорзину - Булево - В корзину
// 
// Возвращаемое значение:
//  ДвоичныеДанные, Неопределено, Строка, Произвольный - Ответ сервера Yandex
Функция УдалитьОбъект(Знач Токен, Знач Путь, Знач ВКорзину = Истина) Экспорт
	
	Заголовки = ЗаголовокАвторизации(Токен);
	
	Параметры = Новый Структура;
	Параметры.Вставить("path"       , Путь);
	Параметры.Вставить("permanently", Не ВКорзину);
	
	Ответ     = OPI_Инструменты.Delete("https://cloud-api.yandex.net/v1/disk/resources", Параметры, Заголовки);
	
	Возврат Ответ;

КонецФункции

// Создать копию объекта.
// 
// Параметры:
//  Токен - Строка - Токен
//  Оригинал - Строка - Путь к оригинальному файлу или каталогу
//  Путь - Строка - Путь-назначение для копии
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex
Функция СоздатьКопиюОбъекта(Знач Токен, Знач Оригинал, Знач Путь) Экспорт
    
    Заголовки = ЗаголовокАвторизации(Токен);
    URL       = "https://cloud-api.yandex.net/v1/disk/resources/copy";
    
    Параметры = Новый Структура;
    Параметры.Вставить("from", Оригинал);
    Параметры.Вставить("path", Путь);
    
    Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры); 
    Ответ     = OPI_Инструменты.Post(URL + Параметры, , Заголовки, Ложь);
    
    Возврат Ответ;
    
КонецФункции

// Получить ссылку для скачивания.
// 
// Параметры:
//  Токен - Строка - Токен
//  Путь - Строка - Путь к файлу для скачивания
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex
Функция ПолучитьСсылкуДляСкачивания(Знач Токен, Знач Путь) Экспорт

    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    Параметры.Вставить("path", Путь);
    
    Ответ = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources/download", Параметры, Заголовки);
    
    Возврат Ответ;
     
КонецФункции

// Получить список файлов.
// 
// Параметры:
//  Токен - Строка - Токен
//  ЛимитВложенных - Число,Строка - Количество выводимых вложенных ресурсов
//  ОтборПоТипу - Строка - Отбор по типу файла
//      Список доступных вариантов: audio, backup, book, compressed, data, development, 
//                                  diskimage, document, encoded, executable, flash, font, 
//                                  image, settings, spreadsheet, text, unknown, video, web
//  СортироватьПоДате - Булево - Истина - сортировать по дате, Ложь - по алфавиту
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex 
Функция ПолучитьСписокФайлов(Знач Токен
    , Знач ЛимитВложенных = 0
    , Знач ОтборПоТипу = ""
    , Знач СортироватьПоДате = Ложь) Экспорт
    
    Заголовки = ЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    
    Если ЗначениеЗаполнено(ЛимитВложенных) Тогда
        Параметры.Вставить("limit", OPI_Инструменты.ЧислоВСтроку(ЛимитВложенных));
    КонецЕсли;
    
    Если ЗначениеЗаполнено(ОтборПоТипу) Тогда
        Параметры.Вставить("media_type", ОтборПоТипу);
    КонецЕсли;
    
    Если СортироватьПоДате Тогда
        Назначение = "last-uploaded";
    Иначе
        Назначение = "files";
    КонецЕсли;
    
    Ответ = OPI_Инструменты.Get("https://cloud-api.yandex.net/v1/disk/resources/" + Назначение, Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Переместить объект.
// 
// Параметры:
//  Токен - Строка - Токен
//  Оригинал - Строка - Путь к оригинальному файлу или папке
//  Путь - Строка -  Путь-назначение для перемещения
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, HTTPОтвет, Неопределено - Ответ сервера Yandex 
Функция ПереместитьОбъект(Знач Токен, Знач Оригинал, Знач Путь) Экспорт
    
    Заголовки = ЗаголовокАвторизации(Токен);
    URL       = "https://cloud-api.yandex.net/v1/disk/resources/move";
    
    Параметры = Новый Структура;
    Параметры.Вставить("from", Оригинал);
    Параметры.Вставить("path", Путь);
    
    Параметры = OPI_Инструменты.ПараметрыЗапросаВСтроку(Параметры); 
    Ответ     = OPI_Инструменты.Post(URL + Параметры, , Заголовки, Ложь);
    
    Возврат Ответ;
        
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ЗаголовокАвторизации(Знач Токен)
	
	Заголовки = Новый Соответствие;
	Заголовки.Вставить("Authorization", "OAuth " + Токен);
	
	Возврат Заголовки;
	
КонецФункции

#КонецОбласти