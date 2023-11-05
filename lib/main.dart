import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SpriteAnimationWidget bug',
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: SpriteAnimationWidget.asset(
                path: 'icons/ttgem_glowing.png',
                data: SpriteAnimationData.range(
                  start: 0,
                  end: 6,
                  amount: 7,
                  stepTimes: List.generate(
                    7,
                    (index) {
                      if (index == 6) {
                        return 0.9;
                      } else {
                        return 0.05;
                      }
                    },
                  ),
                  textureSize: Vector2(75, 90),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Page2()),
              ),
              child: const Text('Open page 2'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Flame.images.clearCache();
    super.dispose();
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: SpriteAnimationWidget.asset(
                path: 'icons/ttgem_glowing.png',
                data: SpriteAnimationData.range(
                  start: 0,
                  end: 6,
                  amount: 7,
                  stepTimes: List.generate(
                    7,
                    (index) {
                      if (index == 6) {
                        return 0.9;
                      } else {
                        return 0.05;
                      }
                    },
                  ),
                  textureSize: Vector2(75, 90),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Page1()),
              ),
              child: const Text('Back to page1'),
            ),
          ],
        ),
      ),
    );
  }
}
