import 'package:crm_flutter/data/models/user/user.dart';

class UserData {
  /// user info
  static int id = -1;
  static String name = '';
  static String phone = '';
  static String email = '';
  static String photo = '';
  static DateTime createdAt = DateTime.now();
  static DateTime emailVerifiedAt = DateTime.now();
  static DateTime updatedAt = DateTime.now();

  /// user role
  static int roleId = -1;
  static String roleName = '';
  static DateTime roleCreatedAt = DateTime.now();
  static DateTime roleUpdatedAt = DateTime.now();

  static void setUserData(User user) {
    id = user.id;
    name = user.name;
    phone = user.phone;
    email = user.email ?? '';
    photo = user.photo ?? '';
    createdAt = user.createdAt ?? DateTime.now();
    emailVerifiedAt = user.emailVerifiedAt ?? DateTime.now();
    updatedAt = user.updatedAt ?? DateTime.now();

    roleId = user.roleId;
    roleName = user.role.name;
    roleCreatedAt = user.role.createdAt ?? DateTime.now();
    roleUpdatedAt = user.role.updatedAt ?? DateTime.now();
  }
}
