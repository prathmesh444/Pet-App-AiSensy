import 'package:get_storage/get_storage.dart';

class Pet {
  String id;
  String name;
  int age;
  double price;
  bool adopted;
  String color;
  String breed;
  String image;
  DateTime adoptionDate;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.adopted,
    required this.color,
    required this.image,
    this.breed = '',
    required this.adoptionDate,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'price': price,
      'adopted': GetStorage().read(id) ?? adopted,
      'color': color,
      'breed': breed,
      "image": image,
      "adoptionDate": adoptionDate.toIso8601String(),
    };
  }

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      price: (json['price'] as num).toDouble(),
      adopted: GetStorage().hasData(json['id']),
      color: json['color'] as String,
      image: json['image'] as String,
      breed: json['breed'] as String? ?? '',
      adoptionDate: DateTime.parse(GetStorage().read(json['id']) ?? json['adoptionDate'] as String),
    );
  }

  @override
  String toString() {
    return '$id,$name,$age,$price,$adopted,$color,$breed,$image)';
  }
}
