class UserData {
  final String name;
  final String imageUrl;
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
  final String phoneNumber;

  UserData(
      {required this.phoneNumber,
      required this.imageUrl,
      required this.name,
      required this.uid,
      required this.email,
      required this.age,
      required this.country,
      required this.zipCode,
      required this.height,
      required this.weight,
      required this.male,
      required this.feMale,
      required this.isUser});

  factory UserData.fromMap(Map<String, dynamic> map, String documentId) {
    return UserData(
        phoneNumber: map['phoneNumber'],
        imageUrl: map['imageUrl'],
        name: map['name'],
        uid: documentId,
        email: map['email'] ?? '',
        age: map['age'],
        country: map['country'],
        height: map['height'],
        weight: map['weight'],
        feMale: map['feMale'],
        male: map['male'],
        zipCode: map['zipCode'],
        isUser: map['isUser']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
      'age': age,
      'country': country,
      'height': height,
      'weight': weight,
      'feMale': feMale,
      'male': male,
      'zipCode': zipCode,
      'isUser': isUser,
    };
  }
}
