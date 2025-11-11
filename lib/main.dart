import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SelectCardsPage(),
    );
  }
}

class SelectCardsPage extends StatefulWidget {
  const SelectCardsPage({super.key});

  @override
  State<SelectCardsPage> createState() => _SelectCardsPageState();
}

class _SelectCardsPageState extends State<SelectCardsPage> {
  final List<String> deck = ['♠', '♥', '♦', '♣', '🃏'];
  final Random rng = Random();

  List<String> cards = ['?', '?', '?'];
  String message = 'Tap Select Cards';

  void selectCards() {
    List<String> picked = List.generate(
      3,
      (_) => deck[rng.nextInt(deck.length)],
    );

    setState(() {
      cards = picked;
      message = picked.contains('🃏')
          ? 'Joker is there!'
          : 'No Joker';
    });
  }

  void reset() {
    setState(() {
      cards = ['?', '?', '?'];
      message = 'Tap Select Cards';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFB73A3A),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: cards
                    .map(
                      (c) => Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          c,
                          style: const TextStyle(fontSize: 60),
                        ),
                      ),
                    )
                    .toList(),
              ),

              const SizedBox(height: 20),

              Text(
                message,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: selectCards,
                child: const Text("Select Cards"),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: reset,
                child: const Text("Reset"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
