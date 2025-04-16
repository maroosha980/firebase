import 'package:flutter/material.dart';
import 'package:qr_project/qr_generator.dart';
import 'package:qr_project/qr_scanner.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter QR Code App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/QRCodeGenerator': (context) => const QRCodeGeneratorScreen(),
        '/QRCodeScanner': (context) => const QRCodeScanner(),
      },
    );
  }
}
