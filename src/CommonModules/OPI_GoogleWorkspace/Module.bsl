Функция СоздатьJWT(Знач СлужебныйКлюч, Знач Почта) Экспорт
	
	Заголовок = "{""alg"":""RS256"",""typ"":""JWT""}";
	Области   = "https://www.googleapis.com/auth/drive, "
		+ "https://www.googleapis.com/auth/calendar, "
		+ "https://www.googleapis.com/auth/spreadsheets ";
	
	Данные = Новый Соответствие;
	Данные.Вставить("iss", Почта);
	
КонецФункции