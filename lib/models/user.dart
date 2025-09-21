// features/auth/data/models/user_model.dart
class UserModel {
  final String uid;
  final String email;

  UserModel({required this.uid, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> data, String userId) {
    return UserModel(uid: userId, email: data['email'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email};
  }
}
