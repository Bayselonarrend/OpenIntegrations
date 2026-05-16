// OneScript: ./OInt/tests/Modules/OPItc_GoogleWorkspace.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Набор тестов для YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

#Использовать "../../tools/main"
#Использовать "../../tools/http"
#Использовать "../../api"
#Использовать asserts
#Использовать "internal"


// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_ПолучениеДанныхТестов.СформироватьТестыЯксCLI("GoogleWorkspace");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертсCLI("GoogleWorkspace");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

#Область GoogleWorkspace

Процедура ГВ_Авторизация() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ClientID"    , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ClientSecret", ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Code"        , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_Refresh"     , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Google_ServiceData" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Access_Token"       , ПараметрыТеста);

    GoogleWorkspace_СформироватьСсылкуПолученияКода(ПараметрыТеста);
    GoogleWorkspace_ПолучитьТокенПоКоду(ПараметрыТеста);
    GoogleWorkspace_ОбновитьТокен(ПараметрыТеста);
    GoogleWorkspace_ПолучитьТокенServiceАккаунта(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти // GoogleWorkspace

#КонецОбласти // ЗапускаемыеТесты

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

#Область GoogleWorkspace

Процедура GoogleWorkspace_СформироватьСсылкуПолученияКода(ПараметрыФункции)

    ClientID  = ПараметрыФункции["Google_ClientID"];
    Опции = Новый Структура;
    Опции.Вставить("id", ClientID);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("google", "СформироватьСсылкуПолученияКода", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "GoogleWorkspace", "СформироватьСсылкуПолученияКода");

КонецПроцедуры

Процедура GoogleWorkspace_ПолучитьТокенПоКоду(ПараметрыФункции)

    ClientID     = ПараметрыФункции["Google_ClientID"];
    ClientSecret = ПараметрыФункции["Google_ClientSecret"];
    Code         = ПараметрыФункции["Google_Code"];

    Опции = Новый Структура;
    Опции.Вставить("id", ClientID);
    Опции.Вставить("secret", ClientSecret);
    Опции.Вставить("code", Code);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("google", "ПолучитьТокенПоКоду", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "GoogleWorkspace", "ПолучитьТокенПоКоду");

КонецПроцедуры

Процедура GoogleWorkspace_ОбновитьТокен(ПараметрыФункции)

    ClientID     = ПараметрыФункции["Google_ClientID"];
    ClientSecret = ПараметрыФункции["Google_ClientSecret"];
    RefreshToken = ПараметрыФункции["Google_Refresh"];

    Опции = Новый Структура;
    Опции.Вставить("id", ClientID);
    Опции.Вставить("secret", ClientSecret);
    Опции.Вставить("refresh", RefreshToken);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("google", "ОбновитьТокен", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "GoogleWorkspace", "ОбновитьТокен");

КонецПроцедуры

Процедура GoogleWorkspace_ПолучитьТокенServiceАккаунта(ПараметрыФункции)

    Данные = ПараметрыФункции["Google_ServiceData"]; // URL, двоичные данные, файл или коллекция

    Токен  = ПараметрыФункции["Access_Token"];  // SKIP
    Данные = OPI_ЗапросыHTTP                    // SKIP
        .НовыйЗапрос()                          // SKIP
        .Инициализировать(Данные)               // SKIP
        .ДобавитьBearerАвторизацию(Токен)       // SKIP
        .ОбработатьЗапрос("GET")                // SKIP
        .ВернутьОтветКакДвоичныеДанные();       // SKIP

    ОбластиДействия = Новый Массив;
    ОбластиДействия.Добавить("https://www.googleapis.com/auth/calendar");
    ОбластиДействия.Добавить("https://www.googleapis.com/auth/drive");
    ОбластиДействия.Добавить("https://www.googleapis.com/auth/spreadsheets");

    Опции = Новый Структура;
    Опции.Вставить("auth", Данные);
    Опции.Вставить("scope", ОбластиДействия);

    Результат = OPI_ПолучениеДанныхТестов.ВыполнитьТестCLI("google", "ПолучитьТокенServiceАккаунта", Опции);

    // END

    OPI_ПолучениеДанныхТестов.ОбработатьCLI(Результат, "GoogleWorkspace", "ПолучитьТокенServiceАккаунта");

КонецПроцедуры

#КонецОбласти // GoogleWorkspace

#КонецОбласти // АтомарныеТесты

#КонецОбласти // СлужебныеПроцедурыИФункции


#Region Alternate

Procedure GW_Auth() Export
    ГВ_Авторизация();
EndProcedure

#EndRegion
