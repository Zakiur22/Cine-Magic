# Project Plan - MovieLab

## 1. Current State Assessment
* **Category:** Media & Entertainment
* **Tech Stack:** GetX state management, Hive local database, http, cached_network_image, google_nav_bar, fl_chart, gallery_saver.
* **SDK Range:** `>=2.15.1 <3.0.0` (Needs upgrade to Dart SDK `>=3.0.0 <4.0.0`).
* **Status:** High quality TMDB API client. Requires upgrading dependencies (like GetX, Hive, fl_chart), and ensuring modern Gradle/release build compliance.

## 2. Planned Enhancements (Phase 4)
* **New Feature: Personalized Watchlist Reminder Engine**
  * **Objective:** Alert users of upcoming or planned movies they wish to watch.
  * **Implementation:** Create a persistent Watchlist scheduler utilizing `Hive` and local system notifications to prompt custom alerts for planned view dates.
  * **UI/UX:** Add a customizable scheduling calendar/picker within the Watchlist tab with quick-add notifications and priority badges.
