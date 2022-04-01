import 'package:abi_fruits_app/screens/details_screen.dart';
import 'package:abi_fruits_app/screens/home_screen.dart';
import 'package:abi_fruits_app/screens/sort_screen.dart';
import 'package:abi_fruits_app/sort_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SortTypes>(
      create: (context) => SortTypes(),
      child: MaterialApp(
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          DetailsScreen.id: (context) => DetailsScreen()
        },
        initialRoute: HomeScreen.id,
      ),
    );
  }
}

