import 'package:flutter/material.dart';
import 'package:food_delivery_app/details_page/page/details_page.dart';
import 'package:food_delivery_app/homescreen/model/foods_model.dart';
import 'package:food_delivery_app/profile/page/profile_page.dart';
import 'package:food_delivery_app/recipes_creator/page/recipes_creator_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildBody() {
    switch (_selectedIndex) {
      case 0:
        return homeContent();
      case 1:
        return RecipesCreatorPage();
      case 2:
        return ProfilePage();
      default:
        return homeContent();
    }
  }

  final searchmenu = TextEditingController();
  int selectedCategoryIndex = 0;
  int _selectedIndex = 0;

  List categoryList = [
    "Fast Foods",
    "Salads",
    "Soups",
    "Chinese",
    "Italian",
    "Deserts",
    "Dinner",
  ];

  List<FoodsModel> deliveryfoods = [
    FoodsModel(
      name: 'Pizza',
      image: 'assets/pizza.png',
      cuisines: 'italian sauces',
      price: 578,
    ),
    FoodsModel(
      name: 'Momo',
      image: 'assets/momo.png',
      cuisines: 'Vegetable flavour',
      price: 000,
    ),
    FoodsModel(
      name: 'Sandwiches',
      image: 'assets/sandwiches.png',
      cuisines: 'yellow cream',
      price: 679,
    ),
    FoodsModel(
      name: 'Ice Cream',
      image: 'assets/ice-cream.png',
      cuisines: 'Vanilla cream & ice',
      price: 567,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(backgroundColor: Colors.amber),
          ),
        ],
      ),
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

  Widget homeContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Order Fresh &",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Tasty Food Now!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: searchmenu,
              decoration: InputDecoration(
                hintText: 'Search your foods',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          SizedBox(height: 25),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,

              itemBuilder: (context, index) {
                bool isSelected = index == selectedCategoryIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.orange,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        categoryList[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: deliveryfoods.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 35,
                mainAxisSpacing: 50,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                final food = deliveryfoods[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(food: food),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          food.image,
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          food.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          food.cuisines,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '₹${food.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
