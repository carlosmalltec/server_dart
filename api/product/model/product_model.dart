import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? name;
  final List<String>? tags;

  ProductModel({this.id, this.name, this.tags});

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {"id": id, "name": name};

  @override
  List<Object?> get props => [id, name, tags];
}
