# AGENTS.md

This file is the authoritative guide for AI agents working in this repo. Read it fully before making changes.

## What this project is

The **mobile (patient-facing) app** for Fisiomate, an AI-powered Remote
Therapeutic Monitoring (RTM) platform. Physiotherapists prescribe Home
Exercise Programs (HEP) through a separate web dashboard; patients follow
those programs in this app, with exercise form and repetitions tracked via
on-device pose detection. This is the real MVP build for RISTEK Hackathon
2026 Final Round — not a throwaway prototype. Auth, backend integration,
and UI polish are all in scope here (unlike the earlier pose-detection
spike, which was a separate, disposable project).

---

# Part 1 — General Architecture

## Tech stack

**Mobile (this repo):**

- Flutter, feature-first architecture (data / domain / presentation per
  feature)
- **Bloc/Cubit** — state management, paired with **Freezed** for state
  classes
- **Freezed** — data models (JSON-serializable) and sealed unions
- **Hive** — local storage/cache
- **Dio** — HTTP client
- **flutter_dotenv** — reads environment config for API endpoints
- **go_router** — routing, with a `redirect`-based auth guard (see
  Authentication below)
  **External systems this app talks to (separate repos):**
- Backend: FastAPI + SQLModel — REST API, source of truth for exercise
  definitions, AngleRules, routines, and sessions
- Web dashboard (physiotherapist-facing): React, not part of this repo

## Project structure

```
lib/
├── app.dart                        # Root MaterialApp.router
├── main.dart                       # Entry point — init Hive
│
├── core/
│   ├── client/                      # HTTP layer: apiCall(), get/post/put/delete wrappers with logger
│   ├── environments/                # EndPoints (reads from Config via flutter_dotenv)
│   ├── errors/                      # Failure hierarchy + DioFailure
│   ├── themes/                      # BaseColors, FontTheme
│   └── utils/                       # Date/time helpers, angle_calculator.dart (see Part 2)
│
├── features/
│   └── <feature_name>/
│       ├── data/
│       │   ├── datasources/         # Local (Hive) + Remote (Dio) — _datasources.dart barrel
│       │   ├── models/              # Freezed + JSON models — _models.dart barrel
│       │   └── repositories/        # Repository impl — _repositories.dart barrel
│       ├── domain/
│       │   ├── entity/              # Pure domain entities (no JSON, no annotations)
│       │   └── repositories/        # Abstract interfaces — _repositories.dart barrel
│       └── presentation/
│           ├── cubit/               # Cubit + Freezed state — _cubits.dart barrel
│           ├── pages/                # Screen widgets — _pages.dart barrel
│           └── widgets/              # Feature-scoped widgets — _widgets.dart barrel
│
└── services/
    ├── storage/                     # HiveService (auth box + cache box) + SecureKeyService
    ├── jwt_service.dart
    ├── logger_service.dart
    └── router_service.dart
```

**Where pose-detection code lives specifically** (architecture details in
Part 2 below):

- `core/utils/angle_calculator.dart` — angle catalog + formula
- `services/pose_detection_service.dart` — ML Kit camera wrapper (device
  capability, same tier as `HiveService`, not feature-specific)
- `features/exercise/` — `Exercise`/`AngleRule` entities,
  repository, cubit, and the camera tracking screen

---

# Part 2 — Pose Detection & Exercise Evaluation Engine

This section is deliberately separated from Part 1. Read it before
touching anything under `features/exercise/`,
`core/utils/angle_calculator.dart`, or `services/pose_detection_service.dart`.

## Core design decision: two concerns, two rates of change

The engine separates the codebase along **how often each part changes**,
not just by technical function:

- **Angle Catalog** (`core/utils/angle_calculator.dart`) — a fixed,
  hardcoded map of which three landmarks form each anatomically meaningful
  joint angle (e.g. `rightKnee` = rightHip–rightKnee–rightAnkle). This is
  anatomy, not configuration — it almost never changes, so it lives in app
  code.
- **AngleRule** (backend-driven, fetched via `ExerciseRepository`) —
  thresholds and feedback messages that define whether a given exercise is
  being performed correctly. This is what physiotherapists actually need
  to adjust often, so it's data, not code — new exercises or refined
  thresholds ship without an app rebuild.
  Never move angle _definitions_ (which landmarks form an angle) into
  backend data, and never hardcode exercise _thresholds_ in app code — that
  inverts the whole point of this separation.

## Angle calculation formula

```dart
double calculateAngle(Point2D first, Point2D mid, Point2D last) {
  var result = (atan2(last.y - mid.y, last.x - mid.x) -
                atan2(first.y - mid.y, first.x - mid.x)) * 180 / pi;
  result = result.abs();
  if (result > 180) result = 360.0 - result;
  return result;
}
```

