import 'package:flutter/material.dart';

class LatihanTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Jumlah tab
        child: Scaffold(
          appBar: AppBar(
            title: Text('Contoh TabBar'),
            backgroundColor: Colors.blue,
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ), // Icon
                    text: 'Home'),
                Tab(icon: Icon(Icons.person), text: 'Person'),
                Tab(icon: Icon(Icons.settings), text: 'Setting'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Konten Tab 1')),
              Center(child: Text('Konten Tab 2')),
              Center(child: Text('Konten Tab 3')),
            ],
          ),
        ),
      ),
    );
  }
}
