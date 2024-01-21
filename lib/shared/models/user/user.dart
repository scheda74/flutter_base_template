import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole {
  admin('admin'),
  basic('basic'),
  beta('beta');

  final String name;

  const UserRole(this.name);

  String toJson() => name.toLowerCase();
  static UserRole fromJson(String json) => values.byName(json);
}

/// A user model generated with [freezed](https://pub.dev/packages/freezed) and [json_serializable](https://pub.dev/packages/json_serializable).
/// Freezed and json_serializable will generate the boilerplate code for you.
/// Hence you can use these immutable models in your app. Use copyWith and other helper methods generated.
@freezed
class User with _$User {
  // const User._();
  const factory User({
    required String id,
    required String email,
    String? name,
    @Default(UserRole.basic) UserRole role,

    /// Use @CustomDateTimeConverter to convert DateTime with custom data types from and to json
    // @CustomDateTimeConverter required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// This is how you could use this model to convert from firestore
  // factory User.fromFirestore(
  //   DocumentSnapshot<Map<String, dynamic>> snapshot,
  //   SnapshotOptions? options,
  // ) {
  //   final data = snapshot.data();
  //   if (data == null) {
  //     throw Exception('User data null from firestore: ${snapshot.toString()}');
  //   }
  //   return _$UserFromJson(data);
  // }

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is User && runtimeType == other.runtimeType && id == other.id;

  // @override
  // int get hashCode => id.hashCode;
}
