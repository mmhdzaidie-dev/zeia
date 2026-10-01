# ZEIA Native Flutter

Native Flutter music player for ZEIA. This version does not use the ZEIA website and has no database yet.

## Current architecture

- Native Flutter UI
- Native audio playback with `just_audio`
- Android background playback through `audio_service`
- iOS background audio capability
- Windows/macOS native Flutter targets
- Temporary local catalog only
- Repository layer ready to be replaced by ZEIA API/database later
- No WebView
- No dependency on `zeia.zdv.web.id`

## GitHub build

Upload this repository to GitHub and push to `main`. GitHub Actions builds Android APK, Windows ZIP, macOS ZIP, and an unsigned iOS archive.

The iOS archive is unsigned because Apple signing/provisioning is required for normal device installation or App Store/TestFlight distribution.

The `android/`, `ios/`, `macos/`, and `windows/` folders are intentionally present in the ZIP structure; CI generates the official Flutter platform files with `flutter create` so the repository does not depend on a Flutter SDK being installed on the upload device.

## Later database integration

Replace `lib/data/repositories/local_repository.dart` with an API-backed repository. The UI and player layers do not need to become WebView-based.
