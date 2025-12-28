import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('Lista do mercado', style: TextStyle(fontWeight: .bold)),
                  ElevatedButton(onPressed: () {}, child: Text('adicionar')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
