import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/carousel_provider.dart';
import '../widgets/carousel_card.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CarouselProvider>().loadCards("");
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CarouselProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("CRED Carousel"),
        backgroundColor: Colors.black,
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.cards.isEmpty
              ? const Center(
                  child: Text(
                    "No cards available",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: provider.cards.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double value = 1.0;
                        if (_pageController.position.haveDimensions) {
                          value = _pageController.page! - index;
                          value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
                        }
                        return Transform.scale(
                          scale: value,
                          child: Opacity(
                            opacity: value,
                            child: CarouselCard(card: provider.cards[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
