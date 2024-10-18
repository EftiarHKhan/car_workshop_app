import 'package:flutter/material.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/elevated_container.dart';

class ThemeLoader extends StatelessWidget {
  const ThemeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xFF336F4A),
      ),
    );
  }
}
