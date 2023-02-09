import 'package:equatable/equatable.dart';

class Food extends Equatable {
  const Food({
    required this.name,
    required this.image,
    required this.desc,
  });

  final String name;
  final String image;
  final String desc;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        name: json["name"],
        image: json["image"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "desc": desc,
      };

  @override
  List<Object?> get props => [name];
}
