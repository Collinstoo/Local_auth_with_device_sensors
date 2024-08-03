import 'package:flutter/material.dart';
import 'local_authentication.dart'; // Import the new file

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Biometric Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('HOME PAGE'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FaceFingerPrintAuth()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade100,
            foregroundColor: Colors.black,
          ),
          child: const Text(
            'AUTHENTICATION',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
