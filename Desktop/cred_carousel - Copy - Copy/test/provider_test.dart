import 'package:flutter_test/flutter_test.dart';
import 'package:cred_carousel/providers/carousel_provider.dart';

void main() {
  group('CarouselProvider Tests', () {
    test('loads local mock cards successfully', () async {
      final provider = CarouselProvider();

      // initially empty
      expect(provider.cards.isEmpty, true);
      expect(provider.isLoading, false);

      // load mock cards (simulated)
      await provider.loadCards('');

      // verify mock data loaded
      expect(provider.cards.isNotEmpty, true);
      expect(provider.cards.length, greaterThanOrEqualTo(3));
      expect(provider.cards.first.title, isNotEmpty);
      expect(provider.cards.first.amount, contains('₹'));

      // check loading flag reset
      expect(provider.isLoading, false);
    });
  });
}
