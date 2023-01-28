import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.name, this.picture);

  final String id;
  final String name;
  final String picture;

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'User{id: $id, name: $name, picture: $picture}';
  }

  static const empty = User('-', '-', '-');
}
