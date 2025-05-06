import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<Map<String, dynamic>> cards = [
    {'id': 'C0', 'value': 1, 'suit': 0},
    {'id': 'C1', 'value': 2, 'suit': 0},
    {'id': 'C2', 'value': 3, 'suit': 0},
    {'id': 'C7', 'value': 4, 'suit': 0},
    {'id': 'C3', 'value': 5, 'suit': 0},
    {'id': 'C6', 'value': 6, 'suit': 0},
    {'id': 'C5', 'value': 7, 'suit': 0},
    {'id': 'C4', 'value': 8, 'suit': 0},
  ];

  final List<String> suits = ['♦', '♥', '♠', '♣'];

  void changeSuit(String id) {
    setState(() {
      final index = cards.indexWhere((card) => card['id'] == id);
      cards[index]['suit'] = (cards[index]['suit'] + 1) % 4;
    });
  }

  void increaseValues() {
    setState(() {
      for (var card in cards) {
        card['value'] = card['value'] == 1 ? 7 : card['value'] + 1;
      }
    });
  }

  Map<String, dynamic> getCardById(String id) {
    return cards.firstWhere((card) => card['id'] == id);
  }

  Widget buildCard(String id, Brightness brightness) {
    final card = getCardById(id);
    final isDark = brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => changeSuit(id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 80,
        height: 80,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  isDark
                      ? Colors.black.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '${card['value']} ${suits[card['suit']]}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildActionCard(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    return GestureDetector(
      onTap: increaseValues,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 80,
        height: 80,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  isDark
                      ? Colors.black.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCard("C0", brightness),
                buildCard("C1", brightness),
                buildCard("C2", brightness),
              ],
            ),
            // Middle row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCard("C7", brightness),
                buildActionCard(brightness),
                buildCard("C3", brightness),
              ],
            ),
            // Bottom row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCard("C6", brightness),
                buildCard("C5", brightness),
                buildCard("C4", brightness),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
