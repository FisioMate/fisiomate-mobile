# Fisiomate Mobile

The patient-facing mobile app for **Fisiomate**, an AI-powered Remote Therapeutic Monitoring (RTM) platform. Physiotherapists prescribe Home Exercise Programs (HEP) through a separate web dashboard; patients follow those programs here, with exercise form and repetitions tracked in real time via on-device pose detection.

Built for **RISTEK Hackathon 2026's Final Round**.

## Features

- **Auth**, email/password login & registration, connect to a
  physiotherapist via a connection code
- **Home**, personalized greeting, today's scheduled session, monthly
  exercise calendar, compliance/accuracy summary
- **Exercise session**, pre-session checklist, movement guide with a
  countdown, real-time camera pose tracking with live form feedback, and
  a results screen that logs the completed session
- **Progress**, compliance and pose-accuracy trends, full session
  history
- **Profile**, patient info, physiotherapist connection status

## Tech stack

- **Flutter**: feature-first Clean Architecture (`data` / `domain` /
  `presentation` per feature)
- **Bloc/Cubit** + **Freezed**: state management and sealed state unions
- **go_router**: routing with a `redirect`-based auth guard
- **Dio**: HTTP client
- **Hive**: local storage (auth session) and offline read cache
- **google_mlkit_pose_detection** + **camera**: on-device pose tracking
- **fl_chart**: progress/accuracy charts

## Project structure

```
lib/
├── app.dart                # Root widget, repository providers
├── main.dart                # Entry point
├── core/                     # Shared, feature-agnostic code
│   ├── client/                 # Dio wrapper (auth interceptor, error mapping)
│   ├── environments/            # .env config + API endpoint catalog
│   ├── errors/                   # Failure types
│   ├── themes/                    # Colors, fonts, ThemeData
│   ├── utils/                      # Angle calculation, date formatting
│   └── widgets/                     # Reusable design-system widgets
├── services/                # App-wide singletons, not tied to one feature
│   ├── storage/                # Hive boxes, secure key, token storage
│   ├── jwt_service.dart
│   ├── logger_service.dart
│   ├── pose_detection_service.dart
│   └── router_service.dart      # go_router config + auth guard
└── features/                # Feature-first Clean Architecture
    ├── auth/                   # Login, registration, physiotherapist connection
    ├── exercise/                # Catalog, routine items, pose evaluation, camera flow
    ├── home/                     # Dashboard: greeting, today's session, calendar
    ├── progress/                  # Compliance/accuracy stats, session history
    ├── profile/                    # Patient profile, settings
    └── chat/                        # Placeholder, not implemented yet
```

## Architecture

Clean Architecture, feature-first. Each feature under `lib/features/<name>/`
is split into three layers, and dependencies only point one way:
`presentation` -> `domain` <- `data`.

- `domain/`: entities (plain Dart classes, no Flutter/Dio/JSON dependencies)
  and repository _interfaces_. This is the only layer the rest of the app is
  allowed to depend on.
- `data/`: repository _implementations_, datasources (the actual Dio calls),
  and models (`fromJson`/`toEntity` mapping into domain entities). Only this
  layer knows the backend's real JSON shape.
- `presentation/`: Cubits (state) and pages/widgets, consuming only the
  domain repository interface via `context.read<XRepository>()`, injected
  once at the root (`app.dart`) with `RepositoryProvider`.

## Pose detection & exercise evaluation

The camera + pose-tracking flow (`features/exercise/`) is the app's most
involved piece, split along how often each part changes:

- **`services/pose_detection_service.dart`**: wraps the device camera and
  `google_mlkit_pose_detection` into a single frame -> `Pose` stream. A
  frame-skip guard drops new camera frames while ML Kit is still processing
  the previous one, so detection never backs up. Both platforms are
  configured to emit NV21, so there's one image-conversion path instead of
  branching per OS.
- **`core/utils/angle_catalog.dart`**: a fixed, hardcoded map of which three
  landmarks form each named joint angle (e.g. `rightKnee` =
  rightHip-rightKnee-rightAnkle). This is anatomy, not configuration, so it
  lives in app code and is never sourced from the backend.
- **`AngleRule`** (`features/exercise/domain/entities/angle_rule.dart`): a
  threshold (`minAngle`/`maxAngle`) plus feedback messages for one named
  angle. This _is_ backend-driven data, physiotherapists tune these without
  an app release.
- **Evaluation** (`features/exercise/domain/angle_rule_evaluator.dart`):
  rules are checked short-circuit, in array order, so order = priority
  (e.g. injury-risk feedback outranks a "go deeper" prompt).
  `evaluateAngleRules` is a binary pass/fail used for rep-based up/down
  phases; `evaluateHoldRules` grades into three states (sesuai / kurang
  sesuai / tidak valid, with a small near-miss margin) for hold-based
  exercises, where "almost holding it" needs to read differently from "way
  off".
- **Trackers** (`rep_based_tracker.dart` / `duration_based_tracker.dart`):
  per-exercise state machines. `RepBasedTracker` counts a rep on the down
  -> up transition; `DurationBasedTracker` pauses, rather than resets, its
  hold timer on an invalid frame. Both track valid time vs. total time per
  frame, which becomes the session's accuracy score.

## Branches

- **`dev`** and **`main`** -> the full app: real backend, real authentication.
- **`release-demo`** -> a fully offline build with dummy data and no auth, meant to run standalone on a demo device without depending onthe backend being reachable.

## Getting started

### Prerequisites

- Flutter SDK `^3.12.2`
- Android Studio / Xcode set up for building to a physical device (the camera + pose detection flow doesn't work in a simulator/emulator)

### Setup

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Copy `.env.example` to `.env` and fill in the backend URL:

   ```bash
   cp .env.example .env
   ```

3. Run on a connected device:

   ```bash
   flutter run
   ```

### Regenerating code

This project uses Freezed/json_serializable for data models and Cubit
state. After changing an annotated class, regenerate the `.freezed.dart`
/`.g.dart` files:

```bash
dart run build_runner build --delete-conflicting-outputs
```
