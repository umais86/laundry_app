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

  CartItem copyWith({
    String? name,
    int? quantity,
    double? price,
  }) {
    return CartItem(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      iconPath: iconPath,
      price: price ?? this.price, 
    );
  }
}
