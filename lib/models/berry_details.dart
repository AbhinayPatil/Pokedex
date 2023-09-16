class BerryDetails {
  int id;
  String effect;
  List<String> flavors = [];
  String firmness;
  int growthTime;
  int naturalGiftPower;
  String naturalGiftType;
  String category;
  int cost;

  BerryDetails({
    required this.category,
    required this.cost,
    required this.effect,
    required this.firmness,
    required this.flavors,
    required this.growthTime,
    required this.id,
    required this.naturalGiftPower,
    required this.naturalGiftType,
  });
}
