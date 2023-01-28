import 'package:home_api/home_api.dart';

class HomeRepository {
  Future<List<MenuItem>> getMenuItems() async{
    final activeMenuItems = HomeApi().menuItemsList.where((element) => element.isActive).toList();
    return activeMenuItems;
  }

  void setNewValue(int id, bool newValue) async{
    var element = HomeApi().menuItemsList.firstWhere((element) => element.id == id);
    print(element.name);
    element.isActive = newValue;
    print(element.isActive);
  }
}
