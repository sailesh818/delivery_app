import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/routes.dart';

void main() {
  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: Approutes.routes);
  }
}
