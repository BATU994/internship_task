class ProductEntity {
  final String name;
  final int gtin;
  final bool isActive;
  final int price;
  final String imageUrl;
  final String createdAt;
  final String changedAt;
  final String deletedAt;

  ProductEntity({required this.changedAt, required this.createdAt, required this.imageUrl, required this.deletedAt, required this.gtin, required this.isActive, required this.name, required this.price});
}