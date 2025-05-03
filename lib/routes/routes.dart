import 'package:flutter/material.dart';
//import 'package:food_delivery_app/details_page/page/details_page.dart';
import 'package:food_delivery_app/homescreen/page/home_page.dart';
import 'package:food_delivery_app/login/page/login_page.dart';
import 'package:food_delivery_app/navigation_bar/page/navigation_bar_page.dart';
import 'package:food_delivery_app/profile/page/profile_page.dart';
import 'package:food_delivery_app/recipes_creator/page/recipes_creator_page.dart';

class Approutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => NavigationBarPage(),
    "/Login": (context) => LoginPage(),
    "/home": (context) => HomePage(),
    "/profile": (context) => ProfilePage(),
    "/recipes": (context) => RecipesCreatorPage(),
    //"/FoodDetails": (context) => FoodDetailsPage(),
  };
}
