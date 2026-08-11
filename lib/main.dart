import 'package:fisiomate/app.dart';
import 'package:fisiomate/services/storage/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await HiveService.init();
  runApp(const App());
}
