class PackageModel {
  String imageUrl;
  String title;
  String shortDesc;
  String price;
  String identifier;
  String content;
  String? tanggal;
  String? bayar;

  PackageModel(
      {required this.imageUrl,
      required this.title,
      required this.shortDesc,
      required this.price,
      required this.identifier,
      required this.content,
      this.tanggal,
      this.bayar = 'Ovo'});
}