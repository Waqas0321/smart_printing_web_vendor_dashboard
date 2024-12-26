class Thickness {
  final String basicLevel;
  final String mediumLevel;
  final String heavyLevel;

  Thickness({
    required this.basicLevel,
    required this.mediumLevel,
    required this.heavyLevel,
  });

  @override
  String toString() {
    return 'Thickness(basicLevel: $basicLevel, mediumLevel: $mediumLevel, heavyLevel: $heavyLevel)';
  }
}