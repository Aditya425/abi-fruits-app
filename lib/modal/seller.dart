class Seller {
  String seller;
  String product;
  String variety;
  int price;
  int avgWeight;
  int perBox;
  int boxes;
  String delivery;

  Seller({required this.seller, required this.product,
    required this.variety, required this.price, required this.avgWeight, required this.perBox, required this.boxes, required this.delivery});

  String toString() {
    return "Seller:${this.seller} Product:${this.product} Variety:${this.variety} Price:${this.price} "
        "AvgWeight:${this.avgWeight} PerBox:${this.perBox} Boxes:${this.boxes} Delivery:${this.delivery}";
  }
}