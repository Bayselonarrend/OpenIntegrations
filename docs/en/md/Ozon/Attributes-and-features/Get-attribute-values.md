---
sidebar_position: 3
---

# Get attribute values
 Gets the list of available values of the attribute



`Function GetAttributeValues(Val ClientID, Val APIKey, Val CategoryID, Val TypeID, Val AttributeID, Val CatalogID = 1, Val Lang = "DEFAULT") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | CategoryID | --categoryid | String, Number | Category identifier |
  | TypeID | --typeid | String, Number | Item type identifier |
  | AttributeID | --attributeid | String, Number | Attribute IDs for obtaining values |
  | CatalogID | --start | String, Number | ID of the first catalog in the response |
  | Lang | --lang | String | Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
You can find out if there is a nested catalog by the GetCharacteristicsCategories method()

 Method at API documentation: [post /v1/description-category/attribute/values](https://docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetAttributeValues)
:::
<br/>


```bsl title="Code example"
    ClientID    = "2128753";
    APIKey      = "7cc90d26-33e4-499b...";
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;

    Result = OPI_Ozon.GetAttributeValues(ClientID, APIKey, CategoryID, TypeID, AttributeID);
```



```sh title="CLI command example"
    
  oint ozon GetAttributeValues --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --categoryid %categoryid% --typeid %typeid% --attributeid %attributeid% --start %start% --lang %lang%

