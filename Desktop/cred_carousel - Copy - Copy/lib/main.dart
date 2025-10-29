import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/carousel_provider.dart';
import 'screens/carousel_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarouselProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CarouselScreen(),
      ),
    );
  }
}
