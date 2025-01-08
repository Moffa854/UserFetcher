import 'package:equatable/equatable.dart';

class DatingEntity extends Equatable {
  final String name;
  final int age;
  final String picture;
  final String location;
  final String distance;
  final DateTime date;
  final String type;

  const DatingEntity({
    required this.name,
    required this.age,
    required this.picture,
    required this.location,
    required this.distance,
    required this.date,
    required this.type,
  });

  @override
  List<Object?> get props => [name, age, picture, location, distance, date, type];
}
