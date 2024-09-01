import 'package:deez_notes/presentation/screens/home/home_screen.dart';
import 'package:deez_notes/util/common/constants.dart';
import 'package:deez_notes/util/common/strings.dart';
import 'package:deez_notes/util/theme/colors.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(splashDuration, () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            StringConstants.appName,
            style: AppTypography.headline1.copyWith(
              color: AppColors.white,
            ),
          ).animate().fadeIn(duration: animationDuration),
        ),
      ),
    );
  }
}
