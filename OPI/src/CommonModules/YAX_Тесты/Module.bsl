//Набор тестов для YAxUnit
//@skip-check undefined-variable

#Область СлужебныйПрограммныйИнтерфейс

Процедура ИсполняемыеСценарии() Экспорт
   
    ЮТТесты 
 		.ДобавитьТестовыйНабор("Телеграм")               								
            .ДобавитьСерверныйТест("Телеграм_ПолучитьИнформациюБота"      , "Получить информацию бота") 	
			.ДобавитьСерверныйТест("Телеграм_ПолучитьОбновления"          , "Получить обновления")
			.ДобавитьСерверныйТест("Телеграм_УстановитьWebhook"           , "Установить Webhook")
			.ДобавитьСерверныйТест("Телеграм_УдалитьWebhook"              , "Удалить Webhook")
			.ДобавитьСерверныйТест("Телеграм_ОтправитьТекстовоеСообщение" , "Отправить текстовое сообщение")
			.ДобавитьСерверныйТест("Телеграм_ОтправитьКартинку"           , "Отправить картинку")
			.ДобавитьСерверныйТест("Телеграм_ОтправитьВидео"              , "Отправить видео")
            .ДобавитьСерверныйТест("Телеграм_ОтправитьАудио"              , "Отправить аудио")
            .ДобавитьСерверныйТест("Телеграм_ОтправитьДокумент"           , "Отправить документ")
            .ДобавитьСерверныйТест("Телеграм_ОтправитьГифку"              , "Отправить гифку")
            .ДобавитьСерверныйТест("Телеграм_ОтправитьМедиагруппу"        , "Отправить медиагруппу")
            .ДобавитьСерверныйТест("Телеграм_ОтправитьМестоположение"     , "Отправить местоположение")
            .ДобавитьСерверныйТест("Телеграм_ОтправитьКонтакт"            , "Отправить контакт")
            .ДобавитьСерверныйТест("Телеграм_ОтправитьОпрос"              , "Отправить опрос")
            .ДобавитьСерверныйТест("Телеграм_ПереслатьСообщение"          , "Переслать сообщение");

КонецПроцедуры

#Область Тесты

#Область Telegram

Процедура Телеграм_ПолучитьИнформациюБота() Экспорт

    Токен 		= ПолучитьПараметр("Телеграм_Токен");
	Результат 	= OPI_Telegram.ПолучитьИнформациюБота(Токен);
	
	ЮТест.ОжидаетЧто(Результат) 
        .ИмеетТип("Соответствие") 
        .Заполнено()
		.Свойство("ok").Равно(Истина)
		.Свойство("result.username").Заполнено();
		
КонецПроцедуры

Процедура Телеграм_ПолучитьОбновления() Экспорт
	
	Токен 		= ПолучитьПараметр("Телеграм_Токен");
	Результат 	= OPI_Telegram.ПолучитьОбновления(Токен);

	OPI_Telegram.УдалитьWebhook(Токен);
	
	ЮТест.ОжидаетЧто(Результат) 
		.ИмеетТип("Соответствие") 
		.Заполнено()
		.Свойство("ok").Равно(Истина)
		.Свойство("result").ИмеетТип(Тип("Массив"));

КонецПроцедуры

Процедура Телеграм_УстановитьWebhook() Экспорт
	
	Токен 		= ПолучитьПараметр("Телеграм_Токен");
	URL 		= ПолучитьПараметр("Телеграм_URL");

	Результат 	= OPI_Telegram.УстановитьWebhook(Токен, URL);

	ЮТест.ОжидаетЧто(Результат) 
		.ИмеетТип("Соответствие") 
		.Заполнено()
		.Свойство("ok").Равно(Истина)
		.Свойство("result").Равно(Истина)
		.Свойство("description").Равно("Webhook was set");
		
КонецПроцедуры
	
Процедура Телеграм_УдалитьWebhook() Экспорт
	
	Токен 		= ПолучитьПараметр("Телеграм_Токен");
	
	Результат 	= OPI_Telegram.УдалитьWebhook(Токен);
	
	ЮТест.ОжидаетЧто(Результат) 
		.ИмеетТип("Соответствие") 
		.Заполнено()
		.Свойство("ok").Равно(Истина)
		.Свойство("result").Равно(Истина)
		.Свойство("description").Равно("Webhook was deleted");
	                   
