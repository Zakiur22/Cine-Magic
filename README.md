# 🎬 CineMagic: Movies & TV Guide


Discover, track, and schedule your favorite cinematic experiences. Sourced directly from the largest global media databases.


<p align="center">
  <img src="./screenshots/mockups/CineMagic_mockup2.jpg" width="100%" alt="CineMagic Showcase" />
</p>


---


## 🎨 Premium Visual Design & Cinematic Aesthetics


CineMagic offers a state-of-the-art visual experience designed with a rich cinematic aesthetic:

* **Full-Bleed Posters:** Dynamic poster backdrops that blend smoothly with rich gradient backgrounds tailored to the movie's primary colors.
* **Fluid Gestures:** Intuitive swiping and scroll effects, swipe-to-remove grids, and beautiful native hero transitions that make navigation feel natural.
* **Trailer Integration:** Seamless inline player to view high-definition official YouTube trailers without exiting the application context.


---


## ✨ Key Features & User Guide


### 🔍 Unified Media Directory & Deep Search

* **IMDb Integration:** Query movies, TV series, seasons, and episodes with extensive details (e.g., cast list, crew, synopses, user ratings, and reviews).
* **Smart Recommendations:** Real-time recommendation engine suggests similar content tailored to what you are currently viewing.
* **🔍 How to Access & Use:**
  1. On the home page, browse curated carousels like **Trending**, **Popular**, and **Top Rated** titles.
  2. To search for a specific title, tap the **Search** tab from the bottom navigation bar.
  3. Enter any movie title, actor, or genre in the top search bar.
  4. Tap on any media poster to open its rich information sheet, showing high-res trailers, cast profiles, ratings, and detailed descriptions.


### 📦 Supercharged NoSQL Local Watchlist

* **Sub-Millisecond Queries:** Powered by **Hive DB** to query, add, or remove titles with zero lag.
* **Fully Localized Storage:** Your personal watchlist is saved entirely on-device, ensuring offline access with no external internet connection required.
* **🔍 How to Access & Use:**
  1. When viewing any movie or TV show details page, tap the **Watchlist** button (+ icon).
  2. The button will immediately animate to a green checkmark, confirming the movie is bookmarked.
  3. To access your watchlist, navigate to the **Watchlist** tab from the bottom navigation bar.
  4. To remove a movie from your watchlist, simply tap the watchlist icon again on the details page, or use the swipe-to-remove gesture directly inside the Watchlist tab.


### ⏰ Premium Watchlist Reminder Engine

* **Interactive Media Scheduling:** Plan your viewing sessions by setting custom alarms on your watch list.
* **Local Push Alarm Cues:** Triggers local, high-priority notifications on your device at the specified date and time.
* **🔍 How to Access & Use:**
  1. Open any movie or show details page that you have added to your Watchlist.
  2. Tap on the dynamic **Alarm Bell Chip** (located near the top of the details panel).
  3. An interactive calendar and clock picker overlay will slide up.
  4. Select your planned date and time for watching the movie.
  5. Tap **Confirm Reminder**. The system will register a local notification.
  6. When the scheduled time arrives, you will receive a beautiful native push alert reminding you to start watching your movie!
  7. To clear or update a reminder, tap the **Alarm Bell Chip** again to adjust the schedule or tap **Cancel Reminder**.


---


## 🏗️ Clean Architecture Overview


The reminder module is isolated under `lib/features/watchlist_reminder/`, upholding clean architectural and SOLID principles:

```
lib/features/watchlist_reminder/
├── domain/
│   ├── models/           # Immutable WatchlistReminder data entity mapping movie IDs and times
│   └── repositories/     # Repository contract interface specifying scheduling queries
├── data/
│   ├── datasources/      # Concrete local Hive database adapters
│   └── repositories/     # Decoupled implementation binding domain contracts and datasources
└── presentation/
    ├── controllers/      # WatchlistReminderController (GetX) driving state and scheduling push triggers
    └── widgets/          # Animated schedule chips and time picker sheet overlays
```


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
> This repository represents an **extensive, premium upgrade** from the original codebase. It introduces a modernized cinematic theme, a high-performance local NoSQL watchlist using Hive, a premium Watchlist Reminder and Notification Engine following rigorous S.O.L.I.D. architectural guidelines, and extensive package compatibility upgrades for contemporary Flutter/Dart platforms.


---


## 📄 License & Open-Source


**CineMagic** is open-source software licensed under the **Apache-2.0 License**. See [LICENSE](LICENSE) for more details. Contributions and Pull Requests are always welcome!
