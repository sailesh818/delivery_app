import 'package:flutter/material.dart';
import 'package:food_delivery_app/homescreen/controller/page/food_provider.dart';
import 'package:food_delivery_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FoodProvider())],
      child: FoodDeliveryApp(),
    ),
  );
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: Approutes.routes);
  }
}