```

```json title="Result"
{
 "result": [
  {
   "id": 5056737,
   "value": "Essence",
   "info": "Красота и здоровье",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-v/6088253599.jpg"
  },
  {
   "id": 5057962,
   "value": "Hot",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1/6011312389.jpg"
  },
  {
   "id": 5058518,
   "value": "CS",
   "info": "",
   "picture": ""
  },
  {
   "id": 5059837,
   "value": "Каскад",
   "info": "Зоотовары",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6027361156.jpg"
  },
  {
   "id": 5062537,
   "value": "Enigma",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-5/6427347617.jpg"
  },
  {
   "id": 5062790,
   "value": "Kitfort",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-6/6737348550.jpg"
  },
  {
   "id": 5064843,
   "value": "Parlux",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-w/6011101280.jpg"
  },
  {
   "id": 5065236,
   "value": "Сателлит",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6010470136.jpg"
  },
  {
   "id": 5066816,
   "value": "Carioca",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-8/6063013796.jpg"
  },
  {
   "id": 5068632,
   "value": "Bawi",
   "info": "",
   "picture": ""
  },
  {
   "id": 5069237,
   "value": "Kodak",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-m/6011062066.jpg"
  },
  {
   "id": 5069442,
   "value": "Mattel",
   "info": "Детские игрушки",
   "picture": "https://cdn1.ozone.ru/multimedia/1013076413.jpg"
  },
  {
   "id": 5071003,
   "value": "Ivo",
   "info": "",
   "picture": ""
  },
  {
   "id": 5071289,
   "value": "HTC",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1011058578.jpg"
  },
  {
   "id": 5073069,
   "value": "Ghost",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073089,
   "value": "Oleg Cassini",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073356,
   "value": "Ritzenhoff & Breker",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073389,
   "value": "William Levene",
   "info": "",
   "picture": ""
  },
  {
   "id": 5074417,
   "value": "KEF",
   "info": "",
   "picture": ""
  },
  {
   "id": 5074684,
   "value": "Cutipol",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-o/6011755428.jpg"
  },
  {
   "id": 5075889,
   "value": "Jacob Zeidler & Co",
   "info": "",
   "picture": ""
  },
  {
   "id": 5076255,
   "value": "The Original Book Works Limited",
   "info": "",
   "picture": ""
  },
  {
   "id": 5076787,
   "value": "Ocean Extreme",
   "info": "",
   "picture": ""
  },
  {
   "id": 5077287,
   "value": "Народное искусство",
   "info": "",
   "picture": ""
  },
  {
   "id": 5077379,
   "value": "Zyliss",
   "info": "",
   "picture": ""
  },
  {
   "id": 5078091,
   "value": "VITEK",
   "info": "Бытовая техника, Электроника",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-5/6739890509.jpg"
  },
  {
   "id": 5078102,
   "value": "Федоскино",
   "info": "",
   "picture": ""
  },
  {
   "id": 5078283,
   "value": "Purederm",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005901478.jpg"
  },
  {
   "id": 5078351,
   "value": "Euro Album",
   "info": "",
   "picture": ""
  },
  {
   "id": 5078936,
   "value": "Ted Lapidus",
   "info": "",
   "picture": ""
  },
  {
   "id": 5079064,
   "value": "Planter's",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1008113496.jpg"
  },
  {
   "id": 5079161,
   "value": "Raphael Tuck & Sons \"Oilette\"",
   "info": "",
   "picture": ""
  },
  {
   "id": 5079257,
   "value": "Rouge Bunny Rouge",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013007437.jpg"
  },
  {
   "id": 5079313,
   "value": "Clinique",
   "info": "Косметика",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-k/6768890864.jpg"
  },
  {
   "id": 5079395,
   "value": "Dormann",
   "info": "",
   "picture": ""
  },
  {
   "id": 5079789,
   "value": "Alessandro Dell'Acqua",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-l/6927331617.jpg"
  },
  {
   "id": 5079886,
   "value": "Объект мечты",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6011767756.jpg"
  },
  {
   "id": 5079944,
   "value": "Blaupunkt",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-m/6165768610.jpg"
  },
  {
   "id": 5080060,
   "value": "Skin Benefits",
   "info": "",
   "picture": ""
  },
  {
   "id": 5080275,
   "value": "Hivox",
   "info": "",
   "picture": ""
  },
  {
   "id": 5080453,
   "value": "Sheffield",
   "info": "",
   "picture": ""
  },
  {
   "id": 5080743,
   "value": "Маэста",
   "info": "",
   "picture": ""
  },
  {
   "id": 5081104,
   "value": "Moranduzzo",
   "info": "",
   "picture": ""
  },
  {
   "id": 5081589,
   "value": "Fellowes",
   "info": "",
   "picture": ""
  },
  {
   "id": 5082449,
   "value": "Paul Hartmann",
   "info": "Медицинские расходные материалы",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-0/6855057564.jpg"
  },
  {
   "id": 5082500,
   "value": "Красный монетный двор",
   "info": "",
   "picture": ""
  },
  {
   "id": 5082508,
   "value": "Аннинский монетный двор",
   "info": "",
   "picture": ""
  },
  {
   "id": 5082535,
   "value": "Jardin d'Ete",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-n/6045271031.jpg"
  },
  {
   "id": 5082729,
   "value": "Dream Girlfriend",
   "info": "",
   "picture": ""
  },
  {
   "id": 5082840,
   "value": "Waterflow",
   "info": "",
   "picture": ""
  },
  {
   "id": 5083016,
   "value": "Silampos",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1011919993.jpg"
  },
  {
   "id": 5083036,
   "value": "Sifra",
   "info": "",
   "picture": ""
  },
  {
   "id": 5083282,
   "value": "Интурист",
   "info": "",
   "picture": ""
  },
  {
   "id": 5083580,
   "value": "Cowbrand",
   "info": "",
   "picture": ""
  },
  {
   "id": 5084781,
   "value": "Laban",
   "info": "",
   "picture": ""
  },
  {
   "id": 5084822,
   "value": "Diadora",
   "info": "Спортивные одежда и обувь",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-y/6921340474.jpg"
  },
  {
   "id": 5085003,
   "value": "Biolustre",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1007557437.jpg"
  },
  {
   "id": 5085054,
   "value": "Zobele Holding Spa",
   "info": "",
   "picture": ""
  },
  {
   "id": 5085207,
   "value": "Beauty Style",
   "info": "Косметическая продукция",
   "picture": "https://cdn1.ozone.ru/multimedia/1026771017.jpg"
  },
  {
   "id": 5085496,
   "value": "Enzo professional",
   "info": "Техника для красоты и здоровья",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-9/6076877181.jpg"
  },
  {
   "id": 5085630,
   "value": "ЛинкГрупп Трейд",
   "info": "",
   "picture": ""
  },
  {
   "id": 5085660,
   "value": "Teana",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1007558733.jpg"
  },
  {
   "id": 5086561,
   "value": "Charriol",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005918143.jpg"
  },
  {
   "id": 5086948,
   "value": "Green Mama",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-e/6897522962.jpg"
  },
  {
   "id": 5087382,
   "value": "Framar",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6428430532.jpg"
  },
  {
   "id": 5087452,
   "value": "Interno Stile",
   "info": "",
   "picture": ""
  },
  {
   "id": 5087488,
   "value": "Euroline",
   "info": "",
   "picture": ""
  },
  {
   "id": 5087563,
   "value": "Ped Egg",
   "info": "",
   "picture": ""
  },
  {
   "id": 5087584,
   "value": "Moony",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-h/6765631493.jpg"
  },
  {
   "id": 5087587,
   "value": "Le Vele",
   "info": "",
   "picture": ""
  },
  {
   "id": 5087591,
   "value": "GreenPan",
   "info": "",
   "picture": ""
  },
  {
   "id": 5087958,
   "value": "EuroNOVA",
   "info": "",
   "picture": ""
  },
  {
   "id": 5088271,
   "value": "Now Fresh",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1014526996.jpg"
  },
  {
   "id": 5088272,
   "value": "Aster",
   "info": "Бумажно-гигиеническая продукция",
   "picture": "https://cdn1.ozone.ru/multimedia/1013837918.JPG"
  },
  {
   "id": 5088319,
   "value": "Bubchen",
   "info": "Детская косметика",
   "picture": "https://cdn1.ozone.ru/multimedia/1015706065.jpg"
  },
  {
   "id": 5088546,
   "value": "Helan",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1012234383.jpg"
  },
  {
   "id": 5088659,
   "value": "Brabantia",
   "info": "Товары для дома",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-2/6768897398.jpg"
  },
  {
   "id": 5088826,
   "value": "Bohemia",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1010642098.jpg"
  },
  {
   "id": 5088876,
   "value": "Rainbow S.p.A.",
   "info": "",
   "picture": ""
  },
  {
   "id": 5089016,
   "value": "Aisen",
   "info": "",
   "picture": ""
  },
  {
   "id": 5089042,
   "value": "BodyKraft",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013837963.JPG"
  },
  {
   "id": 5089253,
   "value": "ДАРЛИНГ",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-r/6690736707.jpg"
  },
  {
   "id": 5089278,
   "value": "Baby Nova",
   "info": "",
   "picture": ""
  },
  {
   "id": 5089313,
   "value": "Clingo",
   "info": "",
   "picture": ""
  },
  {
   "id": 5089370,
   "value": "X-Bond",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1010654238.jpg"
  },
  {
   "id": 5089461,
   "value": "Welton",
   "info": "",
   "picture": ""
  },
  {
   "id": 5089488,
   "value": "Морская сказка",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1010422036.jpg"
  },
  {
   "id": 5089521,
   "value": "C-thru",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005980501.JPG"
  },
  {
   "id": 5089562,
   "value": "Str8",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013970960.jpg"
  },
  {
   "id": 5089612,
   "value": "Till",
   "info": "",
   "picture": ""
  },
  {
   "id": 5089809,
   "value": "Pittards",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090109,
   "value": "Ziver",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-x/6013443549.jpg"
  },
  {
   "id": 5090180,
   "value": "Scarlett",
   "info": "Бытовая техника",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-g/6743744104.jpg"
  },
  {
   "id": 5090219,
   "value": "Diax",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090528,
   "value": "Emily Style",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-m/6011820334.jpg"
  },
  {
   "id": 5090669,
   "value": "BLOCH",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090698,
   "value": "Elmonte",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090706,
   "value": "Quiksilver",
   "info": "Одежда",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-i/6926015346.jpg"
  },
  {
   "id": 5090713,
   "value": "Wapiti",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090749,
   "value": "COXX Borba",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090799,
   "value": "Dicarra",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090824,
   "value": "Eliza di Venezia",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090837,
   "value": "Liu Jo",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1037445528.jpg"
  },
  {
   "id": 5090865,
   "value": "Paul & Betty",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090891,
   "value": "Kalliste",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-q/6925867826.jpg"
  },
  {
   "id": 5090898,
   "value": "Milano",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-j/6927225559.jpg"
  },
  {
   "id": 5090935,
   "value": "Popushier",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090956,
   "value": "Rieker",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-j/6922860415.jpg"
  },
  {
   "id": 5090960,
   "value": "K&S",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090965,
   "value": "Alex Mazurin",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090972,
   "value": "Shepherd's Life",
   "info": "",
   "picture": ""
  },
  {
   "id": 5090982,
   "value": "S. Velani",
   "info": "",
   "picture": ""
  },
  {
   "id": 5091004,
   "value": "Lacal",
   "info": "",
   "picture": ""
  },
  {
   "id": 5091014,
   "value": "Paul Green",
   "info": "",
   "picture": ""
  },
  {
   "id": 5091018,
   "value": "Cosy Image",
   "info": "",
   "picture": ""
  },
  {
   "id": 5091019,
   "value": "Jana A+W",
   "info": "",
   "picture": ""
  },
  {
   "id": 5091319,
   "value": "Laboratories Biocos",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1007617561.jpg"
  },
  {
   "id": 5091516,
   "value": "Louis Feraud",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005918136.jpg"
  },
  {
   "id": 5091721,
   "value": "AVE",
   "info": "Бытовая химия",
   "picture": "https://cdn1.ozone.ru/multimedia/1032234311.jpg"
  },
  {
   "id": 5091937,
   "value": "Черный жемчуг",
   "info": "Косметика для кожи и волос",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-t/6764002001.jpg"
  },
  {
   "id": 5092013,
   "value": "Phyto Expert",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092086,
   "value": "Ko san yo",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092320,
   "value": "Neo Way",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005529440.jpg"
  },
  {
   "id": 5092392,
   "value": "Vuokkoset",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013971103.jpg"
  },
  {
   "id": 5092405,
   "value": "Martini SPA",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005908866.jpg"
  },
  {
   "id": 5092425,
   "value": "Evinal",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1008114191.jpg"
  },
  {
   "id": 5092456,
   "value": "Subastus",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-h/6028496609.jpg"
  },
  {
   "id": 5092461,
   "value": "Autrepart",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092462,
   "value": "Lavatelli",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092502,
   "value": "Kunming Yongbin",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092504,
   "value": "Polaris",
   "info": "Бытовая техника, посуда",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-8/6737538668.jpg"
  },
  {
   "id": 5092515,
   "value": "Detalle",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092560,
   "value": "Herbal Essences",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1007620987.jpg"
  },
  {
   "id": 5092561,
   "value": "Fruttini",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1007558555.jpg"
  },
  {
   "id": 5092572,
   "value": "Domex",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092580,
   "value": "Aquolina",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013810526.jpg"
  },
  {
   "id": 5092584,
   "value": "Mediterranean SPA",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005908803.jpg"
  },
  {
   "id": 5092599,
   "value": "Experimenta Firenze",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092705,
   "value": "Bobino",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092718,
   "value": "Leif Lowe",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092769,
   "value": "Теско",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013046624.jpg"
  },
  {
   "id": 5092815,
   "value": "Zibo Nolan Arts & Crafts Co., Ltd",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092846,
   "value": "Relax Master",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013976452.jpg"
  },
  {
   "id": 5092872,
   "value": "Cell-Plus",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005890980.jpg"
  },
  {
   "id": 5092898,
   "value": "Skin Doctors",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1007618167.jpg"
  },
  {
   "id": 5092915,
   "value": "Road Sign",
   "info": "",
   "picture": ""
  },
  {
   "id": 5092998,
   "value": "Tinta",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093006,
   "value": "Good Garment",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093043,
   "value": "Medisana",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1007557418.jpg"
  },
  {
   "id": 5093053,
   "value": "Silex",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093054,
   "value": "Biomed",
   "info": "Средства для ухода за полостью рта",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-o/6015477504.jpg"
  },
  {
   "id": 5093092,
   "value": "Mariella Rossi",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093099,
   "value": "Clearasil",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1010339829.jpg"
  },
  {
   "id": 5093105,
   "value": "Biehl",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1008113685.jpg"
  },
  {
   "id": 5093111,
   "value": "Essential Color",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093129,
   "value": "Tebe",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093143,
   "value": "Brilard",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1005633547.jpg"
  },
  {
   "id": 5093150,
   "value": "Hair Pro",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093161,
   "value": "Доктор Беляков",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013373653.jpg"
  },
  {
   "id": 5093166,
   "value": "Alan Bray",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-r/6788763699.jpg"
  },
  {
   "id": 5093170,
   "value": "Brillance",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013975423.jpg"
  },
  {
   "id": 5093179,
   "value": "Dacron Comforel",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093198,
   "value": "Gallaz",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1003254842.jpg"
  },
  {
   "id": 5093231,
   "value": "Sea Breeze",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093247,
   "value": "Ommassage",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1007558818.jpg"
  },
  {
   "id": 5093262,
   "value": "Parodontax",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013084939.jpg"
  },
  {
   "id": 5093266,
   "value": "Silium",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013969341.jpg"
  },
  {
   "id": 5093287,
   "value": "Wessen",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093298,
   "value": "Банные штучки",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1021793218.jpg"
  },
  {
   "id": 5093337,
   "value": "Divage Internation",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093377,
   "value": "Gwen Stefani",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093394,
   "value": "Ice",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093398,
   "value": "BALMAIN",
   "info": "Одежда, аксессуары, косметика",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-q/6022293494.jpg"
  },
  {
   "id": 5093412,
   "value": "AlcoSafe",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093420,
   "value": "Love-Love",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1013905863.jpg"
  },
  {
   "id": 5093437,
   "value": "Men",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093440,
   "value": "Mineral Care SPA",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093469,
   "value": "Kylie Minogue",
   "info": "Красота и здоровье",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-6/6019010310.jpg"
  },
  {
   "id": 5093479,
   "value": "Pink Sugar",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093587,
   "value": "Resche",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093593,
   "value": "Rodier",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093612,
   "value": "Sexy Lace",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093632,
   "value": "Syumitect",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093643,
   "value": "Techno",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-8/6497531888.jpg"
  },
  {
   "id": 5093647,
   "value": "Terre&Mer by Thalgo",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093660,
   "value": "TRUEFITT&HILL",
   "info": "Красота и здоровье",
   "picture": "https://cdn1.ozone.ru/multimedia/1013252330.jpg"
  },
  {
   "id": 5093685,
   "value": "Zact",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093693,
   "value": "Alkmene",
   "info": "Средства для ухода за полостью рта",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-f/6010907259.jpg"
  },
  {
   "id": 5093704,
   "value": "Compeed",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1011919455.jpg"
  },
  {
   "id": 5093796,
   "value": "Фа",
   "info": "Средства для тела",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-6/7014685566.jpg"
  },
  {
   "id": 5093855,
   "value": "Perfect Cooking",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093913,
   "value": "Mekar Agung",
   "info": "",
   "picture": ""
  },
  {
   "id": 5093986,
   "value": "Тонтту Тутто / Tonttu Tytto",
   "info": "",
   "picture": ""
  },
  {
   "id": 5094076,
   "value": "Blessing",
   "info": "",
   "picture": ""
  },
  {
   "id": 5094220,
   "value": "Salon Professional",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1010642112.jpg"
  },
  {
   "id": 5094241,
   "value": "Ладомир",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-9/6005040513.jpg"
  },
  {
   "id": 5094272,
   "value": "Solid",
   "info": "Одежда",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-j/6922560535.jpg"
  },
  {
   "id": 5094370,
   "value": "Al Raffination",
   "info": "",
   "picture": ""
  },
  {
   "id": 5094392,
   "value": "Nisshinbo",
   "info": "",
   "picture": ""
  },
  {
   "id": 5094438,
   "value": "Lanza",
   "info": "health and beauty",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-9/6021289257.jpg"
  }
 ],
 "has_next": true
}
```
