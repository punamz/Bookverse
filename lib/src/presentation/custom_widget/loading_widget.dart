import 'package:bookverse/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final bool canDismiss;
  const LoadingWidget({Key? key, this.canDismiss = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return canDismiss;
      },
      child: Lottie.asset(AnimationAssets.loading, height: 200),
    );
  }
}
