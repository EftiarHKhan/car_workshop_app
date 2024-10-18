import 'package:car_workshop_app/app/core/loaders/theme_loader.dart';
import 'package:flutter/material.dart';

import 'color_loader_2.dart';
import 'color_loader_5.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F2FF).withOpacity(.8),
        body: const Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ThemeLoader(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
