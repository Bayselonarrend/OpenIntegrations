use mongodb::{options::{ClientOptions, FindOptions}, bson::{doc, Document}};
use mongodb::sync::{Client, Collection, Database};
use serde_json::{json, Value};

pub struct MongoClient {
    client: Client,
}

impl MongoClient {

    // СЛУЖЕБНЫЕ МЕТОДЫ ----------------------------------------------------------------------------

    // Конструктор для создания клиента
    pub fn new(uri: &str) -> MongoClient {
        match ClientOptions::parse(uri) {
            Ok(client_options) => match Client::with_options(client_options) {
                Ok(client) => MongoClient { client },
                Err(_) => MongoClient { client: Client::with_options(ClientOptions::default()).unwrap() },
            },
            Err(_) => MongoClient { client: Client::with_options(ClientOptions::default()).unwrap() },
        }
    }

    // Вспомогательная функция для формирования JSON ответа
    fn make_response(ok: bool, data: &str) -> String {
        json!({
            "ok": ok,
            "data": data
        })
            .to_string()
    }

    // ОСНОВНЫЕ МЕТОДЫ -----------------------------------------------------------------------------

    // РАБОТА С БАЗАМИ ДАННЫХ ----------------------------------------------------------------------

    // Получение списка баз
    pub fn list_databases(&self) -> String {
        match self.client.list_database_names(None, None) {
            Ok(databases) =>
                Self::make_response(
                    true,
                    &format!("{:?}", databases)),

            Err(err) =>
                Self::make_response(
                    false,
                    &format!("Failed to list databases: {}", err)),
        }
    }

    // Получение статистики базы данных
    pub fn database_stats(&self, db_name: &str) -> String {
        let db = self.client.database(db_name);
        match db.run_command(doc! { "dbStats": 1 }, None) {
            Ok(stats) =>
                Self::make_response(
                    true,
                    &format!("{:?}", stats)),

            Err(err) =>
                Self::make_response(
                    false,
                    &format!("Failed to get database stats for '{}': {}", db_name, err)),
        }
    }

    // Удаление базы
    pub fn drop_database(&self, db_name: &str) -> String {
        match self.client.database(db_name).drop(None) {
            Ok(_) =>
                Self::make_response(
                    true,
                    &format!("Database '{}' dropped successfully", db_name)),
            Err(err) =>
                Self::make_response(
                    false,
                    &format!("Failed to drop database '{}': {}", db_name, err)),
        }
    }

    // Проверка существования базы
    pub fn database_exists(&self, db_name: &str) -> bool {
        // Получаем список всех баз данных
        let db_list = match self.client.list_databases(None, None) {
            Ok(databases) => databases,
            Err(_) => return false,  // Если ошибка при получении списка баз, возвращаем false
        };

        // Проверяем, есть ли указанная база данных в списке
        db_list.iter().any(|db| db.name == db_name)
    }

    // РАБОТА С КОЛЛЕКЦИЯМИ ------------------------------------------------------------------------

    // Получение списка коллекций
    pub fn list_collections(&self, db_name: &str) -> String {
        let db: Database = self.client.database(db_name);

        match db.list_collection_names(None) {
            Ok(collection_names) => {
                // Преобразуем список коллекций в JSON
                let collections_json = serde_json::to_string(&collection_names).unwrap();
                Self::make_response(true, &collections_json)
            }
            Err(err) => Self::make_response(false, &format!("Failed to list collections: {}", err)),
        }
    }

    // Создание коллекции в базе данных
    pub fn create_collection(&self, db_name: &str, collection_name: &str) -> String {
        let db = self.client.database(db_name);
        match db.create_collection(collection_name, None) {
            Ok(_) => Self::make_response(
                true,
                &format!("Collection '{}' created successfully in database '{}'", collection_name, db_name)),

            Err(err) =>
                Self::make_response(
                    false,
                    &format!("Failed to create collection '{}': {}", collection_name, err)),
        }
    }

    // Удаление коллекции из базы данных
    pub fn drop_collection(&self, db_name: &str, collection_name: &str) -> String {
        let collection = self.client.database(db_name).collection::<Document>(collection_name);
        match collection.drop(None) {
            Ok(_) =>
                Self::make_response(
                    true,
                    &format!("Collection '{}' dropped successfully from database '{}'", collection_name, db_name)),

            Err(err) =>
                Self::make_response(
                    false,
                    &format!("Failed to drop collection '{}': {}", collection_name, err)),
        }
    }

