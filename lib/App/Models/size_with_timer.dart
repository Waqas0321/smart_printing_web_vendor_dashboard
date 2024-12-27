class SizeWithTimer {
  final double length;
  final double width;
  final double height;
  final String measurement;

  SizeWithTimer({
    required this.length,
    required this.width,
    required this.height,
    required this.measurement,
  });

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'width': width,
      'height': height,
      'measurement': measurement,
    };
  }
}
