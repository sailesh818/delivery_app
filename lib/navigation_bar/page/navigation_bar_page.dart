import 'package:flutter/material.dart';
import 'package:food_delivery_app/homescreen/page/home_page.dart';
import 'package:food_delivery_app/profile/page/profile_page.dart';
import 'package:food_delivery_app/recipes_creator/page/recipes_creator_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  Widget buildBody() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return RecipesCreatorPage();
      case 2:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
