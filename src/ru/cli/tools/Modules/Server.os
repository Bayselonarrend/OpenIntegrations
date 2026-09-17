// CLI: server
// Tool: true

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

#Использовать "./internal"

#Область ПрограммныйИнтерфейс

#Область МетодыСервера

// stdio
// Запускает сервер для обмена через стандартные потоки ввода вывода
// 
// Параметры:
//  РазделительСообщений - Строка  - Строка, добавляемая в конец ответа от сервера                 - sprt
//  РазделятьНачало      - Булево  - Дополнительно вставляет разделитель в начало сообщения        - bsprt
//  КодировкаПотоков     - Строка  - Использовать конкретную кодировку вне зависимости от оболочки - enc
//
// Возвращаемое значение:
//  Строка - пустая строка
Функция stdio(Знач РазделительСообщений = "", Знач РазделятьНачало = Ложь, Знач КодировкаПотоков = "") Экспорт
	
	STDIO.ЗапуститьСервер(РазделительСообщений, РазделятьНачало, КодировкаПотоков);
	Возврат "";
	
КонецФункции

// http
// Запускает сервер для обмена через HTTP
// 
// Параметры:
//  Порт        - Число   - Порт запуска сервера                                   - port
//  Post        - Булево  - Разрешать обработку POST запросов с телом JSON         - post
//  Get         - Булево  - Разрешать обработку GET запросов                       - get
//  Авторизация - Строка  - Значение заголовка Authorization, ожидаемое от клиента - auth
//
// Возвращаемое значение:
//  Строка - пустая строка
Функция http(Знач Порт, Знач Post = Истина, Знач Get = Ложь, Знач Авторизация = "") Экспорт
	
	HTTP.ЗапуститьСервер(Порт, Post, Get, Авторизация);
	Возврат "";
	
КонецФункции

#КонецОбласти

#КонецОбласти
