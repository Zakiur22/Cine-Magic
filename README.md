# 🎬 CineMagic: Movies & TV Guide


Discover, track, and schedule your favorite cinematic experiences. Sourced directly from the largest global media databases.


---


## 🚀 Technical Stack & Architecture


This project is built using professional, scalable, and robust development technologies.


### 🛠️ Core Technology Stack

* **Framework:** Flutter SDK (`>= 3.19.0`) & Dart (`>= 3.3.0`)
* **State Management:** GetX State & Navigation Engine (`get` package for lightweight reactive states and micro-controllers)
* **Local Persistence:** Hive DB (Supercharged NoSQL local key-value storage) and Hive Adapters for caching media items.
* **APIs & Web Integrations:** IMDb API endpoints for fetching trending content, cast details, images, and user reviews.
* **Notifications Engine:** `flutter_local_notifications` integration mapping scheduled reminder alerts.
* **Video Playback:** Native YouTube Player integration allowing users to watch high-definition movie trailers inline.


### 🏗️ Architecture & Folder Structure

The application separates concerns cleanly. The modern Watchlist Reminder feature follows a strict **Clean Architecture** layering, allowing complete isolation of business rules from UI states:

```
lib/
├── features/
│   └── watchlist_reminder/       # Clean Architecture Watchlist Reminder Feature
│       ├── domain/
│       │   ├── models/           # Pure, immutable WatchlistReminder data entities
│       │   └── repositories/     # Repository contracts defining alert schedule queries
│       ├── data/
│       │   ├── datasources/      # Concrete local Hive database adapters and scheduled system notifications
│       │   └── repositories/     # Concrete repository adapters saving reminders
│       └── presentation/
│           ├── controllers/      # WatchlistReminderController (GetX) orchestrating user interactions
│           └── widgets/          # Animated schedule chips, date pickers, and alerts
├── controllers/                  # Legacy Global App Controllers (Theme, Search, Details)
├── models/                       # Core Movie and TV Show models
├── services/                     # Caching and API HTTP services
├── views/                        # Core UI Layouts (Home, Discovery, Watchlist, Settings)
└── main.dart                     # Main entrypoint initializing Hive adapters and global services
```


---


## 🛠️ Software Coding & Clean Code Principles


To ensure high quality, maintainability, and clean code standards, we applied rigorous software principles:

* **S.O.L.I.D. Architectural Guidelines:**
  * **Single Responsibility (SRP):** The `WatchlistReminderController` strictly manages UI-level reminder actions; it delegates the heavy lifting of persistent storage to Hive adapters.
  * **Open/Closed (OCP):** New notification backends (e.g., Firebase Cloud Messaging) can be introduced simply by conforming to the existing repository contracts.
  * **Liskov Substitution (LSP):** Base repository interfaces can be easily swapped with mocked test variants.
  * **Interface Segregation (ISP):** Keeping the local notification layer separated from core database services prevents bloated interfaces.
  * **Dependency Inversion (DIP):** Presentation layers rely on abstract repository contracts, which are resolved and injected cleanly using GetX's dependency injector (`Get.find<WatchlistReminderRepository>()`).
* **DRY (Don't Repeat Yourself):** Reusable movie grid cards, rating chips, and shimmer loading layouts are shared across all pages.
* **Separation of Concerns:** Isolated data acquisition from view presentation layers. State change listeners update widgets reactively.
* **Error Resilience & Safety:** Gracefully handles offline states, API rate limit throttles, and denied GPS permissions with user-friendly warnings.


---


## ✨ Extensive Features & Subfeatures Guide


### 🔍 Unified Media Directory & Deep Search

* **IMDb Integration:** 
  Query movies, TV series, seasons, and episodes with extensive details (e.g., cast list, crew, synopses, user ratings, and reviews).
* **Smart Recommendations:** 
  Real-time recommendation engine suggests similar content tailored to what you are currently viewing.
* **🔍 How to Access & Use:**
  1. On the home page, browse curated carousels like **Trending**, **Popular**, and **Top Rated** titles.
  2. To search for a specific title, tap the **Search** tab from the bottom navigation bar.
  3. Enter any movie title, actor, or genre in the top search bar.
  4. Tap on any media poster to open its rich information sheet, showing high-res trailers, cast profiles, ratings, and detailed descriptions.


### 📦 Supercharged NoSQL Local Watchlist

* **Sub-Millisecond Queries:** 
  Powered by **Hive DB** to query, add, or remove titles with zero lag.
* **Fully Localized Storage:** 
  Your personal watchlist is saved entirely on-device, ensuring offline access with no external internet connection required.
* **🔍 How to Access & Use:**
  1. When viewing any movie or TV show details page, tap the **Watchlist** button (+ icon).
  2. The button will immediately animate to a green checkmark, confirming the movie is bookmarked.
  3. To access your watchlist, navigate to the **Watchlist** tab from the bottom navigation bar.
  4. To remove a movie from your watchlist, simply tap the watchlist icon again on the details page, or use the swipe-to-remove gesture directly inside the Watchlist tab.


### ⏰ Premium Watchlist Reminder Engine

* **Interactive Media Scheduling:** 
  Plan your viewing sessions by setting custom alarms on your watch list.
* **Local Push Alarm Cues:** 
  Triggers local, high-priority notifications on your device at the specified date and time.
* **🔍 How to Access & Use:**
  1. Open any movie or show details page that you have added to your Watchlist.
  2. Tap on the dynamic **Alarm Bell Chip** (located near the top of the details panel).
  3. An interactive calendar and clock picker overlay will slide up.
  4. Select your planned date and time for watching the movie.
  5. Tap **Confirm Reminder**. The system will register a local notification.
  6. When the scheduled time arrives, you will receive a beautiful native push alert reminding you to start watching your movie!
  7. To clear or update a reminder, tap the **Alarm Bell Chip** again to adjust the schedule or tap **Cancel Reminder**.


---


## 🛠️ Developer Setup & Guidelines


### Requirements
* **Flutter SDK:** `>= 3.19.0`
* **Dart SDK:** `>= 3.3.0`


### Step-by-Step Installation

1. Navigate to the project directory:
   ```bash
   cd CineMagic
   ```

2. Register for an account on the [IMDb API Console](https://imdb-api.com/) and copy your developer key.

3. Open `lib/.api.dart` and enter your credentials:
   ```dart
   List<String> apiKeys = ["YOUR_API_KEY_HERE"];
   ```

4. Retrieve required dependencies:
   ```bash
   flutter pub get
   ```

5. Run code analysis:
   ```bash
   flutter analyze
   ```

6. Build a pristine production release APK:
   ```bash
   flutter build apk --release
   ```


---


## 🙏 Acknowledgements & Attribution


We would like to express our sincere gratitude to the original creators and maintainers of the original [ErfanRht/MovieLab](https://github.com/ErfanRht/MovieLab) repository, which served as the foundation of this work.


> [!NOTE]
> We have extensively worked on their original codebase, refactored the underlying logic, updated legacy dependencies, resolved complex build and runtime errors, and introduced many advanced modern enhancements. These upgrades include an interactive Watchlist Reminder Engine following strict Clean Architecture guidelines, ultra-performance offline storage utilizing Hive DB, and highly immersive custom cinematic layouts with full-bleed posters to create a highly optimized, state-of-the-art, and production-ready portfolio application.


---


## 📄 License & Open-Source


**CineMagic** is open-source software licensed under the **Apache-2.0 License**. See [LICENSE](LICENSE) for more details. Contributions and Pull Requests are always welcome!
