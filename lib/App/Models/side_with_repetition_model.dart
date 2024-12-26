class SideWithRepetitionModel {
  final double sides;
  final double repetitionOnSide1;
  final double repetitionMultiplier;

  SideWithRepetitionModel({
    required this.sides,
    required this.repetitionOnSide1,
    required this.repetitionMultiplier,
  });

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      "sides": sides,
      "repetitionOnSide1": repetitionOnSide1,
      "repetitionMultiplier": repetitionMultiplier,
    };
  }
}
