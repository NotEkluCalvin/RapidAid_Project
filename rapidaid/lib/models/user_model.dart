class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? profilePhotoUrl;

  UserModel({this.uid, this.name, this.email, this.profilePhotoUrl});

  // Optional: Convert from Firestore document or JSON
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      profilePhotoUrl: map['profilePhotoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profilePhotoUrl': profilePhotoUrl,
    };
  }
}