This matches Google's official ML Kit "Classifying poses" reference
formula — chosen deliberately so any bug can be diff'd against the
official example rather than a from-scratch derivation.

`computeAllCatalogAngles(landmarks)` runs this once per frame for **every**
angle in the catalog (not just the ones the current exercise needs) and
returns a `Map<String, double?>`, so any `AngleRule` can look up any angle
by name without knowing how to compute it.

## Exercise model

```dart
sealed class Exercise {
  final String id;
  final String name;
  final List<String> requiredLandmarks;
}

class RepBasedExercise extends Exercise {
  final List<AngleRule> upRules;
  final List<AngleRule> downRules;
}

class DurationBasedExercise extends Exercise {
  final List<AngleRule> holdRules;
}
```

- `targetReps` / `targetDuration` are **not** part of `Exercise` — those
  are prescription parameters and live on `RoutineItem` instead (set per
  patient by the physio), not on the exercise definition itself.
- `AngleRule` carries `angleName`, `minAngle`/`maxAngle`, and per-condition
  feedback messages (`missingMessage`, `belowMinMessage`,
  `aboveMaxMessage`) — fully JSON-serializable, this is what the backend
  sends.
- Rule lists (`upRules`/`downRules`/`holdRules`) are evaluated
  **short-circuit, in array order**: stop and surface the first failing
  rule's message. Order = priority (e.g. check back angle before knee
  angle, since injury-risk feedback should outrank a "go deeper" prompt).

## Known limitations — do not silently extend past these

`AngleRule` only works for exercises reducible to a single joint angle
against a threshold, evaluated per-frame. It does **not** cover:

- Isometric holds with no visible joint movement (e.g. quad sets)
- Bilateral symmetry comparison (left vs. right side)
- Stability/balance scoring (variance over time, not a single angle)
- Tempo/speed-based validation (needs velocity + time, not just position)
  If a new exercise needs any of the above, it needs a new `Exercise`
  subtype and rule type — don't force-fit it into `AngleRule`.

# Part 3 — Backlog

### Onboarding

- Onboarding intro screen

### Authentication & Physiologist Connection

- User Auth & Profile Setup (login/sign up)
- Koneksi dengan physiologist (connection code entry)
- Konfirmasi (connection success)

### Home Screen

- Personalized Greeting Header
- Today's Program Card
- Exercise Progress Graph
- Program Calendar View
- Calendar History Detail Modal

### Chatting

- Sticky FAB Direct Doctor Chat
- Direct Chat Conversation Window

### Progress

- Progress Pasien (compliance + accuracy analytics)

### Start Exercise

- Daftar Latihan Terjadwal Hari Ini (pre-session checklist)
- Guide Gerakan & Hitung Mundur 10 Detik
- Tampilan Kamera Deteksi Postur AI Real-Time
- Hasil Akhir Latihan & Pengiriman

### Navigation Bar

- Navigation Bar (Home / Progress / Profil)

### Profil

- Profil Patient

# Part 4 — Preferences & Conventions

## Developer Working Preferences

- Timeline is tight (hackathon Final Round, Aug 10–14) — prioritize
  solutions that can be quickly validated on a real device over solutions
  that are theoretically "more correct" but slow to implement.
- When unsure between two approaches, briefly explain the trade-off then
  give a recommendation — don't just present one option without reasoning.
- Match the existing structure/conventions above rather than introducing
  new patterns

## Development Conventions

- **Barrel files per layer** (`_datasources.dart`, `_models.dart`,
  `_repositories.dart`, `_cubits.dart`, `_pages.dart`, `_widgets.dart`) —
  follow the existing pattern when adding files to a feature, don't invent
  a different export style.
- **Domain entities stay pure** — no `@JsonSerializable`/`@freezed` JSON
  annotations, no Flutter imports, no Dio/Hive types. Only `data/models`
  knows about JSON shape; `data/repositories` maps models → entities.
- **Errors** go through the `Failure` hierarchy in `core/errors` —
  don't throw raw exceptions from a repository or datasource; wrap Dio
  errors as `DioFailure`.
- **Logging** via `services/logger_service.dart` — a simple singleton, not
  a full DI container. Don't introduce a second logging pattern.

## Language Convention

- **User-facing text** (anything rendered in the UI -> labels, buttons, error messages shown to the user, toast notifications, form validation messages, etc.) must be written in **Bahasa Indonesia**.
- **Developer-facing text** (console logs, code comments, commit messages, internal error logs not shown to users, variable/function names) must be written in **English**.
  Example:

```ts
// Fetch speaker list from backend (English comment, dev-facing)
try {
	const speakers = await getSpeakers();
} catch (error) {
	console.error("Failed to fetch speakers:", error); // English, dev-facing
	toast.error("Gagal memuat data narasumber"); // Indonesian, user-facing
}
```
