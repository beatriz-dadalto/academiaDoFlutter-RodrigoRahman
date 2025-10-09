# provider_todo_list

Hands-on Provider e SQLite em arquitetura de modulo



## Local Firebase configuration (important for public repos)

This repository intentionally does NOT track `lib/firebase_options.dart` (it contains Firebase client keys).
If you're cloning this project, follow these steps to configure Firebase locally:

1. Open the Firebase Console: https://console.firebase.google.com
2. Select the project: `todo-list-provider-adf-8e882` (or your own project).
3. Go to Project Settings → Your apps → Android (or iOS) and register your app if needed.
4. Download the generated configuration files:
	- Android: `google-services.json` (place under `android/app/google-services.json`)
	- iOS: `GoogleService-Info.plist` (place under `ios/Runner/GoogleService-Info.plist`)
5. Optionally regenerate `lib/firebase_options.dart` using the FlutterFire CLI:
	- Install FlutterFire CLI: `dart pub global activate flutterfire_cli`
	- Run: `flutterfire configure --project=todo-list-provider-adf-8e882`

After these steps the app will be able to initialize Firebase locally.

Do not commit `google-services.json`, `GoogleService-Info.plist`, or `lib/firebase_options.dart` to a public repository. Share them via a secure channel if you need to distribute them to teammates.
