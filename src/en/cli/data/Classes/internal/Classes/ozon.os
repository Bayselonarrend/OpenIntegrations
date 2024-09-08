Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoriesAndProductTypesTree";
    NewLine.МетодПоиска = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Attributes and features";
    NewLine.ОписаниеМетода   = "Returns the categories and types for products in a tree view";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoriesAndProductTypesTree";
    NewLine.МетодПоиска = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoriesAndProductTypesTree";
    NewLine.МетодПоиска = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Параметр    = "--lang";
    NewLine.Описание    = "Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) (optional, def. val. - DEFAULT)";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Attributes and features";
    NewLine.ОписаниеМетода   = "Gets the characteristics for the specified category and product type";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--categoryid";
    NewLine.Описание    = "Category identifier";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--typeid";
    NewLine.Описание    = "Item type identifier";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--lang";
    NewLine.Описание    = "Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) (optional, def. val. - DEFAULT)";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetAttributeValues";
    NewLine.МетодПоиска = "GETATTRIBUTEVALUES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Attributes and features";
    NewLine.ОписаниеМетода   = "Gets the list of available values of the attribute";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetAttributeValues";
    NewLine.МетодПоиска = "GETATTRIBUTEVALUES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetAttributeValues";
    NewLine.МетодПоиска = "GETATTRIBUTEVALUES";
    NewLine.Параметр    = "--categoryid";
    NewLine.Описание    = "Category identifier";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetAttributeValues";
    NewLine.МетодПоиска = "GETATTRIBUTEVALUES";
    NewLine.Параметр    = "--typeid";
    NewLine.Описание    = "Item type identifier";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetAttributeValues";
    NewLine.МетодПоиска = "GETATTRIBUTEVALUES";
    NewLine.Параметр    = "--attributeid";
    NewLine.Описание    = "Attribute IDs for obtaining values";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetAttributeValues";
    NewLine.МетодПоиска = "GETATTRIBUTEVALUES";
    NewLine.Параметр    = "--start";
    NewLine.Описание    = "ID of the first catalog in the response (optional, def. val. - 1)";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetAttributeValues";
    NewLine.МетодПоиска = "GETATTRIBUTEVALUES";
    NewLine.Параметр    = "--lang";
    NewLine.Описание    = "Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) (optional, def. val. - DEFAULT)";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "SearchAttributeValue";
    NewLine.МетодПоиска = "SEARCHATTRIBUTEVALUE";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Attributes and features";
    NewLine.ОписаниеМетода   = "Gets the reference values of the attribute by the specified value";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "SearchAttributeValue";
    NewLine.МетодПоиска = "SEARCHATTRIBUTEVALUE";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "SearchAttributeValue";
    NewLine.МетодПоиска = "SEARCHATTRIBUTEVALUE";
    NewLine.Параметр    = "--categoryid";
    NewLine.Описание    = "Category identifier";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "SearchAttributeValue";
    NewLine.МетодПоиска = "SEARCHATTRIBUTEVALUE";
    NewLine.Параметр    = "--typeid";
    NewLine.Описание    = "Item type identifier";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "SearchAttributeValue";
    NewLine.МетодПоиска = "SEARCHATTRIBUTEVALUE";
    NewLine.Параметр    = "--attributeid";
    NewLine.Описание    = "Attribute IDs for obtaining values";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "SearchAttributeValue";
    NewLine.МетодПоиска = "SEARCHATTRIBUTEVALUE";
    NewLine.Параметр    = "--value";
    NewLine.Описание    = "Search value";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsRequestsLimits";
    NewLine.МетодПоиска = "GETPRODUCTSREQUESTSLIMITS";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Attributes and features";
    NewLine.ОписаниеМетода   = "Get requests limits for products managment methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsRequestsLimits";
    NewLine.МетодПоиска = "GETPRODUCTSREQUESTSLIMITS";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductList";
    NewLine.МетодПоиска = "GETPRODUCTLIST";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets a list of products with or without filter";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductList";
    NewLine.МетодПоиска = "GETPRODUCTLIST";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductList";
    NewLine.МетодПоиска = "GETPRODUCTLIST";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Product selection filter. See GetProductsFilterStructure (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductList";
    NewLine.МетодПоиска = "GETPRODUCTLIST";
    NewLine.Параметр    = "--last";
    NewLine.Описание    = "ID of the last value (last_id) from the previous response (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsAttributesData";
    NewLine.МетодПоиска = "GETPRODUCTSATTRIBUTESDATA";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Retrieves product attributes descriptions with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsAttributesData";
    NewLine.МетодПоиска = "GETPRODUCTSATTRIBUTESDATA";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsAttributesData";
    NewLine.МетодПоиска = "GETPRODUCTSATTRIBUTESDATA";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Product selection filter. See GetProductsFilterStructure (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsAttributesData";
    NewLine.МетодПоиска = "GETPRODUCTSATTRIBUTESDATA";
    NewLine.Параметр    = "--last";
    NewLine.Описание    = "ID of the last value (last_id) from the previous response (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsInformation";
    NewLine.МетодПоиска = "GETPRODUCTSINFORMATION";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets information about products by an array of identifiers";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsInformation";
    NewLine.МетодПоиска = "GETPRODUCTSINFORMATION";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsInformation";
    NewLine.МетодПоиска = "GETPRODUCTSINFORMATION";
    NewLine.Параметр    = "--productid";
    NewLine.Описание    = "Products identifier (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsInformation";
    NewLine.МетодПоиска = "GETPRODUCTSINFORMATION";
    NewLine.Параметр    = "--sku";
    NewLine.Описание    = "Products identifiers in the Ozon system (SKU) (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsInformation";
    NewLine.МетодПоиска = "GETPRODUCTSINFORMATION";
    NewLine.Параметр    = "--offerid";
    NewLine.Описание    = "Item identifiers in the vendor's system (Article) (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductDescription";
    NewLine.МетодПоиска = "GETPRODUCTDESCRIPTION";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Get product description by IDs";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductDescription";
    NewLine.МетодПоиска = "GETPRODUCTDESCRIPTION";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductDescription";
    NewLine.МетодПоиска = "GETPRODUCTDESCRIPTION";
    NewLine.Параметр    = "--productid";
    NewLine.Описание    = "Product identifier (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductDescription";
    NewLine.МетодПоиска = "GETPRODUCTDESCRIPTION";
    NewLine.Параметр    = "--offerid";
    NewLine.Описание    = "Item identifier in the vendor's system (Article) (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsContentRating";
    NewLine.МетодПоиска = "GETPRODUCTSCONTENTRATING";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets products content rating by SKU";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsContentRating";
    NewLine.МетодПоиска = "GETPRODUCTSCONTENTRATING";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsContentRating";
    NewLine.МетодПоиска = "GETPRODUCTSCONTENTRATING";
    NewLine.Параметр    = "--sku";
    NewLine.Описание    = "Products identifiers in the Ozon system (SKU)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateUpdateProducts";
    NewLine.МетодПоиска = "CREATEUPDATEPRODUCTS";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Creates new products or updates existing products, based on data structures";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateUpdateProducts";
    NewLine.МетодПоиска = "CREATEUPDATEPRODUCTS";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateUpdateProducts";
    NewLine.МетодПоиска = "CREATEUPDATEPRODUCTS";
    NewLine.Параметр    = "--items";
    NewLine.Описание    = "Array or one structure of product description fields";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateProductByOzonID";
    NewLine.МетодПоиска = "CREATEPRODUCTBYOZONID";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Creates a product by specified Ozon ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateProductByOzonID";
    NewLine.МетодПоиска = "CREATEPRODUCTBYOZONID";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateProductByOzonID";
    NewLine.МетодПоиска = "CREATEPRODUCTBYOZONID";
    NewLine.Параметр    = "--items";
    NewLine.Описание    = "Array or one simplified structure of product fields";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductsAttributes";
    NewLine.МетодПоиска = "UPDATEPRODUCTSATTRIBUTES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Updates the attributes of the selected items";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductsAttributes";
    NewLine.МетодПоиска = "UPDATEPRODUCTSATTRIBUTES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductsAttributes";
    NewLine.МетодПоиска = "UPDATEPRODUCTSATTRIBUTES";
    NewLine.Параметр    = "--items";
    NewLine.Описание    = "Array or one structure of product attribute fields";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductImages";
    NewLine.МетодПоиска = "UPDATEPRODUCTIMAGES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Update images and marketing color";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductImages";
    NewLine.МетодПоиска = "UPDATEPRODUCTIMAGES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductImages";
    NewLine.МетодПоиска = "UPDATEPRODUCTIMAGES";
    NewLine.Параметр    = "--productid";
    NewLine.Описание    = "Product identifier";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductImages";
    NewLine.МетодПоиска = "UPDATEPRODUCTIMAGES";
    NewLine.Параметр    = "--images";
    NewLine.Описание    = "Array of images URLs (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductImages";
    NewLine.МетодПоиска = "UPDATEPRODUCTIMAGES";
    NewLine.Параметр    = "--images360";
    NewLine.Описание    = "Array of 360 images (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductImages";
    NewLine.МетодПоиска = "UPDATEPRODUCTIMAGES";
    NewLine.Параметр    = "--color";
    NewLine.Описание    = "Marketing color (optional, def. val. - Empty value)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CheckProductsImagesUpload";
    NewLine.МетодПоиска = "CHECKPRODUCTSIMAGESUPLOAD";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Check images upload by products IDs";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CheckProductsImagesUpload";
    NewLine.МетодПоиска = "CHECKPRODUCTSIMAGESUPLOAD";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CheckProductsImagesUpload";
    NewLine.МетодПоиска = "CHECKPRODUCTSIMAGESUPLOAD";
    NewLine.Параметр    = "--products";
    NewLine.Описание    = "Product IDs to be inspected";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductsArticles";
    NewLine.МетодПоиска = "UPDATEPRODUCTSARTICLES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Modifies articles of existing products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductsArticles";
    NewLine.МетодПоиска = "UPDATEPRODUCTSARTICLES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UpdateProductsArticles";
    NewLine.МетодПоиска = "UPDATEPRODUCTSARTICLES";
    NewLine.Параметр    = "--offers";
    NewLine.Описание    = "Articles: Key > current, Value > new";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "ArchiveProducts";
    NewLine.МетодПоиска = "ARCHIVEPRODUCTS";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Moves selected items to the archive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "ArchiveProducts";
    NewLine.МетодПоиска = "ARCHIVEPRODUCTS";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "ArchiveProducts";
    NewLine.МетодПоиска = "ARCHIVEPRODUCTS";
    NewLine.Параметр    = "--products";
    NewLine.Описание    = "Product IDs for archiving";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UnarchiveProducts";
    NewLine.МетодПоиска = "UNARCHIVEPRODUCTS";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Returns selected items from the archive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UnarchiveProducts";
    NewLine.МетодПоиска = "UNARCHIVEPRODUCTS";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UnarchiveProducts";
    NewLine.МетодПоиска = "UNARCHIVEPRODUCTS";
    NewLine.Параметр    = "--products";
    NewLine.Описание    = "Product IDs for recovery";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "DeleteProductsWithoutSKU";
    NewLine.МетодПоиска = "DELETEPRODUCTSWITHOUTSKU";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Deletes products without SKU from archive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "DeleteProductsWithoutSKU";
    NewLine.МетодПоиска = "DELETEPRODUCTSWITHOUTSKU";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "DeleteProductsWithoutSKU";
    NewLine.МетодПоиска = "DELETEPRODUCTSWITHOUTSKU";
    NewLine.Параметр    = "--articles";
    NewLine.Описание    = "Products articles";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UploadProductActivationCodes";
    NewLine.МетодПоиска = "UPLOADPRODUCTACTIVATIONCODES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Uploads activation codes for a digital product or service";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UploadProductActivationCodes";
    NewLine.МетодПоиска = "UPLOADPRODUCTACTIVATIONCODES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UploadProductActivationCodes";
    NewLine.МетодПоиска = "UPLOADPRODUCTACTIVATIONCODES";
    NewLine.Параметр    = "--productid";
    NewLine.Описание    = "Product ID";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "UploadProductActivationCodes";
    NewLine.МетодПоиска = "UPLOADPRODUCTACTIVATIONCODES";
    NewLine.Параметр    = "--codes";
    NewLine.Описание    = "Digital product activation codes";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductSubscribersCount";
    NewLine.МетодПоиска = "GETPRODUCTSUBSCRIBERSCOUNT";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets the number of users who clicked Know about arrival button on the product page";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductSubscribersCount";
    NewLine.МетодПоиска = "GETPRODUCTSUBSCRIBERSCOUNT";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductSubscribersCount";
    NewLine.МетодПоиска = "GETPRODUCTSUBSCRIBERSCOUNT";
    NewLine.Параметр    = "--sku";
    NewLine.Описание    = "Products identifiers in the Ozon system (SKU)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetRelatedSKUs";
    NewLine.МетодПоиска = "GETRELATEDSKUS";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets a single SKU from the old SKU FBS and SKU FBO identifiers";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetRelatedSKUs";
    NewLine.МетодПоиска = "GETRELATEDSKUS";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetRelatedSKUs";
    NewLine.МетодПоиска = "GETRELATEDSKUS";
    NewLine.Параметр    = "--sku";
    NewLine.Описание    = "Products identifiers in the Ozon system (SKU)";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductCreationStatus";
    NewLine.МетодПоиска = "GETPRODUCTCREATIONSTATUS";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets the status of adding a new product by task ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductCreationStatus";
    NewLine.МетодПоиска = "GETPRODUCTCREATIONSTATUS";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductCreationStatus";
    NewLine.МетодПоиска = "GETPRODUCTCREATIONSTATUS";
    NewLine.Параметр    = "--taskid";
    NewLine.Описание    = "Add product task ID";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCodesUploadStatus";
    NewLine.МетодПоиска = "GETCODESUPLOADSTATUS";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets the status of digital item codes upload by task ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCodesUploadStatus";
    NewLine.МетодПоиска = "GETCODESUPLOADSTATUS";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCodesUploadStatus";
    NewLine.МетодПоиска = "GETCODESUPLOADSTATUS";
    NewLine.Параметр    = "--taskid";
    NewLine.Описание    = "Add product task ID";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductStructure";
    NewLine.МетодПоиска = "GETPRODUCTSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets the structure of product standard fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetSimplifiedProductStructure";
    NewLine.МетодПоиска = "GETSIMPLIFIEDPRODUCTSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets the structure for creating a product based on Ozon ID in the CreateProductByOzonID function()";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetAttributesUpdateStructure";
    NewLine.МетодПоиска = "GETATTRIBUTESUPDATESTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets the structure for updating product characteristics in the UpdateProductsAttributes function()";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetProductsFilterStructure";
    NewLine.МетодПоиска = "GETPRODUCTSFILTERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Gets the structure for products list selecting in the GetProductList function";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "AddProductVideo";
    NewLine.МетодПоиска = "ADDPRODUCTVIDEO";
    NewLine.Параметр    = "--item";
    NewLine.Описание    = "The basic structure of the product fields. See GetProductStructure";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Adds video to product attributes";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "AddProductVideo";
    NewLine.МетодПоиска = "ADDPRODUCTVIDEO";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of the video";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "AddProductVideo";
    NewLine.МетодПоиска = "ADDPRODUCTVIDEO";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Technical name of the video";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "AddProductVideoCover";
    NewLine.МетодПоиска = "ADDPRODUCTVIDEOCOVER";
    NewLine.Параметр    = "--item";
    NewLine.Описание    = "The basic structure of the product fields. See GetProductStructure";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Adds a video cover to the product attributes";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "AddProductVideoCover";
    NewLine.МетодПоиска = "ADDPRODUCTVIDEOCOVER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of the video cover";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CompleteComplexAttribute";
    NewLine.МетодПоиска = "COMPLETECOMPLEXATTRIBUTE";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Complex attribute structure or product structure";
    NewLine.Область     = "Uploading and updating products";
    NewLine.ОписаниеМетода   = "Formats the value in attribute format and adds it to the <attributes> array of the collection";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CompleteComplexAttribute";
    NewLine.МетодПоиска = "COMPLETECOMPLEXATTRIBUTE";
    NewLine.Параметр    = "--attributeid";
    NewLine.Описание    = "Attribute ID";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CompleteComplexAttribute";
    NewLine.МетодПоиска = "COMPLETECOMPLEXATTRIBUTE";
    NewLine.Параметр    = "--complexid";
    NewLine.Описание    = "Complex attribute ID";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CompleteComplexAttribute";
    NewLine.МетодПоиска = "COMPLETECOMPLEXATTRIBUTE";
    NewLine.Параметр    = "--values";
    NewLine.Описание    = "Value or array of values to add to <values> field";
    NewLine.Область     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "BindBarcodes";
    NewLine.МетодПоиска = "BINDBARCODES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Barcodes";
    NewLine.ОписаниеМетода   = "Binds barcodes to products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "BindBarcodes";
    NewLine.МетодПоиска = "BINDBARCODES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Barcodes";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "BindBarcodes";
    NewLine.МетодПоиска = "BINDBARCODES";
    NewLine.Параметр    = "--barcodes";
    NewLine.Описание    = "Key > product SKU, Value > barcode";
    NewLine.Область     = "Barcodes";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateBarcodes";
    NewLine.МетодПоиска = "CREATEBARCODES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Barcodes";
    NewLine.ОписаниеМетода   = "Generates new barcodes for products";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateBarcodes";
    NewLine.МетодПоиска = "CREATEBARCODES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Barcodes";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "CreateBarcodes";
    NewLine.МетодПоиска = "CREATEBARCODES";
    NewLine.Параметр    = "--productids";
    NewLine.Описание    = "Products IDs for barcodes creating";
    NewLine.Область     = "Barcodes";

    Return CompositionTable;
EndFunction

