import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

/*To Do:
1. adding files to pubspec.
2. Setup firebase serices in gradle.

1 and 2 are completed user is able to login but screen is not going to homescreen.
 */