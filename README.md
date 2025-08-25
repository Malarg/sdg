# sdg

## Countries and states loading demo

## Architecture

This Flutter application follows a **Clean Architecture** pattern with **Feature-based organization**, implementing modern Flutter development practices using **Riverpod** for state management.

### 🏗️ Overall Structure

```
lib/
├── api/                  # External API layer
├── features/             # Feature-based modules
│   ├── app/              # Application-level dependencies
│   ├── common/           # Shared components
│   └── locations/        # Locations feature module
└── main.dart             # Application entry point
```

### 📐 Architecture Layers

#### 1. **Presentation Layer** (`presentation/`)
- **Screens**: Main UI screens with business logic coordination
- **Widgets**: Reusable UI components with specific functionality
- **Controllers**: Riverpod-based state management (NotifierProvider pattern)
- **Entities**: Presentation-specific data models extending domain entities

#### 2. **Domain Layer** (`domain/`)
- **Entities**: Core business models (`Country`, `CountryState`) using Equatable
- **Repositories**: Abstract interfaces defining data contracts

#### 3. **Data Layer** (`data/`)
- **Repositories**: Concrete implementations of domain repositories
- **Mappers**: Data transformation between DTOs and domain entities

#### 4. **API Layer** (`api/`)
- **DTOs**: Data Transfer Objects using Freezed for immutability
- **API Clients**: Retrofit-based HTTP client with Dio

### 🔧 Key Technologies & Patterns

#### **State Management - Riverpod**
- `NotifierProvider.autoDispose` for component-specific and screen-specific state
- Riverpod `Provider` for dependency injection
- Reactive programming with automatic dependency tracking
- Proper lifecycle management with auto-dispose

#### **Dependency Injection**
- Centralized providers in dedicated DI modules (`di/`)
- `AppProviders` for application-level dependencies (HTTP client)
- `FeatureProviders` for feature-specific dependencies

#### **Data Modeling**
- **Domain Entities**: Immutable value objects with Equatable
- **DTOs**: Freezed classes for type-safe JSON handling
- **Presentation Entities**: Extended domain entities with UI-specific mixins
- **Mappers**: Static methods for clean data transformation

#### **Error Handling**
- Custom state classes for comprehensive error management
- Exception propagation with stack trace preservation
- User-friendly error states in UI components

#### **Code Generation**
- **Freezed**: Immutable data classes with pattern matching
- **JSON Serializable**: Automatic JSON serialization
- **Retrofit**: Type-safe HTTP client generation

### 🎯 Feature Structure (Locations Example)

```
features/locations/
├── data/
│   ├── mappers/           # DTO ↔ Entity transformations
│   └── repositories/      # Repository implementations
├── di/                    # Dependency injection setup
├── domain/
│   ├── entities/          # Core business models
│   └── repositories/      # Repository contracts
└── presentation/
    ├── entities/          # UI-specific models
    ├── screens/           # Main UI screens
    └── widgets/           # Feature-specific components
```

### 🔄 Data Flow

1. **UI** triggers action → **Controller** (Riverpod Notifier)
2. **Controller** calls → **Repository** (via dependency injection)
3. **Repository** uses → **API Client** (Retrofit + Dio)
4. **API** returns → **DTOs** (Freezed classes)
5. **Mapper** converts → **Domain Entities**
6. **Controller** updates → **State** (SdgState sealed class)
7. **UI** rebuilds → Based on state changes (Consumer widgets)

Unfortunately I have not more time for this demo, so I'll describe here what should be done to make it more production-ready:
1. Crash notification system (e.g. Crashlytics) 
2. Navigation
3. Localisation
4. Security (Env file for base url)
5. Logging