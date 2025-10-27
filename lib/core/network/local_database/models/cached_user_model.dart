import 'package:hive/hive.dart';

part 'cached_user_model.g.dart';

@HiveType(typeId: 0)
class CachedUserModel extends HiveObject {
  @HiveField(0)
  String userId;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String email;
  CachedUserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}
