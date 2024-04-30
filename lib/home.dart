import 'package:flutter/material.dart';
import 'package:poke_app/posts/favorites.dart';
import 'package:poke_app/posts/mypost_1.dart';
import 'package:poke_app/posts/mypost_2.dart';

class UserHomePage extends StatelessWidget {
  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [
          MyPost1(pokemonName: 'bulbasaur'), //mi pantalla 1
          MyPost2(pokemonName: 'charmeleon',), //mi pantalla 2
          // MyFavorites()
        ],
      ),

    );
  }
}