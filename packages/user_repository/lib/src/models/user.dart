import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.given_name, this.family_name);

  final String id;
  final String given_name;
  final String family_name;

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'User{id: $id, given_name: $given_name, family_name: $family_name}';
  }

  static const empty = User('-', '-', '-');
}
