import 'package:flutter/material.dart';
import '../favorite.dart';
import 'restauranttitlestate.dart';

class favoritePage extends StatefulWidget {
  @override
  _favoritePageState createState() => _favoritePageState();
}

class _favoritePageState extends State<favoritePage> {
  @override
  void initState() {
    super.initState();
    Global.initFavorites().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏內容"),
        backgroundColor: Color(0xFFFFEDC0),
      ),
      body: ListView.builder(
        itemCount: Global.favorites.length,
        itemBuilder: (context, index) {
          final restaurant = Global.favorites[index];
          return RestaurantTile(
            name: restaurant.name,
            details: restaurant.details,
            imagePath: restaurant.imagePath,
          );
        },
      ),
    );
  }
}