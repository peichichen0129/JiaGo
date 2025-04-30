import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static List<Restaurant> favorites = [];
  static Future<void> initFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int count = prefs.getInt('favorite_count') ?? 0;
    favorites = [];
    for (int i = 0; i < count; i++) {
      String name = prefs.getString('favorite_name_$i') ?? '';
      String details = prefs.getString('favorite_details_$i') ?? '';
      String imagePath = prefs.getString('favorite_imagePath_$i') ?? '';
      if (name.isNotEmpty && details.isNotEmpty && imagePath.isNotEmpty) {
        favorites.add(Restaurant(name: name, details: details, imagePath: imagePath));
      }
    }
  }

  static Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('favorite_count', favorites.length);
    for (int i = 0; i < favorites.length; i++) {
      await prefs.setString('favorite_name_$i', favorites[i].name);
      await prefs.setString('favorite_details_$i', favorites[i].details);
      await prefs.setString('favorite_imagePath_$i', favorites[i].imagePath);
    }
  }
}

class Restaurant {
  final String name;
  final String details;
  final String imagePath;

  Restaurant({required this.name, required this.details, required this.imagePath});
}