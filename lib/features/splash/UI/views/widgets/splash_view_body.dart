import 'package:bookly_app/core/utilities/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AssetsData.logo)));
  }
}
