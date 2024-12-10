mod methods;

use addin1c::{name, Variant};
use crate::core::getset;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("ListDatabases"),       // 0
    name!("DatabaseStats"),       // 1
    name!("DropDatabase"),        // 2
    name!("DatabaseExists"),      // 3
    name!("ListCollections"),     // 4
    name!("CreateCollection"),    // 5
    name!("DropCollection"),      // 6
    name!("CollectionExists"),    // 7
    name!("InsertData"),          // 8
    name!("InsertMany"),          // 9
    name!("UpdateData"),          // 10
    name!("UpdateMany"),          // 11
    name!("DeleteData"),          // 12
    name!("DeleteMany"),          // 13
    name!("FindData"),            // 14
    name!("FindMany"),            // 15
    name!("FindAll"),             // 16
    name!("DocumentExists"),      // 17
    name!("CountDocuments"),      // 18
    name!("RunCustomQuery"),      // 19
    name!("Aggregate"),           // 20
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,   // list_databases (нет параметров)
        1 => 1,   // database_stats
        2 => 1,   // drop_database
        3 => 1,   // database_exists
        4 => 1,   // list_collections
        5 => 2,   // create_collection
        6 => 2,   // drop_collection
        7 => 2,   // collection_exists
        8 => 3,   // insert_data
        9 => 3,   // insert_many
        10 => 4,  // update_data
        11 => 4,  // update_many
        12 => 3,  // delete_data
        13 => 3,  // delete_many
        14 => 3,  // find_data
        15 => 5,  // find_many
        16 => 5,  // find_all
        17 => 3,  // document_exists
        18 => 2,  // count_documents
        19 => 2,  // run_custom_query
        20 => 3,  // aggregate
        _ => 0,   // по умолчанию 0
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &AddIn, num: usize, params: &mut [Variant]) -> Box<dyn crate::core::getset::ValueType> {

    let address = &obj.address;
    let client = methods::MongoClient::new(address);

    match num {
        0 => {  // list_databases
            Box::new(client.list_databases())
        },
        1 => {  // database_stats
            let db_name = params[0].get_string().unwrap_or(String::new());
            Box::new(client.database_stats(&db_name))
        },
        2 => {  // drop_database
            let db_name = params[0].get_string().unwrap_or(String::new());
            Box::new(client.drop_database(&db_name))
        },
        3 => {  // database_exists
            let db_name = params[0].get_string().unwrap_or(String::new());
            Box::new(client.database_exists(&db_name))
        },
        4 => {  // list_collections
            let db_name = params[0].get_string().unwrap_or(String::new());
            Box::new(client.list_collections(&db_name))
        },
        5 => {  // create_collection
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            Box::new(client.create_collection(&db_name, &collection_name))
        },
        6 => {  // drop_collection
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            Box::new(client.drop_collection(&db_name, &collection_name))
        },
        7 => {  // collection_exists
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            Box::new(client.collection_exists(&db_name, &collection_name))
        },
        8 => {  // insert_data
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let data = params[2].get_string().unwrap_or(String::new());
            Box::new(client.insert_data(&db_name, &collection_name, &data))
        },
        9 => {  // insert_many
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let data = params[2].get_string().unwrap_or(String::new());
            Box::new(client.insert_many(&db_name, &collection_name, &data))
        },
        10 => {  // update_data
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());
            let update = params[3].get_string().unwrap_or(String::new());
            Box::new(client.update_data(&db_name, &collection_name, &query, &update))
        },
        11 => {  // update_many
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());
            let update = params[3].get_string().unwrap_or(String::new());
            Box::new(client.update_many(&db_name, &collection_name, &query, &update))
        },
        12 => {  // delete_data
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());
            Box::new(client.delete_data(&db_name, &collection_name, &query))
        },
        13 => {  // delete_many
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());
            Box::new(client.delete_many(&db_name, &collection_name, &query))
        },
        14 => {  // find_data
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());
            Box::new(client.find_data(&db_name, &collection_name, &query))
        },
        15 => {  // find_many
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());
            let page = params[3].get_i32().unwrap_or(0);
            let page_size = params[4].get_i32().unwrap_or(0) as i32;
            Box::new(client.find_many(&db_name, &collection_name, &query, page, page_size))
        },
        16 => {  // find_all
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());
            let page = params[3].get_i32().unwrap_or(0);
            let page_size = params[4].get_i32().unwrap_or(0);
            Box::new(client.find_all(&db_name, &collection_name, &query, page, page_size))
        },
        17 => {  // document_exists
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());
            Box::new(client.document_exists(&db_name, &collection_name, &query))
        },
        18 => {  // count_documents
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            Box::new(client.count_documents(&db_name, &collection_name))
        },
        19 => {  // run_custom_query
            let db_name = params[0].get_string().unwrap_or(String::new());
            let query = params[1].get_string().unwrap_or(String::new());
            Box::new(client.run_custom_query(&db_name, &query))
        },
        20 => {  // aggregate
            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name = params[1].get_string().unwrap_or(String::new());
            let pipeline = params[2].get_string().unwrap_or(String::new());
            Box::new(client.aggregate(&db_name, &collection_name, &pipeline))
        },
        _ => {
            Box::new(false)
        }
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("ConnectionString")
];

// Имена и типы
pub struct AddIn {
    address: String
}

// Конструктор
impl AddIn {

    // Значения по умолчанию
    pub fn new() -> AddIn {
        AddIn {
            address: String::from("")
        }
    }

    // Сюда просто нужно еще раз добавить имена полей
    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.address as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

// -------------------------------------------------------------------------------------------------