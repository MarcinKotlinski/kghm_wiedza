import 'package:home_api/home_api.dart';

class HomeRepository {
  Future<List<MenuItem>> getMenuItems() async{
    final activeMenuItems = HomeApi().menuItemsList.where((element) => element.isActive).toList();
    return activeMenuItems;
  }
}
