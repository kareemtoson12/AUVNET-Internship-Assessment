import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String? email;

  @HiveField(1)
  final String? uid;

  @HiveField(2)
  final bool isLoggedIn;

  @HiveField(3)
  final DateTime? lastLoginTime;

  UserModel({
    this.email,
    this.uid,
    this.isLoggedIn = false,
    this.lastLoginTime,
  });

  UserModel copyWith({
    String? email,
    String? uid,
    bool? isLoggedIn,
    DateTime? lastLoginTime,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'uid': uid,
      'isLoggedIn': isLoggedIn,
      'lastLoginTime': lastLoginTime?.toIso8601String(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      uid: json['uid'],
      isLoggedIn: json['isLoggedIn'] ?? false,
      lastLoginTime:
          json['lastLoginTime'] != null
              ? DateTime.parse(json['lastLoginTime'])
              : null,
    );
  }
}
