
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCategoriesAndProductTypesTree";
    NewLine.SearchMethod = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Attributes and features";
    NewLine.MethodDescription   = "Returns the categories and types for products in a tree view";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCategoriesAndProductTypesTree";
    NewLine.SearchMethod = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCategoriesAndProductTypesTree";
    NewLine.SearchMethod = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Parameter    = "--lang";
    NewLine.Description    = "Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) (optional, def. val. - DEFAULT)";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCategoryAttributes";
    NewLine.SearchMethod = "GETCATEGORYATTRIBUTES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Attributes and features";
    NewLine.MethodDescription   = "Gets the characteristics for the specified category and product type";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCategoryAttributes";
    NewLine.SearchMethod = "GETCATEGORYATTRIBUTES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCategoryAttributes";
    NewLine.SearchMethod = "GETCATEGORYATTRIBUTES";
    NewLine.Parameter    = "--categoryid";
    NewLine.Description    = "Category identifier";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCategoryAttributes";
    NewLine.SearchMethod = "GETCATEGORYATTRIBUTES";
    NewLine.Parameter    = "--typeid";
    NewLine.Description    = "Item type identifier";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCategoryAttributes";
    NewLine.SearchMethod = "GETCATEGORYATTRIBUTES";
    NewLine.Parameter    = "--lang";
    NewLine.Description    = "Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) (optional, def. val. - DEFAULT)";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAttributeValues";
    NewLine.SearchMethod = "GETATTRIBUTEVALUES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Attributes and features";
    NewLine.MethodDescription   = "Gets the list of available values of the attribute";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAttributeValues";
    NewLine.SearchMethod = "GETATTRIBUTEVALUES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAttributeValues";
    NewLine.SearchMethod = "GETATTRIBUTEVALUES";
    NewLine.Parameter    = "--categoryid";
    NewLine.Description    = "Category identifier";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAttributeValues";
    NewLine.SearchMethod = "GETATTRIBUTEVALUES";
    NewLine.Parameter    = "--typeid";
    NewLine.Description    = "Item type identifier";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAttributeValues";
    NewLine.SearchMethod = "GETATTRIBUTEVALUES";
    NewLine.Parameter    = "--attributeid";
    NewLine.Description    = "Attribute IDs for obtaining values";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAttributeValues";
    NewLine.SearchMethod = "GETATTRIBUTEVALUES";
    NewLine.Parameter    = "--start";
    NewLine.Description    = "ID of the first catalog in the response (optional, def. val. - 1)";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAttributeValues";
    NewLine.SearchMethod = "GETATTRIBUTEVALUES";
    NewLine.Parameter    = "--lang";
    NewLine.Description    = "Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) (optional, def. val. - DEFAULT)";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SearchAttributeValue";
    NewLine.SearchMethod = "SEARCHATTRIBUTEVALUE";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Attributes and features";
    NewLine.MethodDescription   = "Gets the reference values of the attribute by the specified value";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SearchAttributeValue";
    NewLine.SearchMethod = "SEARCHATTRIBUTEVALUE";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SearchAttributeValue";
    NewLine.SearchMethod = "SEARCHATTRIBUTEVALUE";
    NewLine.Parameter    = "--categoryid";
    NewLine.Description    = "Category identifier";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SearchAttributeValue";
    NewLine.SearchMethod = "SEARCHATTRIBUTEVALUE";
    NewLine.Parameter    = "--typeid";
    NewLine.Description    = "Item type identifier";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SearchAttributeValue";
    NewLine.SearchMethod = "SEARCHATTRIBUTEVALUE";
    NewLine.Parameter    = "--attributeid";
    NewLine.Description    = "Attribute IDs for obtaining values";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SearchAttributeValue";
    NewLine.SearchMethod = "SEARCHATTRIBUTEVALUE";
    NewLine.Parameter    = "--value";
    NewLine.Description    = "Search value";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsRequestsLimits";
    NewLine.SearchMethod = "GETPRODUCTSREQUESTSLIMITS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Attributes and features";
    NewLine.MethodDescription   = "Get requests limits for products management methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsRequestsLimits";
    NewLine.SearchMethod = "GETPRODUCTSREQUESTSLIMITS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductList";
    NewLine.SearchMethod = "GETPRODUCTLIST";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets a list of products with or without filter";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductList";
    NewLine.SearchMethod = "GETPRODUCTLIST";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductList";
    NewLine.SearchMethod = "GETPRODUCTLIST";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Product selection filter. See GetProductsFilterStructure (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductList";
    NewLine.SearchMethod = "GETPRODUCTLIST";
    NewLine.Parameter    = "--last";
    NewLine.Description    = "ID of the last value (last_id) from the previous response (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsAttributesData";
    NewLine.SearchMethod = "GETPRODUCTSATTRIBUTESDATA";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Retrieves product attributes descriptions with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsAttributesData";
    NewLine.SearchMethod = "GETPRODUCTSATTRIBUTESDATA";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsAttributesData";
    NewLine.SearchMethod = "GETPRODUCTSATTRIBUTESDATA";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Product selection filter. See GetProductsFilterStructure (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsAttributesData";
    NewLine.SearchMethod = "GETPRODUCTSATTRIBUTESDATA";
    NewLine.Parameter    = "--last";
    NewLine.Description    = "ID of the last value (last_id) from the previous response (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsInformation";
    NewLine.SearchMethod = "GETPRODUCTSINFORMATION";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets information about products by an array of identifiers";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsInformation";
    NewLine.SearchMethod = "GETPRODUCTSINFORMATION";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsInformation";
    NewLine.SearchMethod = "GETPRODUCTSINFORMATION";
    NewLine.Parameter    = "--productid";
    NewLine.Description    = "Products identifier (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsInformation";
    NewLine.SearchMethod = "GETPRODUCTSINFORMATION";
    NewLine.Parameter    = "--sku";
    NewLine.Description    = "Products identifiers in the Ozon system (SKU) (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsInformation";
    NewLine.SearchMethod = "GETPRODUCTSINFORMATION";
    NewLine.Parameter    = "--offerid";
    NewLine.Description    = "Item identifiers in the vendor's system (Article) (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductDescription";
    NewLine.SearchMethod = "GETPRODUCTDESCRIPTION";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Get product description by IDs";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductDescription";
    NewLine.SearchMethod = "GETPRODUCTDESCRIPTION";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductDescription";
    NewLine.SearchMethod = "GETPRODUCTDESCRIPTION";
    NewLine.Parameter    = "--productid";
    NewLine.Description    = "Product identifier (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductDescription";
    NewLine.SearchMethod = "GETPRODUCTDESCRIPTION";
    NewLine.Parameter    = "--offerid";
    NewLine.Description    = "Item identifier in the vendor's system (Article) (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsContentRating";
    NewLine.SearchMethod = "GETPRODUCTSCONTENTRATING";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets products content rating by SKU";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsContentRating";
    NewLine.SearchMethod = "GETPRODUCTSCONTENTRATING";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsContentRating";
    NewLine.SearchMethod = "GETPRODUCTSCONTENTRATING";
    NewLine.Parameter    = "--sku";
    NewLine.Description    = "Products identifiers in the Ozon system (SKU)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateUpdateProducts";
    NewLine.SearchMethod = "CREATEUPDATEPRODUCTS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Creates new products or updates existing products, based on data structures";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateUpdateProducts";
    NewLine.SearchMethod = "CREATEUPDATEPRODUCTS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateUpdateProducts";
    NewLine.SearchMethod = "CREATEUPDATEPRODUCTS";
    NewLine.Parameter    = "--items";
    NewLine.Description    = "Array or one structure of product description fields";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateProductByOzonID";
    NewLine.SearchMethod = "CREATEPRODUCTBYOZONID";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Creates a product by specified Ozon ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateProductByOzonID";
    NewLine.SearchMethod = "CREATEPRODUCTBYOZONID";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateProductByOzonID";
    NewLine.SearchMethod = "CREATEPRODUCTBYOZONID";
    NewLine.Parameter    = "--items";
    NewLine.Description    = "Array or one simplified structure of product fields";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsAttributes";
    NewLine.SearchMethod = "UPDATEPRODUCTSATTRIBUTES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Updates the attributes of the selected items";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsAttributes";
    NewLine.SearchMethod = "UPDATEPRODUCTSATTRIBUTES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsAttributes";
    NewLine.SearchMethod = "UPDATEPRODUCTSATTRIBUTES";
    NewLine.Parameter    = "--items";
    NewLine.Description    = "Array or one structure of product attribute fields";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductImages";
    NewLine.SearchMethod = "UPDATEPRODUCTIMAGES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Update images and marketing color";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductImages";
    NewLine.SearchMethod = "UPDATEPRODUCTIMAGES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductImages";
    NewLine.SearchMethod = "UPDATEPRODUCTIMAGES";
    NewLine.Parameter    = "--productid";
    NewLine.Description    = "Product identifier";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductImages";
    NewLine.SearchMethod = "UPDATEPRODUCTIMAGES";
    NewLine.Parameter    = "--images";
    NewLine.Description    = "Array of images URLs (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductImages";
    NewLine.SearchMethod = "UPDATEPRODUCTIMAGES";
    NewLine.Parameter    = "--images360";
    NewLine.Description    = "Array of 360 images (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductImages";
    NewLine.SearchMethod = "UPDATEPRODUCTIMAGES";
    NewLine.Parameter    = "--color";
    NewLine.Description    = "Marketing color (optional, def. val. - Empty value)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CheckProductsImagesUpload";
    NewLine.SearchMethod = "CHECKPRODUCTSIMAGESUPLOAD";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Check images upload by products IDs";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CheckProductsImagesUpload";
    NewLine.SearchMethod = "CHECKPRODUCTSIMAGESUPLOAD";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CheckProductsImagesUpload";
    NewLine.SearchMethod = "CHECKPRODUCTSIMAGESUPLOAD";
    NewLine.Parameter    = "--products";
    NewLine.Description    = "Product IDs to be inspected";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsArticles";
    NewLine.SearchMethod = "UPDATEPRODUCTSARTICLES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Modifies articles of existing products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsArticles";
    NewLine.SearchMethod = "UPDATEPRODUCTSARTICLES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsArticles";
    NewLine.SearchMethod = "UPDATEPRODUCTSARTICLES";
    NewLine.Parameter    = "--offers";
    NewLine.Description    = "Articles: Key > current, Value > new";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "ArchiveProducts";
    NewLine.SearchMethod = "ARCHIVEPRODUCTS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Moves selected items to the archive";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "ArchiveProducts";
    NewLine.SearchMethod = "ARCHIVEPRODUCTS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "ArchiveProducts";
    NewLine.SearchMethod = "ARCHIVEPRODUCTS";
    NewLine.Parameter    = "--products";
    NewLine.Description    = "Product IDs for archiving";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UnarchiveProducts";
    NewLine.SearchMethod = "UNARCHIVEPRODUCTS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Returns selected items from the archive";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UnarchiveProducts";
    NewLine.SearchMethod = "UNARCHIVEPRODUCTS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UnarchiveProducts";
    NewLine.SearchMethod = "UNARCHIVEPRODUCTS";
    NewLine.Parameter    = "--products";
    NewLine.Description    = "Product IDs for recovery";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "DeleteProductsWithoutSKU";
    NewLine.SearchMethod = "DELETEPRODUCTSWITHOUTSKU";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Deletes products without SKU from archive";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "DeleteProductsWithoutSKU";
    NewLine.SearchMethod = "DELETEPRODUCTSWITHOUTSKU";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "DeleteProductsWithoutSKU";
    NewLine.SearchMethod = "DELETEPRODUCTSWITHOUTSKU";
    NewLine.Parameter    = "--articles";
    NewLine.Description    = "Products articles";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UploadProductActivationCodes";
    NewLine.SearchMethod = "UPLOADPRODUCTACTIVATIONCODES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Uploads activation codes for a digital product or service";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UploadProductActivationCodes";
    NewLine.SearchMethod = "UPLOADPRODUCTACTIVATIONCODES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UploadProductActivationCodes";
    NewLine.SearchMethod = "UPLOADPRODUCTACTIVATIONCODES";
    NewLine.Parameter    = "--productid";
    NewLine.Description    = "Product ID";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UploadProductActivationCodes";
    NewLine.SearchMethod = "UPLOADPRODUCTACTIVATIONCODES";
    NewLine.Parameter    = "--codes";
    NewLine.Description    = "Digital product activation codes";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductSubscribersCount";
    NewLine.SearchMethod = "GETPRODUCTSUBSCRIBERSCOUNT";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets the number of users who clicked Know about arrival button on the product page";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductSubscribersCount";
    NewLine.SearchMethod = "GETPRODUCTSUBSCRIBERSCOUNT";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductSubscribersCount";
    NewLine.SearchMethod = "GETPRODUCTSUBSCRIBERSCOUNT";
    NewLine.Parameter    = "--sku";
    NewLine.Description    = "Products identifiers in the Ozon system (SKU)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetRelatedSKUs";
    NewLine.SearchMethod = "GETRELATEDSKUS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets a single SKU from the old SKU FBS and SKU FBO identifiers";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetRelatedSKUs";
    NewLine.SearchMethod = "GETRELATEDSKUS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetRelatedSKUs";
    NewLine.SearchMethod = "GETRELATEDSKUS";
    NewLine.Parameter    = "--sku";
    NewLine.Description    = "Products identifiers in the Ozon system (SKU)";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductCreationStatus";
    NewLine.SearchMethod = "GETPRODUCTCREATIONSTATUS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets the status of adding a new product by task ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductCreationStatus";
    NewLine.SearchMethod = "GETPRODUCTCREATIONSTATUS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductCreationStatus";
    NewLine.SearchMethod = "GETPRODUCTCREATIONSTATUS";
    NewLine.Parameter    = "--taskid";
    NewLine.Description    = "Add product task ID";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCodesUploadStatus";
    NewLine.SearchMethod = "GETCODESUPLOADSTATUS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets the status of digital item codes upload by task ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCodesUploadStatus";
    NewLine.SearchMethod = "GETCODESUPLOADSTATUS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCodesUploadStatus";
    NewLine.SearchMethod = "GETCODESUPLOADSTATUS";
    NewLine.Parameter    = "--taskid";
    NewLine.Description    = "Add product task ID";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductStructure";
    NewLine.SearchMethod = "GETPRODUCTSTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets the structure of product standard fields";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetSimplifiedProductStructure";
    NewLine.SearchMethod = "GETSIMPLIFIEDPRODUCTSTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets the structure for creating a product based on Ozon ID in the CreateProductByOzonID function()";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAttributesUpdateStructure";
    NewLine.SearchMethod = "GETATTRIBUTESUPDATESTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets the structure for updating product characteristics in the UpdateProductsAttributes function()";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsFilterStructure";
    NewLine.SearchMethod = "GETPRODUCTSFILTERSTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Gets the structure for selecting the list of products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "AddProductVideo";
    NewLine.SearchMethod = "ADDPRODUCTVIDEO";
    NewLine.Parameter    = "--item";
    NewLine.Description    = "The basic structure of the product fields. See GetProductStructure";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Adds video to product attributes";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "AddProductVideo";
    NewLine.SearchMethod = "ADDPRODUCTVIDEO";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "URL of the video";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "AddProductVideo";
    NewLine.SearchMethod = "ADDPRODUCTVIDEO";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Technical name of the video";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "AddProductVideoCover";
    NewLine.SearchMethod = "ADDPRODUCTVIDEOCOVER";
    NewLine.Parameter    = "--item";
    NewLine.Description    = "The basic structure of the product fields. See GetProductStructure";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Adds a video cover to the product attributes";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "AddProductVideoCover";
    NewLine.SearchMethod = "ADDPRODUCTVIDEOCOVER";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "URL of the video cover";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CompleteComplexAttribute";
    NewLine.SearchMethod = "COMPLETECOMPLEXATTRIBUTE";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Complex attribute structure or product structure";
    NewLine.Region     = "Uploading and updating products";
    NewLine.MethodDescription   = "Formats the value in attribute format and adds it to the Attributes array of the collection";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CompleteComplexAttribute";
    NewLine.SearchMethod = "COMPLETECOMPLEXATTRIBUTE";
    NewLine.Parameter    = "--attributeid";
    NewLine.Description    = "Attribute ID";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CompleteComplexAttribute";
    NewLine.SearchMethod = "COMPLETECOMPLEXATTRIBUTE";
    NewLine.Parameter    = "--complexid";
    NewLine.Description    = "Complex attribute ID";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CompleteComplexAttribute";
    NewLine.SearchMethod = "COMPLETECOMPLEXATTRIBUTE";
    NewLine.Parameter    = "--values";
    NewLine.Description    = "Value or array of values to add to Values field";
    NewLine.Region     = "Uploading and updating products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "BindBarcodes";
    NewLine.SearchMethod = "BINDBARCODES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Barcodes";
    NewLine.MethodDescription   = "Binds barcodes to products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "BindBarcodes";
    NewLine.SearchMethod = "BINDBARCODES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Barcodes";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "BindBarcodes";
    NewLine.SearchMethod = "BINDBARCODES";
    NewLine.Parameter    = "--barcodes";
    NewLine.Description    = "Key > product SKU, Value > barcode";
    NewLine.Region     = "Barcodes";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateBarcodes";
    NewLine.SearchMethod = "CREATEBARCODES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Barcodes";
    NewLine.MethodDescription   = "Generates new barcodes for products";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateBarcodes";
    NewLine.SearchMethod = "CREATEBARCODES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Barcodes";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateBarcodes";
    NewLine.SearchMethod = "CREATEBARCODES";
    NewLine.Parameter    = "--productids";
    NewLine.Description    = "Products IDs for barcodes creating";
    NewLine.Region     = "Barcodes";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsStocks";
    NewLine.SearchMethod = "GETPRODUCTSSTOCKS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Prices and stocks";
    NewLine.MethodDescription   = "Gets the number of items in the balance with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsStocks";
    NewLine.SearchMethod = "GETPRODUCTSSTOCKS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsStocks";
    NewLine.SearchMethod = "GETPRODUCTSSTOCKS";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Product selection filter. See GetProductsFilterStructure (optional, def. val. - Empty value)";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsStocks";
    NewLine.SearchMethod = "GETPRODUCTSSTOCKS";
    NewLine.Parameter    = "--last";
    NewLine.Description    = "ID of the last value (last_id) from the previous response (optional, def. val. - Empty value)";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsPrices";
    NewLine.SearchMethod = "GETPRODUCTSPRICES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Prices and stocks";
    NewLine.MethodDescription   = "Gets products prices with or without filter";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsPrices";
    NewLine.SearchMethod = "GETPRODUCTSPRICES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsPrices";
    NewLine.SearchMethod = "GETPRODUCTSPRICES";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Product selection filter. See GetProductsFilterStructure (optional, def. val. - Empty value)";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductsPrices";
    NewLine.SearchMethod = "GETPRODUCTSPRICES";
    NewLine.Parameter    = "--last";
    NewLine.Description    = "ID of the last value (last_id) from the previous response (optional, def. val. - Empty value)";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetDiscountInformation";
    NewLine.SearchMethod = "GETDISCOUNTINFORMATION";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Prices and stocks";
    NewLine.MethodDescription   = "Retrieves discount and main product information by SKU of the discounted items";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetDiscountInformation";
    NewLine.SearchMethod = "GETDISCOUNTINFORMATION";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetDiscountInformation";
    NewLine.SearchMethod = "GETDISCOUNTINFORMATION";
    NewLine.Parameter    = "--sku";
    NewLine.Description    = "SKU of discounted products";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsStocks";
    NewLine.SearchMethod = "UPDATEPRODUCTSSTOCKS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Prices and stocks";
    NewLine.MethodDescription   = "Changes the information about the stock amount of a product";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsStocks";
    NewLine.SearchMethod = "UPDATEPRODUCTSSTOCKS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsStocks";
    NewLine.SearchMethod = "UPDATEPRODUCTSSTOCKS";
    NewLine.Parameter    = "--stocks";
    NewLine.Description    = "Array of stocks data. See GetProductStocksStructure";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsPrices";
    NewLine.SearchMethod = "UPDATEPRODUCTSPRICES";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Prices and stocks";
    NewLine.MethodDescription   = "Changes the price of one or more items";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsPrices";
    NewLine.SearchMethod = "UPDATEPRODUCTSPRICES";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "UpdateProductsPrices";
    NewLine.SearchMethod = "UPDATEPRODUCTSPRICES";
    NewLine.Parameter    = "--prices";
    NewLine.Description    = "Products prices. See GetProductPriceStructure";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SetProductDiscount";
    NewLine.SearchMethod = "SETPRODUCTDISCOUNT";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Prices and stocks";
    NewLine.MethodDescription   = "Sets the amount of discount on discounted products sold under the FBS scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SetProductDiscount";
    NewLine.SearchMethod = "SETPRODUCTDISCOUNT";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SetProductDiscount";
    NewLine.SearchMethod = "SETPRODUCTDISCOUNT";
    NewLine.Parameter    = "--productid";
    NewLine.Description    = "Product identifier";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "SetProductDiscount";
    NewLine.SearchMethod = "SETPRODUCTDISCOUNT";
    NewLine.Parameter    = "--discount";
    NewLine.Description    = "Discount amount";
    NewLine.Region     = "Prices and stocks";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductStocksStructure";
    NewLine.SearchMethod = "GETPRODUCTSTOCKSSTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Prices and stocks";
    NewLine.MethodDescription   = "Gets the data structure for udpating product stocks in the UpdateProductsStocks function";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetProductPriceStructure";
    NewLine.SearchMethod = "GETPRODUCTPRICESTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Prices and stocks";
    NewLine.MethodDescription   = "Gets the product price structure for the UpdateProductsPrices function";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetPromotionsList";
    NewLine.SearchMethod = "GETPROMOTIONSLIST";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Promotions management";
    NewLine.MethodDescription   = "Gets a list of available promotions";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetPromotionsList";
    NewLine.SearchMethod = "GETPROMOTIONSLIST";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Promotions management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAvailablePromoProducts";
    NewLine.SearchMethod = "GETAVAILABLEPROMOPRODUCTS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Promotions management";
    NewLine.MethodDescription   = "Gets the products available in the selected promotion";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAvailablePromoProducts";
    NewLine.SearchMethod = "GETAVAILABLEPROMOPRODUCTS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Promotions management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAvailablePromoProducts";
    NewLine.SearchMethod = "GETAVAILABLEPROMOPRODUCTS";
    NewLine.Parameter    = "--actionid";
    NewLine.Description    = "Promo ID";
    NewLine.Region     = "Promotions management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetAvailablePromoProducts";
    NewLine.SearchMethod = "GETAVAILABLEPROMOPRODUCTS";
    NewLine.Parameter    = "--offset";
    NewLine.Description    = "Offst of items list (optional, def. val. - Empty value)";
    NewLine.Region     = "Promotions management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCurrentPromoProducts";
    NewLine.SearchMethod = "GETCURRENTPROMOPRODUCTS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Promotions management";
    NewLine.MethodDescription   = "Gets the products featured in the selected promotion";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCurrentPromoProducts";
    NewLine.SearchMethod = "GETCURRENTPROMOPRODUCTS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Promotions management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCurrentPromoProducts";
    NewLine.SearchMethod = "GETCURRENTPROMOPRODUCTS";
    NewLine.Parameter    = "--actionid";
    NewLine.Description    = "Promo ID";
    NewLine.Region     = "Promotions management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetCurrentPromoProducts";
    NewLine.SearchMethod = "GETCURRENTPROMOPRODUCTS";
    NewLine.Parameter    = "--offset";
    NewLine.Description    = "Offst of items list (optional, def. val. - Empty value)";
    NewLine.Region     = "Promotions management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetWarehousesList";
    NewLine.SearchMethod = "GETWAREHOUSESLIST";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Warehouses management";
    NewLine.MethodDescription   = "Gets compnay warehouses list";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetWarehousesList";
    NewLine.SearchMethod = "GETWAREHOUSESLIST";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Warehouses management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetClustersList";
    NewLine.SearchMethod = "GETCLUSTERSLIST";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Fbo scheme";
    NewLine.MethodDescription   = "Gets information about clusters and warehouses";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetClustersList";
    NewLine.SearchMethod = "GETCLUSTERSLIST";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetClustersList";
    NewLine.SearchMethod = "GETCLUSTERSLIST";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Cluster type: CLUSTER_TYPE_OZON (Russia), CLUSTER_TYPE_CIS (CIS) (optional, def. val. - CLUSTER_TYPE_OZON)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetShippingWarehousesList";
    NewLine.SearchMethod = "GETSHIPPINGWAREHOUSESLIST";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Fbo scheme";
    NewLine.MethodDescription   = "Gets a list of warehouses, sorting centers and delivery points";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetShippingWarehousesList";
    NewLine.SearchMethod = "GETSHIPPINGWAREHOUSESLIST";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetShippingWarehousesList";
    NewLine.SearchMethod = "GETSHIPPINGWAREHOUSESLIST";
    NewLine.Parameter    = "--search";
    NewLine.Description    = "Search by name (4 chars. min). For delivery points enter the full name";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetShippingWarehousesList";
    NewLine.SearchMethod = "GETSHIPPINGWAREHOUSESLIST";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Supply types: CREATE_TYPE_CROSSDOCK, CREATE_TYPE_DIRECT (optional, def. val. - CREATE_TYPE_DIRECT)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOShipmentsList";
    NewLine.SearchMethod = "GETFBOSHIPMENTSLIST";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Fbo scheme";
    NewLine.MethodDescription   = "Gets a list of active shipments with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOShipmentsList";
    NewLine.SearchMethod = "GETFBOSHIPMENTSLIST";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOShipmentsList";
    NewLine.SearchMethod = "GETFBOSHIPMENTSLIST";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Shipments filter. See GetShipmentsFilterStructure (optional, def. val. - Empty value)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOShipmentsList";
    NewLine.SearchMethod = "GETFBOSHIPMENTSLIST";
    NewLine.Parameter    = "--with";
    NewLine.Description    = "Include additional fields in the response. See GetShipmentAdditionalFields (optional, def. val. - Empty value)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOShipmentsList";
    NewLine.SearchMethod = "GETFBOSHIPMENTSLIST";
    NewLine.Parameter    = "--offset";
    NewLine.Description    = "Offset of the result items (optional, def. val. - Empty value)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOShipmentsList";
    NewLine.SearchMethod = "GETFBOSHIPMENTSLIST";
    NewLine.Parameter    = "--trlt";
    NewLine.Description    = "If Cyrillic to Latin address transliteration is enabled > True (optional, def. val. - False)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateFBODraft";
    NewLine.SearchMethod = "CREATEFBODRAFT";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Fbo scheme";
    NewLine.MethodDescription   = "Creates a draft of FBO supply order";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateFBODraft";
    NewLine.SearchMethod = "CREATEFBODRAFT";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateFBODraft";
    NewLine.SearchMethod = "CREATEFBODRAFT";
    NewLine.Parameter    = "--clusters";
    NewLine.Description    = "Clusters identifiers";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateFBODraft";
    NewLine.SearchMethod = "CREATEFBODRAFT";
    NewLine.Parameter    = "--items";
    NewLine.Description    = "Items list: Key > SKU, Value > Amount";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateFBODraft";
    NewLine.SearchMethod = "CREATEFBODRAFT";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Supply type: CREATE_TYPE_CROSSDOCK, CREATE_TYPE_DIRECT (optional, def. val. - CREATE_TYPE_DIRECT)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "CreateFBODraft";
    NewLine.SearchMethod = "CREATEFBODRAFT";
    NewLine.Parameter    = "--point";
    NewLine.Description    = "Shipping point identifier for CREATE_TYPE_CROSSDOCK (optional, def. val. - Empty value)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBODraft";
    NewLine.SearchMethod = "GETFBODRAFT";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Fbo scheme";
    NewLine.MethodDescription   = "Gets FBO draft by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBODraft";
    NewLine.SearchMethod = "GETFBODRAFT";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBODraft";
    NewLine.SearchMethod = "GETFBODRAFT";
    NewLine.Parameter    = "--oper";
    NewLine.Description    = "Draft (operation) ID)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOTimeslots";
    NewLine.SearchMethod = "GETFBOTIMESLOTS";
    NewLine.Parameter    = "--clientid";
    NewLine.Description    = "Client identifier";
    NewLine.Region     = "Fbo scheme";
    NewLine.MethodDescription   = "Get available timeslots at the final supply warehouses";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOTimeslots";
    NewLine.SearchMethod = "GETFBOTIMESLOTS";
    NewLine.Parameter    = "--apikey";
    NewLine.Description    = "API key";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOTimeslots";
    NewLine.SearchMethod = "GETFBOTIMESLOTS";
    NewLine.Parameter    = "--from";
    NewLine.Description    = "Start date of the required period of available timeslots";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOTimeslots";
    NewLine.SearchMethod = "GETFBOTIMESLOTS";
    NewLine.Parameter    = "--to";
    NewLine.Description    = "The end date of the desired period of available timeslots (28 days from current max.)";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOTimeslots";
    NewLine.SearchMethod = "GETFBOTIMESLOTS";
    NewLine.Parameter    = "--draft";
    NewLine.Description    = "Supply draft identifier";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetFBOTimeslots";
    NewLine.SearchMethod = "GETFBOTIMESLOTS";
    NewLine.Parameter    = "--whs";
    NewLine.Description    = "Warehouse or multiple warehouses to receive timeslots";
    NewLine.Region     = "Fbo scheme";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetShipmentAdditionalFields";
    NewLine.SearchMethod = "GETSHIPMENTADDITIONALFIELDS";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Fbo scheme";
    NewLine.MethodDescription   = "Returns the structure of inclusion of additional response fields for the GetFBOShipmentsList method";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ozon";
    NewLine.Module      = "OPI_Ozon";
    NewLine.Method       = "GetShipmentsFilterStructure";
    NewLine.SearchMethod = "GETSHIPMENTSFILTERSTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Fbo scheme";
    NewLine.MethodDescription   = "Returns the filter structure for the GetFBOShipmentsList method";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "OPI_Ozon = LoadScript(""%1/oint/core/Modules/OPI_Ozon.os"")"  + Chars.LF;


EndFunction 
