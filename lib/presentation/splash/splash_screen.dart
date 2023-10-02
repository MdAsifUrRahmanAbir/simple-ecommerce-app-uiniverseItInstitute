import 'package:flutter/material.dart';
import 'package:splash_view/splash_view.dart';

import '../../utils/assets_path.dart';
import '../../utils/strings.dart';
import '../common_widget/loading_widget.dart';
import '../login/login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      backgroundImageDecoration: BackgroundImageDecoration(
        image: AssetImage(Assets.splashBg),
      ),
      title: Text(Strings.appName),
      loadingIndicator: const CustomLoadingWidget(),
      done: Done(const LoginScreen()),
    );
  }
}