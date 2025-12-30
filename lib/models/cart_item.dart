class CartItem {
  CartItem(
    this.id,
    this.name,
    this.quantity,
    this.emoji,
    this.barCode,
    this.checked,
    this.createdAt,
  );

  int id;
  String name;
  String quantity;
  String emoji;
  String? barCode;
  bool checked;
  DateTime createdAt;
}
