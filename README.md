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
    │   ├── theme/                   # Тема приложения (светлая/тёмная)
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
