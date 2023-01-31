class UserData {
  final String uid;
  final String email;
  final String age;
  final String country;
  final String zipCode;
  final String height;
  final String weight;
  final bool male;
  final bool feMale;
  final String isUser;

  UserData({
    required this.uid,
    required this.email,
    required this.age,
    required this.country,
    required this.zipCode,
    required this.height,
    required this.weight,
    required this.male,
    required this.feMale,
    required this.isUser
  });

  factory UserData.fromMap(Map<String, dynamic> map, String documentId) {
    return UserData(
      uid: documentId,
      email: map['email'] ?? '',
      age: map['age'],
      country: map['country'],
      height: map['height'],
      weight: map['weight'],
      feMale: map['feMale'],
      male: map['male'],
      zipCode: map['zipCode'],
      isUser: map['isUser']
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'age': age,
      'country': country,
      'height': height,
      'weight': weight,
      'feMale': feMale,
      'male': male,
      'zipCode': zipCode,
      'isUser':isUser,
    };
  }
}
