part of '../pages.dart';

class MainMenuPage extends StatefulWidget {
  final User user;

  MainMenuPage(this.user);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  List<Widget> _widgetOptions(User user) {
    return <Widget>[
      HomePage(user),
      CalculatePage(user),
      FoodsPage(user),
      SchedulePage(user)
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = widget.user;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _widgetOptions(user).elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF52734D),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculate",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: "Foods",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
