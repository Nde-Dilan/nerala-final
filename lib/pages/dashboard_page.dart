import 'package:flutter/material.dart';
import 'package:flutter_flashcards/notifiers/user_notifier.dart';
import 'home_page.dart';
import 'annecdotes.dart';
import 'revision.dart';
import 'chat_bot_page.dart';
import 'pie_chart_page.dart';
import 'stories_page.dart';
import 'package:provider/provider.dart';



class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final username = context.watch<UserNotifier>().name;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Implement your action for the alert button
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '10', // Example streak count
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Welcome, $username!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildGridButton(context, 'Flashcards', Icons.style, const HomePage()),
                  _buildGridButton(context, 'Statistics', Icons.pie_chart, const PieChartWidget()),
                  _buildGridButton(context, 'Annecdotes', Icons.book, const Annecdotes()),
                  _buildGridButton(context, 'Revision', Icons.repeat, const Revision()),
                  _buildGridButton(context, 'Chatbot', Icons.chat, const Chatbot()),
                  _buildGridButton(context, 'Stories', Icons.library_books, const Stories()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}