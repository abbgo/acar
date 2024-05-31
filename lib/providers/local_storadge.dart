import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

late SharedPreferences prefs;

final tokenProvider = createPrefProvider<String>(
  prefs: (_) => prefs,
  prefKey: "token",
  defaultValue: '',
);

final uuidProvider = createPrefProvider<String>(
  prefs: (_) => prefs,
  prefKey: "uuid",
  defaultValue: '2ab5ab63-b554-4015-bf11-fb9cef4c0ad0',
);
