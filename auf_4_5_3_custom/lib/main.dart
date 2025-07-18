import 'package:flutter/material.dart';
import 'travel_home_page.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  int _currentPageIndex = 0;

  // الصفحات التي سيتم التبديل بينها
  final List<Widget> _pages = const [
    TravelHomePage(),
    Center(child: Text("🔍 Suche Seite", style: TextStyle(fontSize: 24))),
    Center(child: Text("👤 Profil Seite", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Travel Picks")),
        body: _pages[_currentPageIndex], // نعرض الصفحة المختارة هنا
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex, // ضروري لتحديث الواجهة
          onTap: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Suche"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          ],
        ),
      ),
    );
  }
}