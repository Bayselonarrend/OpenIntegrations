use mongodb::{options::ClientOptions, bson::{doc, Document}};
use mongodb::sync::{Client, Collection};
use serde_json::Value;

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

        // Преобразуем строку JSON в объект
        let json_value: Value = match serde_json::from_str(data) {
            Ok(value) => value,
            Err(err) => return format!("Failed to parse JSON: {}", err),
        };

        // Преобразуем объект JSON в BSON
        let bson_document = match bson::to_bson(&json_value) {
            Ok(bson) => bson,
            Err(err) => return format!("Failed to convert to BSON: {}", err),
        };

        // Вставляем BSON документ в коллекцию
        match collection.insert_one(bson_document.as_document().unwrap(), None) {
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

    // Синхронный метод для проверки наличия документа, возвращающий булево результат
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