КонецПроцедуры

Процедура Телеграм_ОтправитьТекстовоеСообщение() Экспорт
	
	Токен  	 = ПолучитьПараметр("Телеграм_Токен");
	IDЧата 	 = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
	Текст    = "Сообщение из автоматического теста";
	
	МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьТекстовоеСообщение(Токен, IDЧата, Текст));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьТекстовоеСообщение(Токен, IDКанала, Текст));
    
    IDСообщения = OPI_Инструменты.ЧислоВСтроку(МассивРезультатов[1]["result"]["message_id"]);
    ЗаписатьПараметр("Телеграм_IDСообщенияКанала", IDСообщения);
    
	Для Каждого Результат Из МассивРезультатов Цикл
		
		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
			.Свойство("result.text").Равно(Текст);
		
	КонецЦикла;
		
КонецПроцедуры

Процедура Телеграм_ОтправитьКартинку() Экспорт
	
	Токен  	 = ПолучитьПараметр("Телеграм_Токен");
	IDЧата 	 = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
	Текст    = "Сообщение из автоматического теста";
	Картинка = ПолучитьДвоичные("Картинка");
	ИВФ      = ПолучитьИмяВременногоФайла("png");
	Картинка.Записать(ИВФ);
	
	МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьКартинку(Токен, IDЧата  , Текст, Картинка));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьКартинку(Токен, IDКанала, Текст, Картинка));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьКартинку(Токен, IDЧата  , Текст, ИВФ));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьКартинку(Токен, IDКанала, Текст, ИВФ));
	
	Для Каждого Результат Из МассивРезультатов Цикл

		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
			.Свойство("result.caption").Равно(Текст)
			.Свойство("result.photo").ИмеетТип(Тип("Массив"));
		
	КонецЦикла;
	
	УдалитьФайлы(ИВФ);
	
КонецПроцедуры

Процедура Телеграм_ОтправитьВидео() Экспорт
	
	Токен  	 = ПолучитьПараметр("Телеграм_Токен");
	IDЧата 	 = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
	Текст    = "Сообщение из автоматического теста";
	Видео    = ПолучитьДвоичные("Видео");
	ИВФ      = ПолучитьИмяВременногоФайла("mp4");
	Видео.Записать(ИВФ);
	
	МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьВидео(Токен, IDЧата  , Текст, Видео));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьВидео(Токен, IDКанала, Текст, Видео));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьВидео(Токен, IDЧата  , Текст, ИВФ));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьВидео(Токен, IDКанала, Текст, ИВФ));
	
	Для Каждого Результат Из МассивРезультатов Цикл

		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
			.Свойство("result.caption").Равно(Текст)
			.Свойство("result.video.mime_type").Равно("video/mp4");
		
	КонецЦикла;
	
	УдалитьФайлы(ИВФ);
	
КонецПроцедуры

Процедура Телеграм_ОтправитьАудио() Экспорт
	
	Токен  	 = ПолучитьПараметр("Телеграм_Токен");
	IDЧата 	 = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
	Текст    = "Сообщение из автоматического теста";
	Аудио    = ПолучитьДвоичные("Аудио");
	ИВФ      = ПолучитьИмяВременногоФайла("mp3");
	Аудио.Записать(ИВФ);
	
	МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьАудио(Токен, IDЧата  , Текст, Аудио));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьАудио(Токен, IDКанала, Текст, Аудио));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьАудио(Токен, IDЧата  , Текст, ИВФ));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьАудио(Токен, IDКанала, Текст, ИВФ));
	
	Для Каждого Результат Из МассивРезультатов Цикл

		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
			.Свойство("result.caption").Равно(Текст)
			.Свойство("result.audio.mime_type").Равно("audio/mpeg");
		
	КонецЦикла;
	
	УдалитьФайлы(ИВФ);
	
КонецПроцедуры