    // Проверка, существует ли коллекция
    pub fn collection_exists(&self, db_name: &str, collection_name: &str) -> String {
        match self.client.database(db_name).list_collection_names(None) {
            Ok(collections) => {
                if collections.contains(&collection_name.to_string()) {
                    Self::make_response(
                        true,
                        &format!("Collection '{}' exists in database '{}'", collection_name, db_name))
                } else {
                    Self::make_response(
                        false,
                        &format!("Collection '{}' does not exist in database '{}'", collection_name, db_name))
                }
            }
            Err(err) =>
                Self::make_response(
                    false,
                    &format!("Failed to list collections: {}", err)),
        }
    }

    // РАБОТА С ДОКУМЕНТАМИ ------------------------------------------------------------------------

    // ДОБАВЛЕНИЕ ДОКУМЕНТОВ -----------------------------------------------------------------------

    // Метод для вставки одного документа
    pub fn insert_data(&self, db_name: &str, collection_name: &str, data: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        let json_value: Value = match serde_json::from_str(data) {
            Ok(value) => value,
            Err(err) =>
                return Self::make_response(
                    false,
                    &format!("Failed to parse JSON: {}", err)),
        };

        let bson_document = match bson::to_bson(&json_value) {
            Ok(bson) => bson,
            Err(err) =>
                return Self::make_response(
                    false,
                    &format!("Failed to convert to BSON: {}", err)),
        };

        match collection.insert_one(bson_document.as_document().unwrap(), None) {
            Ok(_) =>
                Self::make_response(
                    true,
                    "Insert successful"),
            Err(err) =>
                Self::make_response(
                    false,
                    &format!("Insert failed: {}", err)),
        }
    }

    // Метод для вставки нескольких документов
    pub fn insert_many(&self, db_name: &str, collection_name: &str, data: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        let json_values: Vec<Value> = match serde_json::from_str(data) {
            Ok(values) => values,
            Err(err) =>
                return Self::make_response(
                    false,
                    &format!("Failed to parse JSON array: {}", err)),
        };

        let bson_documents: Vec<Document> = match json_values
            .into_iter()
            .map(|value| bson::to_bson(&value))
            .collect::<Result<Vec<_>, _>>()
        {
            Ok(bson_array) => bson_array
                .into_iter()
                .filter_map(|bson| bson.as_document().cloned())
                .collect(),
            Err(err) =>
                return Self::make_response(
                    false,
                    &format!("Failed to convert JSON to BSON: {}", err)),
        };

        match collection.insert_many(bson_documents, None) {
            Ok(result) =>
                Self::make_response(
                    true,
                    &format!("Insert successful: {} documents inserted", result.inserted_ids.len())),
            Err(err) =>
                Self::make_response(
                    false,
                    &format!("Insert failed: {}", err)),
        }
    }

    // ОБНОВЛЕНИЕ ДОКУМЕНТОВ -----------------------------------------------------------------------

    // Обновление одного документа в коллекции
    pub fn update_data(&self, db_name: &str, collection_name: &str, query: &str, update: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        // Парсим JSON в структуру Value
        let bson_query: Value = match serde_json::from_str(query) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse query JSON: {}", err)),
        };

