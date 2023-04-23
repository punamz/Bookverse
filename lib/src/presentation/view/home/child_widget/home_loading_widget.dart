import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemCount: 15,
          itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: context.theme.colorScheme.surfaceVariant,
            highlightColor: context.theme.colorScheme.onSecondary,
            child: Row(
              children: const [
                Expanded(child: _LoadingItem()),
                SizedBox(width: 10),
                Expanded(child: _LoadingItem()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingItem extends StatelessWidget {
  const _LoadingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const SizedBox(height: 50),
    );
  }
}
