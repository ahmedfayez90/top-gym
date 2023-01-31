// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClientModel {
  String id;
  String name;
  int startTime;
  int endTime;
  int price;
  String section;
  String note;

  ClientModel({
    this.id = '',
    required this.name,
    required this.price,
    required this.startTime,
    required this.endTime,
    required this.section,
    required this.note,
  });

  ClientModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          price: json['price'],
          startTime: json['startTime'],
          endTime: json['endTime'],
          section: json['section'],
          note: json['note'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price':price,
      'startTime': startTime,
      'endTime': endTime,
      'section': section,
      'note': note,
    };
  }
}
