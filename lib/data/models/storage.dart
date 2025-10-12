import 'package:hive/hive.dart';

part 'storage.g.dart';

@HiveType(typeId: 1)
class StockModel extends HiveObject {
  @HiveField(0)
  String warehouse;

  @HiveField(1)
  String gtin;

  @HiveField(2)
  int quantity;

  StockModel({
    required this.warehouse,
    required this.gtin,
    required this.quantity,
  });
}
