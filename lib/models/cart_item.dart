class CartItem {
  final String name;
  final int quantity;
  final String iconPath;
  final double price;

  CartItem({
    required this.name,
    required this.quantity,
    required this.iconPath,
    required this.price,
  });

  CartItem copyWith({int? quantity, required double price}) {
    return CartItem(
      name: name,
      iconPath: iconPath,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}