        let bson_update: Value = match serde_json::from_str(update) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse update JSON: {}", err)),
        };

        // Преобразуем в BSON документы
        let bson_query_doc = bson::to_document(&bson_query).unwrap();
        let bson_update_doc = bson::to_document(&bson_update).unwrap();

        // Преобразуем в UpdateModifications
        let update_modifications = doc! {
        "$set": bson_update_doc
    };

        // Обновляем один документ
        match collection.update_one(bson_query_doc, update_modifications, None) {
            Ok(_) => Self::make_response(true, "Update successful"),
            Err(err) => Self::make_response(false, &format!("Update failed: {}", err)),
        }
    }

    // Обновление нескольких документов
    pub fn update_many(&self, db_name: &str, collection_name: &str, query: &str, update: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        // Парсим JSON в структуру Value
        let bson_query: Value = match serde_json::from_str(query) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse query JSON: {}", err)),
        };

        let bson_update: Value = match serde_json::from_str(update) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse update JSON: {}", err)),
        };

        // Преобразуем в BSON документы
        let bson_query_doc = bson::to_document(&bson_query).unwrap();
        let bson_update_doc = bson::to_document(&bson_update).unwrap();

        // Преобразуем в UpdateModifications
        let update_modifications = doc! {"$set": bson_update_doc};

        // Обновляем все документы, которые соответствуют запросу
        match collection.update_many(bson_query_doc, update_modifications, None) {
            Ok(result) => Self::make_response(
                true,
                &format!("Update successful: {} documents updated", result.modified_count)
            ),
            Err(err) => Self::make_response(false, &format!("Update failed: {}", err)),
        }
    }


    // УДАЛЕНИЕ ДОКУМЕНТОВ -------------------------------------------------------------------------

    // Удаление одного документа
    pub fn delete_data(&self, db_name: &str, collection_name: &str, query: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        // Преобразуем строку JSON в объект
        let query_value: Value = match serde_json::from_str(query) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse query JSON: {}", err)),
        };

        // Преобразуем объект JSON в BSON
        let bson_query = match bson::to_bson(&query_value) {
            Ok(bson) => bson,
            Err(err) => return Self::make_response(false, &format!("Failed to convert query to BSON: {}", err)),
        };

        // Проверяем, что BSON является документом
        match bson_query.as_document() {
            Some(bson_query_doc) => {
                // Удаляем один документ
                match collection.delete_one(bson_query_doc.clone(), None) {
                    Ok(result) => {
                        if result.deleted_count > 0 {
                            Self::make_response(true, "Delete successful")
                        } else {
                            Self::make_response(false, "No documents matched the query")
                        }
                    }
                    Err(err) => Self::make_response(false, &format!("Delete failed: {}", err)),
                }
            }
            None => Self::make_response(false, "Query is not a valid BSON document"),
        }
    }

    // Удаление нескольких документов
    pub fn delete_many(&self, db_name: &str, collection_name: &str, query: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        // Преобразуем строку JSON в объект
        let query_value: Value = match serde_json::from_str(query) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse query JSON: {}", err)),
        };

        // Преобразуем объект JSON в BSON
        let bson_query = match bson::to_bson(&query_value) {
            Ok(bson) => bson,
            Err(err) => return Self::make_response(false, &format!("Failed to convert query to BSON: {}", err)),
        };

        // Проверяем, что BSON является документом
        match bson_query.as_document() {
            Some(bson_query_doc) => {
                // Удаляем несколько документов
                match collection.delete_many(bson_query_doc.clone(), None) {
                    Ok(result) => Self::make_response(
                        true,
                        &format!("Delete successful: {} documents deleted", result.deleted_count),
                    ),
                    Err(err) => Self::make_response(false, &format!("Delete failed: {}", err)),
                }
            }
            None => Self::make_response(false, "Query is not a valid BSON document"),
        }
    }

    // ПОИСК ДОКУМЕНТОВ ----------------------------------------------------------------------------

    // Поиск одного документа
    pub fn find_data(&self, db_name: &str, collection_name: &str, query: &str) -> String {

        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);
        let filter = doc! { "name": query };

        match collection.find_one(filter, None) {
            Ok(Some(doc)) => Self::make_response(true, &format!("{:?}", doc)),
            Ok(None) => Self::make_response(false, "Document not found"),
            Err(err) => Self::make_response(false, &format!("Find failed: {}", err)),
        }
    }

    // Поиск нескольких документов с пагинацией
    pub fn find_many(&self, db_name: &str, collection_name: &str, query: &str, page: i32, page_size: i32) -> String {

        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        // Парсим JSON в структуру Value
        let bson_query: Value = match serde_json::from_str(query) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse query JSON: {}", err)),
        };

        // Преобразуем JSON в BSON документ
        let bson_query_doc = match bson::to_document(&bson_query) {
            Ok(doc) => doc,
            Err(err) => return Self::make_response(false, &format!("Failed to convert query to BSON: {}", err)),
        };

        // Создаем параметры запроса с пагинацией
        let skip = page * page_size;
        let find_options = FindOptions::builder()
            .skip(skip as u64)   // Пропустить количество документов
            .limit(page_size as i64)  // Ограничить количество документов
            .build();

        // Выполняем поиск
        let cursor = match collection.find(bson_query_doc, find_options) {
            Ok(cursor) => cursor,
            Err(err) => return Self::make_response(false, &format!("Find failed: {}", err)),
        };

        // Собираем все документы из курсора в вектор
        let mut results = Vec::new();
        for result in cursor {
            match result {
                Ok(doc) => results.push(doc),
                Err(err) => return Self::make_response(false, &format!("Error iterating documents: {}", err)),
            }
        }

        // Преобразуем документы в JSON строку
        let json_results = match serde_json::to_string(&results) {
            Ok(json) => json,
            Err(err) => return Self::make_response(false, &format!("Failed to convert documents to JSON: {}", err)),
        };

        Self::make_response(true, &json_results)
    }

    // Поиск всех документов с пагинацией
    pub fn find_all(&self, db_name: &str, collection_name: &str, query: &str, page: i32, page_size: i32) -> String {

        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        // Парсим JSON в структуру Value
        let bson_query: Value = match serde_json::from_str(query) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse query JSON: {}", err)),
        };

        // Преобразуем JSON в BSON документ
        let bson_query_doc = match bson::to_document(&bson_query) {
            Ok(doc) => doc,
            Err(err) => return Self::make_response(false, &format!("Failed to convert query to BSON: {}", err)),
        };

        // Создаем параметры запроса с пагинацией
        let skip = page * page_size;
        let find_options = FindOptions::builder()
            .skip(skip as u64)   // Пропустить количество документов
            .limit(page_size as i64)  // Ограничить количество документов
            .build();

        // Выполняем поиск
        let cursor = match collection.find(bson_query_doc, find_options) {
            Ok(cursor) => cursor,
            Err(err) => return Self::make_response(false, &format!("Find failed: {}", err)),
        };

        // Собираем все документы из курсора в вектор
        let mut results = Vec::new();
        for result in cursor {
            match result {
                Ok(doc) => results.push(doc),
                Err(err) => return Self::make_response(false, &format!("Error iterating documents: {}", err)),
            }
        }

        // Преобразуем документы в JSON строку
        let json_results = match serde_json::to_string(&results) {
            Ok(json) => json,
            Err(err) => return Self::make_response(false, &format!("Failed to convert documents to JSON: {}", err)),
        };

        Self::make_response(true, &json_results)
    }

    // Проверка существования документа
    pub fn document_exists(&self, db_name: &str, collection_name: &str, query: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);
        let filter = doc! { "name": query };

        match collection.find_one(filter, None) {
            Ok(Some(_)) => Self::make_response(true, "true"),
            Ok(None) => Self::make_response(false, "false"),
            Err(err) => Self::make_response(false, &format!("Check failed: {}", err)),
        }
    }

    // Количество документов в коллекции
    pub fn count_documents(&self, db_name: &str, collection_name: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        match collection.count_documents(None, None) {
            Ok(count) => Self::make_response(true, &count.to_string()),
            Err(err) => Self::make_response(false, &format!("Count failed: {}", err)),
        }
    }

    // ДРУГОЕ --------------------------------------------------------------------------------------

    // Произвольный запрос
    pub fn run_custom_query(&self, db_name: &str, query: &str) -> String {
        let db = self.client.database(db_name);

        // Парсим строку запроса в BSON
        let bson_query: Value = match serde_json::from_str(query) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse query JSON: {}", err)),
        };

        let bson_query_doc = match bson::to_document(&bson_query) {
            Ok(doc) => doc,
            Err(err) => return Self::make_response(false, &format!("Failed to convert query to BSON: {}", err)),
        };

        // Выполнение произвольного запроса
        match db.run_command(bson_query_doc, None) {
            Ok(result) => Self::make_response(true, &format!("{:?}", result)),
            Err(err) => Self::make_response(false, &format!("Query execution failed: {}", err)),
        }
    }

    // Агрегация
    pub fn aggregate(&self, db_name: &str, collection_name: &str, pipeline: &str) -> String {
        let collection: Collection<Document> = self.client.database(db_name).collection(collection_name);

        // Парсим строку JSON в массив стадий агрегации
        let bson_pipeline: Vec<Document> = match serde_json::from_str(pipeline) {
            Ok(value) => value,
            Err(err) => return Self::make_response(false, &format!("Failed to parse pipeline JSON: {}", err)),
        };

        // Выполняем агрегацию
        let cursor = match collection.aggregate(bson_pipeline, None) {
            Ok(cursor) => cursor,
            Err(err) => return Self::make_response(false, &format!("Aggregation failed: {}", err)),
        };

        // Собираем результат в вектор
        let mut result: Vec<Value> = Vec::new();
        for document in cursor {
            match document {
                Ok(doc) => result.push(serde_json::to_value(doc).unwrap()),
                Err(err) => return Self::make_response(false, &format!("Failed to read document: {}", err)),
            }
        }

        // Возвращаем результат как строку
        Self::make_response(true, &serde_json::to_string(&result).unwrap())
    }
}
