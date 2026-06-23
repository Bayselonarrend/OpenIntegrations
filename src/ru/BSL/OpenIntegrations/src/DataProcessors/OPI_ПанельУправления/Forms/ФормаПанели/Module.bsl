//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check bsl-legacy-check-string-length

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	ЛогоBase64 = ПолучитьЛоготипBase64();

	ФормаHTML = Обработки.OPI_HTMLФорма.Создать().Инициализировать();
	ПодключитьСтилиПанели(ФормаHTML);
	СобратьHTMLПанели(ФормаHTML, ЛогоBase64);

	HTML = ФормаHTML.СгенерироватьHTML();

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Функция ПолучитьЛоготипBase64()

	ЛогоДвоичные = БиблиотекаКартинок.OPI_Logo.ПолучитьДвоичныеДанные();
	ЛогоBase64   = ПолучитьBase64СтрокуИзДвоичныхДанных(ЛогоДвоичные);

	Возврат СтрШаблон("data:image/jpeg;base64,%1", ЛогоBase64);

КонецФункции

&НаСервере
Процедура ПодключитьСтилиПанели(ФормаHTML)

	ФормаHTML
		.УстановитьАтрибутыHtml(АтрибутыHTML("lang", "ru"))
		.УстановитьАтрибутыBody(АтрибутыHTML("class", "opi-panel"))
		.УстановитьСвойствоКласса(".opi-panel", "margin", "0")
		.УстановитьСвойствоКласса(".opi-panel", "padding", "12px")
		.УстановитьСвойствоКласса(".opi-panel", "font-family", "-apple-system, system-ui, ""Segoe UI"", Helvetica, Arial, sans-serif")
		.УстановитьСвойствоКласса(".opi-panel", "font-size", "14px")
		.УстановитьСвойствоКласса(".opi-panel", "line-height", "1.5")
		.УстановитьСвойствоКласса(".opi-panel", "color", "#333333")
		.УстановитьСвойствоКласса(".opi-panel", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-panel", "box-sizing", "border-box")
		.УстановитьСвойствоКласса(".opi-panel *, .opi-panel *::before, .opi-panel *::after", "box-sizing", "border-box")
		.УстановитьСвойствоКласса(".opi-shell", "max-width", "960px")
		.УстановитьСвойствоКласса(".opi-shell", "margin", "0 auto")
		.УстановитьСвойствоКласса(".opi-shell", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-shell", "border", "1px solid #dddddd")
		.УстановитьСвойствоКласса(".opi-shell", "border-radius", "12px")
		.УстановитьСвойствоКласса(".opi-shell", "box-shadow", "inset 0 1px 3px rgba(255, 255, 255, 0.7), 0 4px 8px rgba(0, 0, 0, 0.1)")
		.УстановитьСвойствоКласса(".opi-shell", "overflow", "hidden")
		.УстановитьСвойствоКласса(".opi-header", "padding", "20px 24px 16px")
		.УстановитьСвойствоКласса(".opi-header", "border-bottom", "1px solid rgba(27, 31, 35, 0.08)")
		.УстановитьСвойствоКласса(".opi-header__wrap", "display", "flex")
		.УстановитьСвойствоКласса(".opi-header__wrap", "align-items", "flex-start")
		.УстановитьСвойствоКласса(".opi-header__icon", "width", "3.4rem")
		.УстановитьСвойствоКласса(".opi-header__icon", "height", "3.4rem")
		.УстановитьСвойствоКласса(".opi-header__icon", "flex-shrink", "0")
		.УстановитьСвойствоКласса(".opi-header__icon", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-header__icon", "margin-right", "1.5rem")
		.УстановитьСвойствоКласса(".opi-header__title", "margin", "0")
		.УстановитьСвойствоКласса(".opi-header__title", "font-size", "1.5rem")
		.УстановитьСвойствоКласса(".opi-header__title", "font-weight", "350")
		.УстановитьСвойствоКласса(".opi-header__title", "color", "#000000")
		.УстановитьСвойствоКласса(".opi-header__title", "line-height", "1.2")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "margin", "0.1rem 0 0")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "font-size", "13px")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "font-weight", "300")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "color", "#555555")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "line-height", "1.35")
		.УстановитьСвойствоКласса(".opi-tabs", "display", "flex")
		.УстановитьСвойствоКласса(".opi-tabs", "padding", "0 16px")
		.УстановитьСвойствоКласса(".opi-tabs", "border-bottom", "1px solid rgba(27, 31, 35, 0.08)")
		.УстановитьСвойствоКласса(".opi-tabs", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-tab", "display", "inline-flex")
		.УстановитьСвойствоКласса(".opi-tab", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-tab", "padding", "0.52rem 0.75rem")
		.УстановитьСвойствоКласса(".opi-tab", "margin", "0")
		.УстановитьСвойствоКласса(".opi-tab", "border", "none")
		.УстановитьСвойствоКласса(".opi-tab", "border-bottom", "2px solid transparent")
		.УстановитьСвойствоКласса(".opi-tab", "background", "transparent")
		.УстановитьСвойствоКласса(".opi-tab", "color", "#666666")
		.УстановитьСвойствоКласса(".opi-tab", "font-weight", "350")
		.УстановитьСвойствоКласса(".opi-tab", "cursor", "pointer")
		.УстановитьСвойствоКласса(".opi-tab:hover", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-tab-input", "position", "absolute")
		.УстановитьСвойствоКласса(".opi-tab-input", "opacity", "0")
		.УстановитьСвойствоКласса(".opi-tab-input", "pointer-events", "none")
		.УстановитьСвойствоКласса(".opi-main", "padding", "24px")
		.УстановитьСвойствоКласса(".opi-main", "min-height", "320px")
		.УстановитьСвойствоКласса(".opi-tab-panel", "display", "none")
		.УстановитьСвойствоКласса("#opi-tab-main:checked ~ .opi-main .opi-tab-panel[data-tab=""main""]", "display", "block")
		.УстановитьСвойствоКласса("#opi-tab-addins:checked ~ .opi-main .opi-tab-panel[data-tab=""addins""]", "display", "block")
		.УстановитьСвойствоКласса("#opi-tab-main:checked ~ .opi-tabs label[for=""opi-tab-main""]", "color", "#000000")
		.УстановитьСвойствоКласса("#opi-tab-main:checked ~ .opi-tabs label[for=""opi-tab-main""]", "border-bottom-color", "#004943")
		.УстановитьСвойствоКласса("#opi-tab-main:checked ~ .opi-tabs label[for=""opi-tab-main""]", "font-weight", "400")
		.УстановитьСвойствоКласса("#opi-tab-addins:checked ~ .opi-tabs label[for=""opi-tab-addins""]", "color", "#000000")
		.УстановитьСвойствоКласса("#opi-tab-addins:checked ~ .opi-tabs label[for=""opi-tab-addins""]", "border-bottom-color", "#004943")
		.УстановитьСвойствоКласса("#opi-tab-addins:checked ~ .opi-tabs label[for=""opi-tab-addins""]", "font-weight", "400")
		.УстановитьСвойствоКласса(".opi-hero", "display", "flex")
		.УстановитьСвойствоКласса(".opi-hero", "flex-direction", "column")
		.УстановитьСвойствоКласса(".opi-hero", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-hero", "text-align", "center")
		.УстановитьСвойствоКласса(".opi-hero", "gap", "8px")
		.УстановитьСвойствоКласса(".opi-hero", "padding", "8px 0 20px")
		.УстановитьСвойствоКласса(".opi-logo", "width", "96px")
		.УстановитьСвойствоКласса(".opi-logo", "height", "96px")
		.УстановитьСвойствоКласса(".opi-logo", "border-radius", "20px")
		.УстановитьСвойствоКласса(".opi-logo", "background", "linear-gradient(145deg, #f0f7f6, #ffffff)")
		.УстановитьСвойствоКласса(".opi-logo", "border", "1px solid rgba(0, 73, 67, 0.12)")
		.УстановитьСвойствоКласса(".opi-logo", "display", "flex")
		.УстановитьСвойствоКласса(".opi-logo", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-logo", "justify-content", "center")
		.УстановитьСвойствоКласса(".opi-logo", "overflow", "hidden")
		.УстановитьСвойствоКласса(".opi-logo img", "width", "72px")
		.УстановитьСвойствоКласса(".opi-logo img", "height", "72px")
		.УстановитьСвойствоКласса(".opi-logo img", "object-fit", "contain")
		.УстановитьСвойствоКласса(".opi-hero__title", "margin", "8px 0 0")
		.УстановитьСвойствоКласса(".opi-hero__title", "font-size", "1.65rem")
		.УстановитьСвойствоКласса(".opi-hero__title", "font-weight", "350")
		.УстановитьСвойствоКласса(".opi-hero__title", "color", "#000000")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "margin", "0")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "max-width", "520px")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "font-size", "0.95rem")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "font-weight", "300")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "color", "#666666")
		.УстановитьСвойствоКласса(".opi-version-badge", "display", "inline-block")
		.УстановитьСвойствоКласса(".opi-version-badge", "margin-top", "4px")
		.УстановитьСвойствоКласса(".opi-version-badge", "padding", "4px 10px")
		.УстановитьСвойствоКласса(".opi-version-badge", "border", "1px solid #004943")
		.УстановитьСвойствоКласса(".opi-version-badge", "border-radius", "16px")
		.УстановитьСвойствоКласса(".opi-version-badge", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-version-badge", "font-size", "0.85rem")
		.УстановитьСвойствоКласса(".opi-version-badge", "font-weight", "400")
		.УстановитьСвойствоКласса(".opi-version-badge", "white-space", "nowrap")
		.УстановитьСвойствоКласса(".opi-actions", "display", "flex")
		.УстановитьСвойствоКласса(".opi-actions", "flex-wrap", "wrap")
		.УстановитьСвойствоКласса(".opi-actions", "gap", "10px")
		.УстановитьСвойствоКласса(".opi-actions", "justify-content", "center")
		.УстановитьСвойствоКласса(".opi-actions", "margin-top", "16px")
		.УстановитьСвойствоКласса(".opi-button", "appearance", "none")
		.УстановитьСвойствоКласса(".opi-button", "display", "inline-flex")
		.УстановитьСвойствоКласса(".opi-button", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-button", "justify-content", "center")
		.УстановитьСвойствоКласса(".opi-button", "min-height", "34px")
		.УстановитьСвойствоКласса(".opi-button", "padding", "6px 16px")
		.УстановитьСвойствоКласса(".opi-button", "border", "1px solid rgba(27, 31, 35, 0.15)")
		.УстановитьСвойствоКласса(".opi-button", "border-radius", "16px")
		.УстановитьСвойствоКласса(".opi-button", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-button", "color", "#24292e")
		.УстановитьСвойствоКласса(".opi-button", "font-size", "14px")
		.УстановитьСвойствоКласса(".opi-button", "font-weight", "400")
		.УстановитьСвойствоКласса(".opi-button", "line-height", "20px")
		.УстановитьСвойствоКласса(".opi-button", "cursor", "pointer")
		.УстановитьСвойствоКласса(".opi-button", "white-space", "nowrap")
		.УстановитьСвойствоКласса(".opi-button:hover", "background", "#f3f4f6")
		.УстановитьСвойствоКласса(".opi-button:hover", "text-decoration", "none")
		.УстановитьСвойствоКласса(".opi-button--primary", "border-color", "#004943")
		.УстановитьСвойствоКласса(".opi-button--primary", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-button--primary:hover", "background", "#f0f7f6")
		.УстановитьСвойствоКласса(".opi-button--primary:hover", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-links", "display", "flex")
		.УстановитьСвойствоКласса(".opi-links", "flex-wrap", "wrap")
		.УстановитьСвойствоКласса(".opi-links", "gap", "12px 18px")
		.УстановитьСвойствоКласса(".opi-links", "justify-content", "center")
		.УстановитьСвойствоКласса(".opi-links", "margin-top", "14px")
		.УстановитьСвойствоКласса(".opi-link", "color", "rgba(0, 73, 67, 0.91)")
		.УстановитьСвойствоКласса(".opi-link", "font-weight", "500")
		.УстановитьСвойствоКласса(".opi-link", "text-decoration", "none")
		.УстановитьСвойствоКласса(".opi-link:hover", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-link:hover", "text-decoration", "underline")
		.УстановитьСвойствоКласса(".opi-section", "margin-top", "24px")
		.УстановитьСвойствоКласса(".opi-toolbar", "display", "flex")
		.УстановитьСвойствоКласса(".opi-toolbar", "flex-wrap", "wrap")
		.УстановитьСвойствоКласса(".opi-toolbar", "gap", "8px")
		.УстановитьСвойствоКласса(".opi-toolbar", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-toolbar", "margin-bottom", "12px")
		.УстановитьСвойствоКласса(".opi-table-wrap", "overflow", "auto")
		.УстановитьСвойствоКласса(".opi-table-wrap", "border", "1px solid rgba(27, 31, 35, 0.15)")
		.УстановитьСвойствоКласса(".opi-table-wrap", "border-radius", "8px")
		.УстановитьСвойствоКласса(".opi-table", "width", "100%")
		.УстановитьСвойствоКласса(".opi-table", "border-collapse", "collapse")
		.УстановитьСвойствоКласса(".opi-table", "font-size", "13px")
		.УстановитьСвойствоКласса(".opi-table th, .opi-table td", "padding", "10px 12px")
		.УстановитьСвойствоКласса(".opi-table th, .opi-table td", "border-bottom", "1px solid rgba(27, 31, 35, 0.08)")
		.УстановитьСвойствоКласса(".opi-table th, .opi-table td", "text-align", "left")
		.УстановитьСвойствоКласса(".opi-table th, .opi-table td", "vertical-align", "middle")
		.УстановитьСвойствоКласса(".opi-table th", "background", "#fafbfc")
		.УстановитьСвойствоКласса(".opi-table th", "font-weight", "500")
		.УстановитьСвойствоКласса(".opi-table th", "color", "#4b5563")
		.УстановитьСвойствоКласса(".opi-table tr:last-child td", "border-bottom", "none")
		.УстановитьСвойствоКласса(".opi-table tr:hover td", "background", "#fafbfc")
		.УстановитьСвойствоКласса(".opi-col-check", "width", "44px")
		.УстановитьСвойствоКласса(".opi-col-check", "text-align", "center")
		.УстановитьСвойствоКласса(".opi-table th.opi-col-check, .opi-table td.opi-col-check", "padding-left", "10px")
		.УстановитьСвойствоКласса(".opi-table th.opi-col-check, .opi-table td.opi-col-check", "padding-right", "10px")
		.УстановитьСвойствоКласса(".opi-checkbox", "width", "16px")
		.УстановитьСвойствоКласса(".opi-checkbox", "height", "16px")
		.УстановитьСвойствоКласса(".opi-checkbox", "accent-color", "#004943")
		.УстановитьСвойствоКласса(".opi-alert", "display", "flex")
		.УстановитьСвойствоКласса(".opi-alert", "gap", "14px")
		.УстановитьСвойствоКласса(".opi-alert", "align-items", "flex-start")
		.УстановитьСвойствоКласса(".opi-alert", "margin", "12px 0 16px")
		.УстановитьСвойствоКласса(".opi-alert", "padding", "12px 14px")
		.УстановитьСвойствоКласса(".opi-alert", "border", "1px solid rgba(27, 31, 35, 0.12)")
		.УстановитьСвойствоКласса(".opi-alert", "border-radius", "8px")
		.УстановитьСвойствоКласса(".opi-alert", "background", "#fafbfc")
		.УстановитьСвойствоКласса(".opi-alert--warning", "border-left", "4px solid #e6a700")
		.УстановитьСвойствоКласса(".opi-alert__icon", "width", "2rem")
		.УстановитьСвойствоКласса(".opi-alert__icon", "height", "2rem")
		.УстановитьСвойствоКласса(".opi-alert__icon", "flex-shrink", "0")
		.УстановитьСвойствоКласса(".opi-alert__icon", "color", "#e6a700")
		.УстановитьСвойствоКласса(".opi-alert__icon", "margin-top", "0.1rem")
		.УстановитьСвойствоКласса(".opi-alert__text", "margin", "0")
		.УстановитьСвойствоКласса(".opi-alert__text", "font-weight", "300")
		.УстановитьСвойствоКласса(".opi-alert__text", "color", "#333333")
		.УстановитьСвойствоКласса(".opi-alert__title", "margin", "0 0 0.5rem")
		.УстановитьСвойствоКласса(".opi-alert__title", "font-weight", "500")
		.УстановитьСвойствоКласса(".opi-alert__steps", "margin", "0")
		.УстановитьСвойствоКласса(".opi-alert__steps", "padding-left", "1.25rem")
		.УстановитьСвойствоКласса(".opi-alert__steps li", "margin", "0.2rem 0");

КонецПроцедуры

&НаСервере
Процедура СобратьHTMLПанели(ФормаHTML, ЛогоBase64)

	ВерсияОПИ       = OPI_Инструменты.ВерсияОПИ();
	СтрокиТаблицы   = СформироватьСтрокиТаблицыКомпонент();
	ТекстКнопки     = "<button type=""button"" class=""opi-button"" id=""%2"">%1</button>";
	ТекстСсылки     = "<a href=""#"" class=""opi-link"" id=""%2"">%1</a>";
	ТекстСтроки     = "<tr data-component=""%1""><td class=""opi-col-check""><input type=""checkbox"" class=""opi-checkbox"" id=""opi-addin-%1""%5></td><td>%2</td><td>%3</td><td>%4</td></tr>";

	ФормаHTML
		.ВставитьЭлемент("shell", "div", Истина, "", , , КлассыЭлемента("opi-shell"))
		.ВставитьЭлемент("header", "header", Истина, "shell", , , КлассыЭлемента("opi-header"))
		.ВставитьЭлемент("header-wrap", "div", Истина, "header", , , КлассыЭлемента("opi-header__wrap"))
		.ВставитьЭлемент("header-icon", "#raw", Ложь, "header-wrap", , , , ТекстИконкиШестерни())
		.ВставитьЭлемент("header-text", "div", Истина, "header-wrap", , , КлассыЭлемента("opi-header__text"))
		.ВставитьЭлемент("header-title", "h1", Истина, "header-text", , , КлассыЭлемента("opi-header__title"), "Панель управления расширением ОПИ")
		.ВставитьЭлемент("header-subtitle", "p", Истина, "header-text", , , КлассыЭлемента("opi-header__subtitle"), "Основная информация и настройки Открытого пакета интеграций")
		.ВставитьЭлемент("tab-main", "input", Ложь, "shell", АтрибутыHTML("type", "radio", "name", "opi-tab", "id", "opi-tab-main", "checked", "checked"), , КлассыЭлемента("opi-tab-input"))
		.ВставитьЭлемент("tab-addins", "input", Ложь, "shell", АтрибутыHTML("type", "radio", "name", "opi-tab", "id", "opi-tab-addins"), , КлассыЭлемента("opi-tab-input"))
		.ВставитьЭлемент("tabs", "nav", Истина, "shell", АтрибутыHTML("aria-label", "Разделы панели"), , КлассыЭлемента("opi-tabs"))
		.ВставитьЭлемент("tab-label-main", "label", Истина, "tabs", АтрибутыHTML("for", "opi-tab-main"), , КлассыЭлемента("opi-tab"), "Главная")
		.ВставитьЭлемент("tab-label-addins", "label", Истина, "tabs", АтрибутыHTML("for", "opi-tab-addins"), , КлассыЭлемента("opi-tab"), "Внешние компоненты OnClient")
		.ВставитьЭлемент("main", "main", Истина, "shell", , , КлассыЭлемента("opi-main"))
		.ВставитьЭлемент("panel-main", "section", Истина, "main", АтрибутыHTML("data-tab", "main"), , КлассыЭлемента("opi-tab-panel"))
		.ВставитьЭлемент("hero", "div", Истина, "panel-main", , , КлассыЭлемента("opi-hero"))
		.ВставитьЭлемент("logo", "div", Истина, "hero", АтрибутыHTML("id", "opi-logo"), , КлассыЭлемента("opi-logo"))
		.ВставитьЭлемент("logo-img", "img", Ложь, "logo", АтрибутыHTML("src", ЛогоBase64, "alt", "ОПИ"), , )
		.ВставитьЭлемент("hero-title", "h2", Истина, "hero", , , КлассыЭлемента("opi-hero__title"), "Открытый пакет интеграций")
		.ВставитьЭлемент("hero-tagline", "p", Истина, "hero", , , КлассыЭлемента("opi-hero__tagline"), "Набор инструментов интеграции с популярными сервисами и технологиями")
		.ВставитьЭлемент("hero-version", "span", Истина, "hero", АтрибутыHTML("id", "opi-version"), , КлассыЭлемента("opi-version-badge"), СтрШаблон("Версия %1", ВерсияОПИ))
		.ВставитьЭлемент("main-actions", "div", Истина, "panel-main", АтрибутыHTML("id", "opi-main-actions"), , КлассыЭлемента("opi-actions"))
		.ВставитьЭлемент("btn-docs", "#raw", Ложь, "main-actions", , , , СтрШаблон(ТекстКнопки, "Документация", "opi-btn-docs"))
		.ВставитьЭлемент("main-links", "div", Истина, "panel-main", АтрибутыHTML("id", "opi-main-links"), , КлассыЭлемента("opi-links"))
		.ВставитьЭлемент("link-license-ru", "#raw", Ложь, "main-links", , , , СтрШаблон(ТекстСсылки, "Лицензия (русский)", "opi-link-license-ru"))
		.ВставитьЭлемент("link-license-en", "#raw", Ложь, "main-links", , , , СтрШаблон(ТекстСсылки, "Лицензия (english)", "opi-link-license-en"))
		.ВставитьЭлемент("link-github", "#raw", Ложь, "main-links", , , , СтрШаблон(ТекстСсылки, "GitHub", "opi-link-github"))
		.ВставитьЭлемент("link-sourcecraft", "#raw", Ложь, "main-links", , , , СтрШаблон(ТекстСсылки, "SourceCraft", "opi-link-sourcecraft"))
		.ВставитьЭлемент("panel-addins", "section", Истина, "main", АтрибутыHTML("data-tab", "addins"), , КлассыЭлемента("opi-tab-panel"))
		.ВставитьЭлемент("addins-toolbar", "div", Истина, "panel-addins", АтрибутыHTML("id", "opi-addins-toolbar"), , КлассыЭлемента("opi-toolbar"))
		.ВставитьЭлемент("btn-select-all", "#raw", Ложь, "addins-toolbar", , , , СтрШаблон(ТекстКнопки, "Выделить все", "opi-btn-select-all"))
		.ВставитьЭлемент("btn-deselect-all", "#raw", Ложь, "addins-toolbar", , , , СтрШаблон(ТекстКнопки, "Снять все", "opi-btn-deselect-all"))
		.ВставитьЭлемент("btn-refresh-list", "#raw", Ложь, "addins-toolbar", , , , СтрШаблон(ТекстКнопки, "Обновить список", "opi-btn-refresh-list"))
		.ВставитьЭлемент("btn-install-addins", "#raw", Ложь, "addins-toolbar", , , , СтрШаблон(ТекстКнопки, "Установить компоненты на клиенте", "opi-btn-install-addins"))
		.ВставитьЭлемент("btn-open-cache", "#raw", Ложь, "addins-toolbar", , , , СтрШаблон(ТекстКнопки, "Открыть каталог кэша", "opi-btn-open-cache"))
		.ВставитьЭлемент("addins-alert", "div", Истина, "panel-addins", , , КлассыЭлемента("opi-alert", "opi-alert--warning"))
		.ВставитьЭлемент("addins-alert-icon", "#raw", Ложь, "addins-alert", , , , ТекстИконкиПредупреждения())
		.ВставитьЭлемент("addins-alert-text", "div", Истина, "addins-alert", , , КлассыЭлемента("opi-alert__text"))
		.ВставитьЭлемент("addins-alert-title", "p", Истина, "addins-alert-text", , , КлассыЭлемента("opi-alert__title"), "Порядок обновления компонент на клиенте при обновлении расширения на новую версию:")
		.ВставитьЭлемент("addins-alert-steps", "ol", Истина, "addins-alert-text", , , КлассыЭлемента("opi-alert__steps"))
		.ВставитьЭлемент("addins-step-1", "li", Истина, "addins-alert-steps", , , , "Открыть каталог внешних компонент (ExtCompT) при помощи кнопки «Открыть каталог кэша» или вручную")
		.ВставитьЭлемент("addins-step-2", "li", Истина, "addins-alert-steps", , , , "Удалить файлы компонент ОПИ (с префиксом AddIn.OPI_)")
		.ВставитьЭлемент("addins-step-3", "li", Истина, "addins-alert-steps", , , , "Перезапустить приложение и вернутся в данную обработку")
		.ВставитьЭлемент("addins-step-4", "li", Истина, "addins-alert-steps", , , , "Выделить необходимые компоненты и нажать «Установить компоненты на клиенте»")
		.ВставитьЭлемент("addins-table-wrap", "div", Истина, "panel-addins", , , КлассыЭлемента("opi-table-wrap"))
		.ВставитьЭлемент("addins-table", "table", Истина, "addins-table-wrap", АтрибутыHTML("id", "opi-addins-table"), , КлассыЭлемента("opi-table"))
		.ВставитьЭлемент("addins-thead", "thead", Истина, "addins-table")
		.ВставитьЭлемент("addins-head-row", "tr", Истина, "addins-thead")
		.ВставитьЭлемент("addins-head-check", "#raw", Ложь, "addins-head-row", , , , "<th class=""opi-col-check""><input type=""checkbox"" class=""opi-checkbox"" id=""opi-addins-check-all"" aria-label=""Выделить все""></th>")
		.ВставитьЭлемент("addins-head-name", "th", Истина, "addins-head-row", , , , "Имя")
		.ВставитьЭлемент("addins-head-cfg", "th", Истина, "addins-head-row", , , , "Версия в конфигурации")
		.ВставитьЭлемент("addins-head-client", "th", Истина, "addins-head-row", , , , "Версия клиента")
		.ВставитьЭлемент("addins-tbody", "tbody", Истина, "addins-table", АтрибутыHTML("id", "opi-addins-body"));

	Для Каждого СтрокаКомпоненты Из СтрокиТаблицы Цикл

		Идентификатор = СтрокаКомпоненты.ИмяКомпоненты;
		ФрагментСтроки = СтрШаблон(ТекстСтроки
			, Идентификатор
			, СтрокаКомпоненты.ИмяКомпоненты
			, СтрокаКомпоненты.ВерсияКонфигурации
			, СтрокаКомпоненты.ВерсияКлиента
			, "");

		ФормаHTML.ВставитьЭлемент("addin-row-" + Идентификатор, "#raw", Ложь, "addins-tbody", , , , ФрагментСтроки);

	КонецЦикла;

КонецПроцедуры

&НаСервере
Функция СформироватьСтрокиТаблицыКомпонент()

	ТаблицаКомпонент = Новый ТаблицаЗначений;
	ТаблицаКомпонент.Колонки.Добавить("ИмяКомпоненты");
	ТаблицаКомпонент.Колонки.Добавить("ВерсияКонфигурации");
	ТаблицаКомпонент.Колонки.Добавить("ВерсияКлиента");

	СписокКомпонент = OPI_УправлениеРасширением.ПолучитьСписокВерсийКомпонент();

	Для Каждого ДанныеКомпоненты Из СписокКомпонент Цикл

		НоваяСтрока = ТаблицаКомпонент.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, ДанныеКомпоненты);

	КонецЦикла;

	Возврат ТаблицаКомпонент;

КонецФункции

&НаСервере
Функция АтрибутыHTML(Знач Ключ1, Знач Значение1, Знач Ключ2 = "", Знач Значение2 = "", Знач Ключ3 = "", Знач Значение3 = "", Знач Ключ4 = "", Знач Значение4 = "")

	Результат = Новый Соответствие;
	Результат.Вставить(Ключ1, Значение1);

	Если ЗначениеЗаполнено(Ключ2) Тогда
		Результат.Вставить(Ключ2, Значение2);
	КонецЕсли;

	Если ЗначениеЗаполнено(Ключ3) Тогда
		Результат.Вставить(Ключ3, Значение3);
	КонецЕсли;

	Если ЗначениеЗаполнено(Ключ4) Тогда
		Результат.Вставить(Ключ4, Значение4);
	КонецЕсли;

	Возврат Результат;

КонецФункции

&НаСервере
Функция КлассыЭлемента(Знач Класс1, Знач Класс2 = "", Знач Класс3 = "")

	Результат = Новый Массив;
	Результат.Добавить(Класс1);

	Если ЗначениеЗаполнено(Класс2) Тогда
		Результат.Добавить(Класс2);
	КонецЕсли;

	Если ЗначениеЗаполнено(Класс3) Тогда
		Результат.Добавить(Класс3);
	КонецЕсли;

	Возврат Результат;

КонецФункции

&НаСервере
Функция ТекстИконкиШестерни()

	Возврат "<svg class=""opi-header__icon"" xmlns=""http://www.w3.org/2000/svg"" fill=""none"" viewBox=""0 0 24 24"" stroke-width=""1.5"" stroke=""currentColor"" stroke-linecap=""round"" stroke-linejoin=""round"" aria-hidden=""true""><path d=""M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 0 1 1.37.49l1.296 2.247a1.125 1.125 0 0 1-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 0 1 0 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 0 1-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 0 1-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 0 1-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 0 1-1.369-.49l-1.297-2.247a1.125 1.125 0 0 1 .26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 0 1 0-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 0 1-.26-1.43l1.297-2.247a1.125 1.125 0 0 1 1.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281Z""/><path d=""M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z""/></svg>";

КонецФункции

&НаСервере
Функция ТекстИконкиПредупреждения()

	Возврат "<svg class=""opi-alert__icon"" xmlns=""http://www.w3.org/2000/svg"" fill=""none"" viewBox=""0 0 24 24"" stroke-width=""1.5"" stroke=""currentColor"" stroke-linecap=""round"" stroke-linejoin=""round"" aria-hidden=""true""><path d=""M11.25 11.25l.041-.02a.75.75 0 0 1 1.063.852l-.708 2.836a.75.75 0 0 0 1.063.853l.041-.021M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9-3.75h.008v.008H12V8.25Z""/></svg>";

КонецФункции

#КонецОбласти
