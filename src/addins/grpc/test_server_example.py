#!/usr/bin/env python3
"""
Пример простого gRPC сервера для тестирования DLL.
Требует: pip install grpcio grpcio-tools
"""

import grpc
from concurrent import futures
import time

# Генерируем код из proto (в реальном проекте это делается заранее)
import subprocess
import os

# Создаем proto файл
proto_content = '''
syntax = "proto3";

package example;

service ExampleService {
    rpc SayHello (HelloRequest) returns (HelloResponse);
    rpc GetUser (GetUserRequest) returns (User);
}

message HelloRequest {
    string name = 1;
}

message HelloResponse {
    string message = 1;
}

message GetUserRequest {
    int32 user_id = 1;
}

message User {
    int32 id = 1;
    string name = 2;
    string email = 3;
    bool active = 4;
}
'''

# Сохраняем proto файл
with open('example.proto', 'w') as f:
    f.write(proto_content)

# Генерируем Python код
subprocess.run([
    'python', '-m', 'grpc_tools.protoc',
    '--python_out=.',
    '--grpc_python_out=.',
    'example.proto'
])

# Импортируем сгенерированные модули
import example_pb2
import example_pb2_grpc

class ExampleServiceServicer(example_pb2_grpc.ExampleServiceServicer):
    def SayHello(self, request, context):
        return example_pb2.HelloResponse(
            message=f"Привет, {request.name}! Ответ от gRPC сервера."
        )
    
    def GetUser(self, request, context):
        # Имитируем базу данных пользователей
        users = {
            1: {"name": "Иван Иванов", "email": "ivan@example.com", "active": True},
            2: {"name": "Петр Петров", "email": "petr@example.com", "active": False},
            3: {"name": "Анна Сидорова", "email": "anna@example.com", "active": True},
        }
        
        user_data = users.get(request.user_id)
        if user_data:
            return example_pb2.User(
                id=request.user_id,
                name=user_data["name"],
                email=user_data["email"],
                active=user_data["active"]
            )
        else:
            context.set_code(grpc.StatusCode.NOT_FOUND)
            context.set_details(f'Пользователь с ID {request.user_id} не найден')
            return example_pb2.User()

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    example_pb2_grpc.add_ExampleServiceServicer_to_server(
        ExampleServiceServicer(), server
    )
    
    listen_addr = '[::]:50051'
    server.add_insecure_port(listen_addr)
    
    print(f"Запуск gRPC сервера на {listen_addr}")
    print("Для тестирования используйте:")
    print("1. Загрузите proto схему в DLL")
    print("2. Подключитесь к http://localhost:50051")
    print("3. Вызовите методы SayHello или GetUser")
    
    server.start()
    
    try:
        while True:
            time.sleep(86400)  # Ждем день
    except KeyboardInterrupt:
        print("Остановка сервера...")
        server.stop(0)

if __name__ == '__main__':
    serve()