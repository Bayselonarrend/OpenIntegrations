use addin1c::{Variant};
use crate::component::AddIn;
use mongodb::{Client, Collection, options::ClientOptions, bson::{doc, Bson, Document}};
use std::error::Error;

pub fn amount(obj: &AddIn, params: &mut [Variant]) -> i32 {

    let result = params[0].get_i32().unwrap() + params[1].get_i32().unwrap();
    params[0].set_i32(999);

    result

}

pub struct MongoClient {
    client: Client,
}

impl MongoClient {
    // Конструктор для создания клиента
    pub fn new(uri: &str) -> MongoClient {

        match ClientOptions::parse(uri) {
            Ok(client_options) => match Client::with_options(client_options) {
                Ok(client) => MongoClient { client },
                Err(_) => MongoClient { client: Client::with_options(ClientOptions::default()).unwrap() }, // Возвращаем дефолтный клиент в случае ошибки
            },
            Err(_) => MongoClient { client: Client::with_options(ClientOptions::default()).unwrap() }, // Возвращаем дефолтный клиент в случае ошибки
        }
    }

    // Синхронный метод для вставки данных, возвращающий строку или ошибку
    pub fn insert_data(&self, db_name: &str, collection_name: &str, data: &str) -> String {

        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);
        let doc = doc! { "name": data };

        match collection.insert_one(doc, None) {
            Ok(_) => "Insert successful".to_string(),
            Err(err) => format!("Insert failed: {}", err),
        }
    }

    // Синхронный метод для поиска данных, возвращающий строку или ошибку
    pub fn find_data(&self, db_name: &str, collection_name: &str, query: &str) -> String {

        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);
        let filter = doc! { "name": query };

        match collection.find_one(filter, None) {
            Ok(Some(doc)) => match doc.get_str("name") {
                Ok(name) => name.to_string(),
                Err(_) => "Error reading name from document".to_string(),
            },
            Ok(None) => "Document not found".to_string(),
            Err(err) => format!("Find failed: {}", err),
        }
    }

    // Синхронный метод для подсчета документов, возвращающий количество или ошибку
    pub fn count_documents(&self, db_name: &str, collection_name: &str) -> i32 {

        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        match collection.count_documents(None, None) {
            Ok(count) => count as i32,
            Err(_) => -1, // Возвращаем -1 в случае ошибки
        }
    }

    // Синхронный метод для проверки наличия документа, возвращающий булевый результат
    pub fn document_exists(&self, db_name: &str, collection_name: &str, query: &str) -> bool {

        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);
        let filter = doc! { "name": query };

        match collection.find_one(filter, None) {
            Ok(Some(_)) => true,
            Ok(None) => false,
            Err(_) => false, // Возвращаем false в случае ошибки
        }
    }
}
