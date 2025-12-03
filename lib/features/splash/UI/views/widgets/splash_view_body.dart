import 'package:bookly_app/constats.dart';
import 'package:bookly_app/features/home/UI/views/home_view.dart';
import 'package:bookly_app/features/splash/UI/views/widgets/animation_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> popUpAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    nanvigateHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedLogo(popUpAnimation: popUpAnimation),

          AnimatedText(
            animationController: animationController,
            fadeAnimation: fadeAnimation,
            slideAnimation: slideAnimation,
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    popUpAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.7), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.5, 1, curve: Curves.easeOut),
          ),
        );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );

    animationController.forward();
  }

  void nanvigateHome() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.fade,
        duration: kTransitionDuration,
      );
    });
  }
}
