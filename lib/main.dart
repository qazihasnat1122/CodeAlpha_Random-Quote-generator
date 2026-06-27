import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const RandomQuoteApp());
}

class RandomQuoteApp extends StatelessWidget {
  const RandomQuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto', // Default fallback, but modern typography overall
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          background: const Color(0xFFF8F9FA),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
