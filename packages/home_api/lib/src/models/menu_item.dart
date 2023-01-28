import 'package:equatable/equatable.dart';
import 'package:home_api/src/models/models.dart';

class MenuItem extends Equatable{
  final int id;
  final String name;
  bool isActive;
  final String imageAsset;
  final String webSite;

  MenuItem({required this.id, required this.name, required this.isActive, required this.imageAsset, required this.webSite});

  @override
  List<Object?> get props => [id];
}