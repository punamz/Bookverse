import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CircleImageWidget extends StatelessWidget {
  final double size;
  final String imageUrl;
  const CircleImageWidget({Key? key, required this.size, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: ExtendedImage.network(
        imageUrl,
        height: size,
        width: size,
        fit: BoxFit.cover,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return Shimmer.fromColors(
                baseColor: context.theme.colorScheme.surfaceVariant,
                highlightColor: context.theme.colorScheme.onSecondary,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                ),
              );
            case LoadState.failed:
              return Icon(Icons.image_not_supported_rounded, size: size);
            default:
              return null;
          }
        },
      ),
    );
  }
}
