# 🌬️ AirGuard — Air Quality Monitoring App

A real-time air quality monitoring mobile application built with Flutter, using IoT sensors and a cloud backend to track and visualize air quality data.

---

## 📱 Screenshots

> Dashboard • Analytics • Device • Settings
> <img width="1170" height="2532" alt="simulator_screenshot_5F5A0FA3-6EE9-4F49-93F7-2184F270074F" src="https://github.com/user-attachments/assets/0f0d7fd0-9646-4919-9014-29406af0f31f" />

<img width="1170" height="2532" alt="simulator_screenshot_74368E57-FF3D-451C-8273-B02ED2B45067" src="https://github.com/user-attachments/assets/cef3ccc1-c1c6-42c9-bd53-37c94f39d4f9" />

<img width="1170" height="2532" alt="simulator_screenshot_FE4D712B-1A40-4B34-B0BC-0E1EA168D9AF" src="https://github.com/user-attachments/assets/982f19a3-ce65-4b8c-853c-48afb779eefa" />

<img width="1170" height="2532" alt="simulator_screenshot_ACFC77D4-A485-4406-93A1-48861FD255DD" src="https://github.com/user-attachments/assets/f98372fe-bc3a-4319-89e6-f3e269080665" />




---

## 🏗️ System Architecture

```
MQ-2 + DHT11 Sensors
        │
        ▼
   ESP8266 (Controller)
        │ HTTP POST
        ▼
   Flutter App (reads from ESP8266 API)
        │ Save to DB
        ▼
   Supabase (Backend + Database)
        │ Realtime Stream
        ▼
   Flutter UI (Live Updates)
```

---

## ⚙️ Hardware Components

| Component | Role |
|-----------|------|
| ESP8266 | Main microcontroller |
| MQ-2 | Gas sensor (methane, propane, butane, smoke, alcohol) |
| DHT11 | Temperature & humidity sensor |

---

## 🚀 Tech Stack

| Layer | Technology |
|-------|------------|
| Mobile | Flutter (Dart) |
| State Management | flutter_bloc / Cubit |
| Architecture | Clean Architecture |
| Navigation | go_router |
| Dependency Injection | get_it |
| Backend & Database | Supabase (Realtime) |
| Charts | fl_chart |
| Error Handling | fpdart (Either) |

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/       # App constants & thresholds
│   ├── enums/           # AirQualityStatus enum
│   ├── router/          # go_router navigation
│   ├── theme/           # Dark theme & colors
│   └── utils/           # AirQualityCalculator
│
├── data/
│   ├── datasources/     # HTTP + Supabase datasources
│   ├── models/          # SensorReadingModel (JSON parsing)
│   └── repositories/    # Repository implementations
│
├── domain/
│   ├── entities/        # SensorReading entity
│   ├── failures/        # Typed error handling
│   ├── repositories/    # Abstract interfaces
│   └── usecases/        # Business logic use cases
│
├── presentation/
│   ├── blocs/           # SensorDataCubit + states
│   ├── screens/         # 5 screens
│   └── widgets/         # Reusable UI components
│
├── injection_container.dart  # get_it DI setup
└── main.dart
```

---

## 📊 Air Quality Thresholds

| Status | Gas Level (PPM) | Color |
|--------|----------------|-------|
| 🟢 Good | < 400 ppm | Green `#00E5A0` |
| 🟡 Moderate | 400 – 700 ppm | Yellow `#FFC107` |
| 🔴 Dangerous | ≥ 700 ppm | Red `#F44336` |

---

## 🗄️ Database Schema

**Table:** `sensor_readings`

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Auto-generated primary key |
| temperature | float8 | Temperature in °C |
| humidity | float8 | Humidity percentage |
| methane | float8 | Methane level (PPM) |
| propane | float8 | Propane level (PPM) |
| butane | float8 | Butane level (PPM) |
| smoke | float8 | Smoke level (PPM) |
| alcohol | float8 | Alcohol level (PPM) |
| created_at | timestamptz | Auto-generated timestamp |

---

## 📡 ESP8266 API Integration

The ESP8266 sends sensor data to the Flutter app via HTTP GET:

**Endpoint:**
```
GET http://<ESP8266_IP>/api/data
```

**Response:**
```json
{
  "temperature": 25.5,
  "humidity": 60,
  "methane": 150,
  "propane": 80,
  "butane": 70,
  "smoke": 50,
  "alcohol": 45,
  "status": "NORMAL"
}
```

Flutter polls this endpoint every 2 seconds, then saves the data to Supabase for real-time streaming and historical analytics.

---

## 🛠️ Getting Started

### Prerequisites
- Flutter SDK ≥ 3.4.0
- Dart SDK ≥ 3.4.0
- Supabase account

### Installation

```bash
# Clone the repo
git clone https://github.com/yousefemadkhazbak183/air_quality_app.git
cd air_quality_app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Configuration

Update `lib/core/constants/app_constants.dart`:

```dart
// ESP8266 IP address
static const String baseUrl = 'http://YOUR_ESP8266_IP';

// Supabase credentials
static const String supabaseUrl = 'YOUR_SUPABASE_URL';
static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
```

### Supabase Setup

Run this SQL in your Supabase SQL Editor:

```sql
CREATE TABLE sensor_readings (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  temperature FLOAT8,
  humidity FLOAT8,
  methane FLOAT8,
  propane FLOAT8,
  butane FLOAT8,
  smoke FLOAT8,
  alcohol FLOAT8,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER PUBLICATION supabase_realtime ADD TABLE sensor_readings;
```

---

## 📱 Screens

| Screen | Description |
|--------|-------------|
| **Splash** | App intro with fade animation |
| **Dashboard** | Live air quality status + sensor cards |
| **Analytics** | Historical line charts (Gas, Temperature, Humidity) |
| **Device** | ESP8266 hardware info and connection status |
| **Settings** | Notification toggles and alert thresholds |

---

## 🧱 Architecture Principles

- **Clean Architecture** — strict separation of data, domain, presentation
- **SOLID + DRY + KISS** — applied throughout
- **Dumb UI** — zero business logic in widgets
- **Either<Failure, T>** — no raw exceptions reach the UI
- **Dependency Injection** — all dependencies injected via get_it

---

## 👥 Team

| Role | Name |
|------|------|
| Flutter Developer | Yousef Emad |
| Hardware Engineer | Mohamed Ruby |

---

## 📄 License

This project is a graduation project — All rights reserved © 2026
