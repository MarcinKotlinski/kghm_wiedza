import 'package:home_api/home_api.dart';
import 'package:home_api/src/models/menu_item.dart';

class HomeApi {
  final List<MenuItem> _menuItems = [
    const MenuItem(
      id: 1,
      name: 'Oferty pracy',
      imageAsset: 'lib/assets/images/job.png',
    ),
    const MenuItem(
      id: 2,
      name: 'Informacje',
      imageAsset: 'lib/assets/images/info.png',
    ),
    const MenuItem(
      id: 3,
      name: 'Surowce',
      imageAsset: 'lib/assets/images/resources.png',
    ),
    const MenuItem(
      id: 3,
      name: 'Akcje',
      imageAsset: 'lib/assets/images/stock.png',
    ),
  ];

  List<MenuItem> get menuItemsList {
    return [..._menuItems];
  }
}

class MenuItemNotFoundException implements Exception {}