Процедура Телеграм_ОтправитьДокумент() Экспорт
	
	Токен  	 = ПолучитьПараметр("Телеграм_Токен");
	IDЧата 	 = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
	Текст    = "Сообщение из автоматического теста";
	Документ = ПолучитьДвоичные("Документ");
	ИВФ      = ПолучитьИмяВременногоФайла("docx");
	Документ.Записать(ИВФ);
	
	МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьДокумент(Токен, IDЧата  , Текст, Документ));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьДокумент(Токен, IDКанала, Текст, Документ));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьДокумент(Токен, IDЧата  , Текст, ИВФ));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьДокумент(Токен, IDКанала, Текст, ИВФ));
	
	Для Каждого Результат Из МассивРезультатов Цикл

		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
			.Свойство("result.caption").Равно(Текст)
			.Свойство("result.document").ИмеетТип("Соответствие").Заполнено();
		
	КонецЦикла;
	
	УдалитьФайлы(ИВФ);
	
КонецПроцедуры

Процедура Телеграм_ОтправитьГифку() Экспорт
	
	Токен  	 = ПолучитьПараметр("Телеграм_Токен");
	IDЧата 	 = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
	Текст    = "Сообщение из автоматического теста";
	Гифка    = ПолучитьДвоичные("Гифка");
	ИВФ      = ПолучитьИмяВременногоФайла("gif");
	Гифка.Записать(ИВФ);
	
	МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьГифку(Токен, IDЧата  , Текст, Гифка));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьГифку(Токен, IDКанала, Текст, Гифка));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьГифку(Токен, IDЧата  , Текст, ИВФ));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьГифку(Токен, IDКанала, Текст, ИВФ));
	
	Для Каждого Результат Из МассивРезультатов Цикл

		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
			.Свойство("result.caption").Равно(Текст)
            .Свойство("result.document").ИмеетТип("Соответствие").Заполнено()
			.Свойство("result.animation.mime_type").Равно("video/mp4");
		
	КонецЦикла;
	
	УдалитьФайлы(ИВФ);
	
КонецПроцедуры

Процедура Телеграм_ОтправитьМедиагруппу() Экспорт
    
    Токен    = ПолучитьПараметр("Телеграм_Токен");
	IDЧата   = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
	Текст    = "Сообщение из автоматического теста";
	
	Картинка     = ПолучитьДвоичные("Картинка");
    ИВФ_Картинка = ПолучитьИмяВременногоФайла("png");
    Картинка.Записать(ИВФ_Картинка);
    
	Видео        = ПолучитьДвоичные("Видео");
	ИВФ_Видео    = ПолучитьИмяВременногоФайла("mp4");
	Видео.Записать(ИВФ_Видео);
	    
    МедиагруппаЧат    = Новый Соответствие;
    МедиагруппаЧат.Вставить(Картинка , "photo");
    МедиагруппаЧат.Вставить(ИВФ_Видео, "video");
    
    МедиагруппаКанал = Новый Соответствие;
    МедиагруппаКанал.Вставить(ИВФ_Картинка, "photo");   
    МедиагруппаКанал.Вставить(Видео       , "video");
    
    МассивРезультатов = Новый Массив;
    МассивРезультатов.Добавить(OPI_Telegram.ОтправитьМедиагруппу(Токен, IDЧата, Текст, МедиагруппаЧат));
    МассивРезультатов.Добавить(OPI_Telegram.ОтправитьМедиагруппу(Токен, IDКанала, Текст, МедиагруппаКанал));
    
    Для Каждого Результат Из МассивРезультатов Цикл

		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
            .Свойство("result").ИмеетТип("Массив").ИмеетДлину(2)
		
	КонецЦикла;

    УдалитьФайлы(ИВФ_Картинка);
    УдалитьФайлы(ИВФ_Видео);
		                  
КонецПроцедуры

Процедура Телеграм_ОтправитьМестоположение() Экспорт
    
    Токен    = ПолучитьПараметр("Телеграм_Токен");
	IDЧата   = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
    Ширина   = "48.87373649724122";
    Долгота  = "48.87373649724122";

    МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьМестоположение(Токен, IDЧата  , Ширина, Долгота));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьМестоположение(Токен, IDКанала, Ширина, Долгота));
	
	Для Каждого Результат Из МассивРезультатов Цикл
		
		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
            .Свойство("result.location").ИмеетТип("Соответствие").Заполнено();
		
	КонецЦикла;

КонецПроцедуры

