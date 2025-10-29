class CarouselCardModel {
  final String title;
  final String subtitle;
  final String amount;
  final String logoUrl;
  final String footer;

  CarouselCardModel({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.logoUrl,
    required this.footer,
  });

  factory CarouselCardModel.fromJson(Map<String, dynamic> json) {
    final body = json["template_properties"]?["body"] ?? {};
    return CarouselCardModel(
      title: body["title"] ?? "",
      subtitle: body["sub_title"] ?? "",
      amount: body["payment_amount"] ?? "",
      logoUrl: body["logo"]?["url"] ?? "",
      footer: body["footer_text"] ?? "",
    );
  }
}
