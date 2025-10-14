import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String gtin;

  @HiveField(2)
  double price;

  @HiveField(3)
  bool isDeleted;

  @HiveField(4)
  DateTime createdAt;

  @HiveField(5)
  DateTime? updatedAt;

  @HiveField(6)
  String? imagePath;
  ProductModel({
    required this.name,
    required this.gtin,
    required this.price,
    this.isDeleted = false,
    required this.createdAt,
    this.updatedAt,
    this.imagePath,
  });
}
