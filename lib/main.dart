import 'package:flutter/material.dart';
import 'package:poke_app/backup.dart';
import 'home.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';
import 'package:poke_app/posts/favorites.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PokemonList(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp ({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserHomePage(),
      theme: ThemeData(brightness: Brightness.dark)
    );
  }
}
