import 'package:flutter/material.dart';

class LatihanDropdown extends StatefulWidget {
  const LatihanDropdown({super.key});

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<LatihanDropdown> createState() => _LatihanDropdownState();
}

class _LatihanDropdownState extends State<LatihanDropdown> {
  int _selectedIndex = 0;

  // Menghapus List statis dan menggunakan method untuk mendapatkan widget
  Widget _getSelectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return HomeWidget();
      case 1:
        return Text(
          'Index 1: Business',
          style: LatihanDropdown.optionStyle,
        );
      case 2:
        return Text(
          'Index 2: School',
          style: LatihanDropdown.optionStyle,
        );
      default:
        return Text(
          'Index 0: Home',
          style: LatihanDropdown.optionStyle,
        );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text('Bottom Navigation Bar Sample'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child:
            _getSelectedWidget(), // Menggunakan method untuk mendapatkan widget yang sesuai
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String? _selectedValue;

  final List<String> _options = <String>[
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Index 0: Home',
          style: LatihanDropdown.optionStyle,
        ),
        SizedBox(height: 20),
        DropdownButton<String>(
          hint: Text('Select an option'),
          value: _selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },
          items: _options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
