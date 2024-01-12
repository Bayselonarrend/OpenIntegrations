
Функция Twitterget(Запрос)
	
	Параметры = Новый Соответствие;
	
	Параметры.Вставить("redirect_uri"    , "https://api.athenaeum.digital/opi/hs/twitter");
	Параметры.Вставить("client_id"    	  , "ZG1vSmxlVTJXYi05M2c0ek9iV246MTpjaQ");
	Параметры.Вставить("client_secret"   , "6Yy_dyoguUb6W-TaRrYfj1N5_8AlKxq-yjiD2sNN4l1H7BcUnd");
	Параметры.Вставить("access_token"    , Константы.TwitterToken.Получить());
	Параметры.Вставить("refresh_token"   , Константы.TwitterRefresh.Получить());
	Параметры.Вставить("v1_access_token" , "929248194101501953-4O78tyw6zsnKiHK34DAMjnzDn6wYBlo");
	Параметры.Вставить("v1_access_secret", "YYC8ly1f5wtkiVFVzJooLb39ChMeLxjSGBxvidRzWuWuJ");
	Параметры.Вставить("api_key"         , "2OQgEn51Kqd9SAiimcFIcHmSP");
	Параметры.Вставить("api_secret"      , "Oerbr7max2rQG30QLBMXCcXpdzPmycg0qws6kMObHFJGREfDzj");

	
	Код         = Запрос.ПараметрыЗапроса["code"];	
	ОтветТокен  = OPI_Twitter.ПолучитьТокен(Код, Параметры);
	
	Константы.TwitterRefresh.Установить(ОтветТокен["refresh_token"]);
	Константы.TwitterToken.Установить(ОтветТокен["access_token"]);
	
	Ответ       = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
	
КонецФункции

Функция Twitterpost(Запрос)
	Ответ = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
КонецФункции