Процедура Телеграм_ОтправитьКонтакт() Экспорт
    
    Токен    = ПолучитьПараметр("Телеграм_Токен");
	IDЧата   = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
    Имя      = "Петр";
    Фамилия  = "Петров";
    Телефон  = "88005553535";

    МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьКонтакт(Токен, IDЧата  , Имя, Фамилия, Телефон));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьКонтакт(Токен, IDКанала, Имя, Фамилия, Телефон));
	
	Для Каждого Результат Из МассивРезультатов Цикл
		
		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
            .Свойство("result.contact").ИмеетТип("Соответствие").Заполнено()
            .Свойство("result.contact.first_name").Равно(Имя);
		
	КонецЦикла;

КонецПроцедуры

Процедура Телеграм_ОтправитьОпрос() Экспорт
    
    Токен    = ПолучитьПараметр("Телеграм_Токен");
	IDЧата   = ПолучитьПараметр("Телеграм_Чат");
	IDКанала = ПолучитьПараметр("Телеграм_Канал");
    
    Вопрос   = "Какой ваш любимый цвет?";
    
    МассивОтветов     = Новый Массив;
    МассивОтветов.Добавить("Красный");
    МассивОтветов.Добавить("Желтый");
    МассивОтветов.Добавить("Зеленый");
    
    МассивРезультатов = Новый Массив;
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьОпрос(Токен, IDЧата  , Вопрос, МассивОтветов, Ложь));
	МассивРезультатов.Добавить(OPI_Telegram.ОтправитьОпрос(Токен, IDКанала, Вопрос, МассивОтветов, Истина));
	
	Для Каждого Результат Из МассивРезультатов Цикл
		
		ЮТест.ОжидаетЧто(Результат) 
			.ИмеетТип("Соответствие") 
			.Заполнено()
			.Свойство("ok").Равно(Истина)
            .Свойство("result.poll").ИмеетТип("Соответствие").Заполнено()
            .Свойство("result.poll.question").Равно(Вопрос);
		
	КонецЦикла;

КонецПроцедуры

Процедура Телеграм_ПереслатьСообщение() Экспорт
    
    Токен       = ПолучитьПараметр("Телеграм_Токен");
	IDЧата      = ПолучитьПараметр("Телеграм_Чат");
	IDКанала    = ПолучитьПараметр("Телеграм_Канал");
    IDСообщения = ПолучитьПараметр("Телеграм_IDСообщенияКанала");

    ЮТест.ОжидаетЧто(OPI_Telegram.ПереслатьСообщение(Токен, IDСообщения, IDКанала, IDЧата))
        .ИмеетТип("Соответствие") 
        .Заполнено()
        .Свойство("ok").Равно(Истина)
        .Свойство("result.forward_origin.message_id").Равно(Число(IDСообщения));
        
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьПараметр(Параметр) 

	ИмяСправочника  = "ЮТПараметры";
	ИмяРеквизита    = "Значение";
	
	Возврат ПолучитьЗначение(Параметр, ИмяСправочника, ИмяРеквизита);

КонецФункции

Функция ПолучитьДвоичные(Имя)
	
	ИмяСправочника  = "ЮТФайлы";
	ИмяРеквизита    = "Значение";

	Возврат ПолучитьЗначение(Имя, ИмяСправочника, ИмяРеквизита);
	
КонецФункции

Функция ПолучитьЗначение(Параметр, ИмяСправочника, ИмяРеквизита) 
		
	ЭлементСпр = Справочники[ИмяСправочника].НайтиПоНаименованию(Параметр);
	Значение   = ЭлементСпр[ИмяРеквизита];
	
	Если ТипЗнч(Значение) = Тип("ХранилищеЗначения") Тогда
		Значение = Значение.Получить();
	КонецЕсли;
	
	Возврат Значение;
	
КонецФункции

Процедура ЗаписатьПараметр(Параметр, Значение)
	                
	ИмяСправочника  = "ЮТПараметры";
	ИмяРеквизита    = "Значение";
	
	ЭлементСпр = Справочники[ИмяСправочника].НайтиПоНаименованию(Параметр);
    
    Если ЗначениеЗаполнено(ЭлементСпр) Тогда
	    ОбъектСпр = ЭлементСпр.ПолучитьОбъект();
    Иначе
        ОбъектСпр = Справочники[ИмяСправочника].СоздатьЭлемент();
        ОбъектСпр.Наименование = Параметр;
    КонецЕсли;
    
	ОбъектСпр[ИмяРеквизита] = Значение; 
	ОбъектСпр.Записать();
	
КонецПроцедуры

#КонецОбласти
