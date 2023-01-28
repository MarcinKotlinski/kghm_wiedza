import 'package:home_api/home_api.dart';
import 'package:home_api/src/models/menu_item.dart';

class HomeApi {
  final List<MenuItem> _menuItems = [
    MenuItem(
      id: 1,
      isActive: true,
      name: 'Oferty pracy',
      imageAsset: 'lib/assets/images/job.png',
      webSite: 'https://rekrutacja.kghm.com/Recruitment'
    ),
    MenuItem(
      id: 2,
      isActive: true,
      name: 'Informacje',
      imageAsset: 'lib/assets/images/info.png',
      webSite: 'https://media.kghm.com/pl/informacje-prasowe'
    ),
    MenuItem(
      id: 3,
      isActive: true,
      name: 'Surowce',
      imageAsset: 'lib/assets/images/resources.png',
      webSite: 'https://www.money.pl/gielda/surowce/dane,miedz.html'
    ),
    MenuItem(
      id: 4,
      isActive: true,
      name: 'Akcje',
      imageAsset: 'lib/assets/images/stock.png',
      webSite: 'https://www.money.pl/gielda/spolki-gpw/plkghm000017.html'
    ),
  ];

  List<MenuItem> get menuItemsList {
    return [..._menuItems];
  }
}

class MenuItemNotFoundException implements Exception {}


