import 'package:characters_app/screens/home/home.dart';
import 'package:characters_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: Home()
  ));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sandbox"),
        backgroundColor: Colors.grey,
      ),
      body: const Text("sandbox")
    );
  }
}



