class CartItem {
  final String name;
  final int quantity;
  final String iconPath;

  CartItem({
    required this.name,
    required this.quantity,
    required this.iconPath,
  });

  CartItem copyWith({String? name, int? quantity}) {
    return CartItem(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      iconPath: iconPath ?? this.iconPath,
    );
  }
}
