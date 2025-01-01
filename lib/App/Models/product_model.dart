class ProductModel {
  final String img;
  final String name;
  final String sku;
  final List<String> cat;
  final String desc;
  final double rate;
  final double incm;
  final bool inclTax;
  final double tax;
  final bool frmSup;

  ProductModel({
    required this.img,
    required this.name,
    required this.sku,
    required this.cat,
    required this.desc,
    required this.rate,
    required this.incm,
    required this.inclTax,
    required this.tax,
    required this.frmSup,
  });

  /// Convert JSON to ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      img: json['img'],
      name: json['name'],
      sku: json['sku'],
      cat: List<String>.from(json['cat']),
      desc: json['desc'],
      rate: (json['rate'] as num).toDouble(),
      incm: (json['incm'] as num).toDouble(),
      inclTax: json['inclTax'],
      tax: (json['tax'] as num).toDouble(),
      frmSup: json['frmSup'],
    );
  }

  /// Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'name': name,
      'sku': sku,
      'cat': cat,
      'desc': desc,
      'rate': rate,
      'incm': incm,
      'inclTax': inclTax,
      'tax': tax,
      'frmSup': frmSup,
    };
  }
}
