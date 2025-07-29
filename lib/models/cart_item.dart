class CartItem {
  final String name;
  final int quantity;

  CartItem({required this.name, required this.quantity});

  CartItem copyWith({String? name, int? quantity}) {
    return CartItem(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }
}
