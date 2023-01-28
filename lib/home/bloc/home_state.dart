part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.menuItems = const <MenuItem>[],
  });

  final HomeStatus status;
  final List<MenuItem> menuItems;

  HomeState copyWith({
    HomeStatus? status,
    List<MenuItem>? menuItems,
  }) {
    return HomeState(
      status: status ?? this.status,
      menuItems: menuItems ?? this.menuItems,
    );
  }

  @override
  String toString() {
    return '''MenuState { status: $status, posts: ${menuItems.length} }''';
  }

  @override
  List<Object> get props => [status, menuItems];

}


