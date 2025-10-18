Приложение для стажировки DMARK 

Core Dependencies
State Management: BLoC
Dependency Injection: GetIt
Data sotrage: Hive

Структура:
```
├── bottomNavbar.dart                # Нижняя панель навигации
├── main.dart                        # Точка входа в приложение
└── src/
    ├── core/                        # Общая логика и вспомогательные модули
    │   ├── constants/               # Константы (цвета, размеры и т.п.)
    │   ├── enums/                   # Перечисления (enums)
    │   ├── error/                   # Обработка ошибок
    │   ├── functions/               # Утилитарные функции
    │   ├── getIt/                   # Настройка зависимостей (Service Locator)
    │   ├── modals/                  # Модальные окна (диалоги)
    │   ├── theme/                   # Тема приложения
    │   ├── utils/                   # Разные утилиты (валидаторы, форматтеры)
    │   └── widgets/                 # Общие переиспользуемые виджеты
    │
    ├── data/                        # Слой данных (работа с Hive)
    │   ├── datasources/             # Источники данных (Hive, SQLite и т.д.)
    │   ├── models/                  # Модели данных (ProductModel, StockModel)
    │   └── repositories/            # Реализация репозиториев
    │
    ├── domain/                      # Бизнес-логика (доменный слой)
    │   ├── entities/                # Сущности (чистые классы без зависимостей)
    │   ├── repositories/            # Интерфейсы репозиториев
    │   └── usecases/                # Бизнес-кейсы (например, AddProductUseCase)
    │
    └── presentation/                # UI слой (интерфейс пользователя)
        ├── blocs/                   # BLoC — управление состоянием
        ├── pageParts/               # Части экранов (виджеты, повторяющиеся блоки)
        └── pages/                   # Основные страницы приложения
```
Видео демонстарция:

https://github.com/user-attachments/assets/ce46bb37-fce7-4f38-a4d5-1aba0d47abc1

Скриншоты:
<img width="479" height="974" alt="image" src="https://github.com/user-attachments/assets/8c0407ab-8168-4351-866e-bee50f8ea364" />
<img width="469" height="973" alt="image" src="https://github.com/user-attachments/assets/7351195f-4319-4cee-9524-a665f47db494" />
<img width="479" height="971" alt="image" src="https://github.com/user-attachments/assets/c5ffde81-6383-478f-9ae5-fedd5d96fe20" />
<img width="482" height="976" alt="image" src="https://github.com/user-attachments/assets/89b0f253-24ac-4db2-9641-3e62666b7ace" />
<img width="484" height="972" alt="image" src="https://github.com/user-attachments/assets/7001c797-c57e-43f9-8afe-b84ff59e7a79" />
<img width="478" height="973" alt="image" src="https://github.com/user-attachments/assets/7b229550-68c2-4875-88df-e68476529da5" />
<img width="456" height="114" alt="image" src="https://github.com/user-attachments/assets/1b13cf69-07e4-48d4-ba7b-25231d67b57e" />
<img width="480" height="969" alt="image" src="https://github.com/user-attachments/assets/66a764b9-b5fc-4a79-9573-790a04b2c5f6" />
<img width="476" height="969" alt="image" src="https://github.com/user-attachments/assets/0a6f6d63-2bc9-45a6-8ef1-89e36f0c5ab2" />
<img width="484" height="969" alt="image" src="https://github.com/user-attachments/assets/1dcf0152-86e5-48fb-b332-7cdd2c7eccc4" />
<img width="482" height="972" alt="image" src="https://github.com/user-attachments/assets/4b9be056-d3c1-44a6-af9e-2333c8d94592" />
