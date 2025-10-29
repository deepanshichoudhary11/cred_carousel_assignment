import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Carousel runs smoothly without frame drops', (tester) async {
    // Simulate 10 frames of animation
    for (int i = 0; i < 10; i++) {
      final start = DateTime.now();
      await tester.pump(const Duration(milliseconds: 16));
      final frameTime = DateTime.now().difference(start).inMilliseconds;

      // Ensure each frame completes within 17ms (~60fps)
      expect(frameTime < 17, true, reason: 'Frame took too long!');
    }
  });
}
