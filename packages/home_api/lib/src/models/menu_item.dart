import 'package:equatable/equatable.dart';
import 'package:home_api/src/models/models.dart';

class MenuItem extends Equatable{
  final int id;
  final String name;
  final bool isActive;
  final String imageAsset;

  const MenuItem({required this.id, required this.name, this.isActive = true, required this.imageAsset});

  @override
  List<Object?> get props => [id];
}