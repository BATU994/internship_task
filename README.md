# 📦 Приложение для Стажировки

Мобильное приложение на **Flutter**.  
Проект реализован с использованием принципов **Clean Architecture**, шаблона **BLoC** для управления состоянием, **Hive** для локального хранения данных и **GetIt** для внедрения зависимостей.

---

## 🚀 Основные зависимости

| Назначение | Пакет |
|-------------|--------|
| **Управление состоянием** | [flutter_bloc](https://pub.dev/packages/flutter_bloc) |
| **Внедрение зависимостей** | [get_it](https://pub.dev/packages/get_it) |
| **Хранение данных** | [hive](https://pub.dev/packages/hive) |

---

## 🧱 Структура проекта
```

├── bottomNavbar.dart # Нижняя панель навигации
├── main.dart # Точка входа в приложение
└── src/
├── core/ # Общая логика и вспомогательные модули
│ ├── constants/ # Константы (цвета, размеры и т.п.)
│ ├── enums/ # Перечисления (enums)
│ ├── error/ # Обработка ошибок
│ ├── functions/ # Утилитарные функции
│ ├── getIt/ # Настройка зависимостей (Service Locator)
│ ├── modals/ # Модальные окна (диалоги)
│ ├── theme/ # Тема приложения
│ ├── utils/ # Валидаторы, форматтеры и прочие утилиты
│ └── widgets/ # Переиспользуемые виджеты
│
├── data/ # Слой данных (Hive)
│ ├── datasources/ # Источники данных (Hive, SQLite и т.д.)
│ ├── models/ # Модели данных (ProductModel, StockModel)
│ └── repositories/ # Реализация репозиториев
│
├── domain/ # Доменный слой (бизнес-логика)
│ ├── entities/ # Сущности (чистые классы без зависимостей)
│ ├── repositories/ # Интерфейсы репозиториев
│ └── usecases/ # Бизнес-кейсы (например, AddProductUseCase)
│
└── presentation/ # UI слой
├── blocs/ # BLoC — управление состоянием
├── pageParts/ # Части экранов (повторяющиеся элементы)
└── pages/ # Основные страницы приложения

```
---

## 🎥 Видео-демонстрация



https://github.com/user-attachments/assets/2ca16144-9d32-4300-8603-6dc652f65fe2



---

## 🖼️ Скриншоты

### 🏠 Главная страница
<img width="479" height="974" alt="Home 1" src="https://github.com/user-attachments/assets/8c0407ab-8168-4351-866e-bee50f8ea364" />
<img width="469" height="973" alt="Home 2" src="https://github.com/user-attachments/assets/7351195f-4319-4cee-9524-a665f47db494" />
<img width="479" height="971" alt="Home 3" src="https://github.com/user-attachments/assets/c5ffde81-6383-478f-9ae5-fedd5d96fe20" />
<img width="482" height="976" alt="Home 4" src="https://github.com/user-attachments/assets/89b0f253-24ac-4db2-9641-3e62666b7ace" />
<img width="484" height="972" alt="Home 5" src="https://github.com/user-attachments/assets/7001c797-c57e-43f9-8afe-b84ff59e7a79" />
<img width="478" height="973" alt="Home 6" src="https://github.com/user-attachments/assets/7b229550-68c2-4875-88df-e68476529da5" />
<img width="456" height="114" alt="Footer" src="https://github.com/user-attachments/assets/1b13cf69-07e4-48d4-ba7b-25231d67b57e" />

### ➕ Страница добавления
<img width="477" height="976" alt="Add 1" src="https://github.com/user-attachments/assets/ef2810d8-1181-4157-84ec-27c1baaf6c00" />
<img width="480" height="969" alt="Add 2" src="https://github.com/user-attachments/assets/66a764b9-b5fc-4a79-9573-790a04b2c5f6" />
<img width="476" height="969" alt="Add 3" src="https://github.com/user-attachments/assets/0a6f6d63-2bc9-45a6-8ef1-89e36f0c5ab2" />
<img width="484" height="969" alt="Add 4" src="https://github.com/user-attachments/assets/1dcf0152-86e5-48fb-b332-7cdd2c7eccc4" />
<img width="482" height="972" alt="Add 5" src="https://github.com/user-attachments/assets/4b9be056-d3c1-44a6-af9e-2333c8d94592" />

---

## ⚙️ Ключевые особенности

- 🗂 **Локальное хранилище Hive** для быстрого доступа к данным  
- ⚙️ **Паттерн BLoC** для предсказуемого управления состоянием  
- 🔗 **GetIt** для внедрения зависимостей  
- 🎨 Модульная и масштабируемая архитектура  

---

## 🧠 Архитектура проекта

Приложение построено по принципам **Clean Architecture**:

Presentation → Domain → Data
(UI слой) (Логика) (Хранение)

yaml
Копировать код

Каждый слой выполняет чёткую роль:
- **Presentation** — отображение данных и взаимодействие с пользователем  
- **Domain** — бизнес-логика и use cases  
- **Data** — работа с хранилищем и репозиториями  

---

## 👨‍💻 Автор

**Бату**  
📍 Казахстан  
🌐 [GitHub профиль](https://github.com/yourusername)

---
