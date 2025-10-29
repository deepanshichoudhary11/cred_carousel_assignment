import 'package:flutter/material.dart';
import '../models/carousel_card_model.dart';

class CarouselProvider extends ChangeNotifier {
  List<CarouselCardModel> _cards = [];
  bool _isLoading = false;

  List<CarouselCardModel> get cards => _cards;
  bool get isLoading => _isLoading;

  /// Load mock cards locally (no internet needed)
  Future<void> loadCards(String url) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // simulate network delay

    _cards = [
      CarouselCardModel(
        title: "HDFC Bank",
        subtitle: "XXXX XXXX 6582",
        amount: "₹45,000",
        logoUrl: "https://dg1qgqhnfu4m2.cloudfront.net/heartbeat/aa501250a12c11ec9ffdcf8085fda1bd.png",
        footer: "due today",
      ),
      CarouselCardModel(
        title: "VIL Postpaid",
        subtitle: "Miss Blake Murazik",
        amount: "₹200",
        logoUrl: "https://d23irbddtnqndj.cloudfront.net/assets/biller/VODA00000NAT96.gif",
        footer: "due today",
      ),
      CarouselCardModel(
        title: "CRED EMI",
        subtitle: "Payment #2331",
        amount: "₹7,500",
        logoUrl: "https://assets.dreamplug.in/octapaul/heartbeat/de0d37b0a85811edb942dd1d2dcae4c2.png",
        footer: "auto-pay scheduled",
      ),
      CarouselCardModel(
        title: "Axis Bank Credit",
        subtitle: "XXXX XXXX 8321",
        amount: "₹10,000",
        logoUrl: "https://d1sofudel0ufia.cloudfront.net/fabrik/nba/0424f010a50211ecab1fc5eccc1abf56.png",
        footer: "due in 2 days",
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }
}
