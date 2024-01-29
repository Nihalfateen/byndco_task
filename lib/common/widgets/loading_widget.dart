import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/app_assets_roots.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      AppImages.loadingAnimations,
    ));
  }
}
