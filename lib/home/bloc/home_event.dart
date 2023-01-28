part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class MenuItemFetched extends HomeEvent {}

class MenuItemChanged extends HomeEvent {
  MenuItemChanged(this.id, this.newValue);

  final int id;
  final bool newValue;
}