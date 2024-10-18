import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkImageWidget extends StatelessWidget {
  String? imageUrl;
  double? imageWidth;
  double? imageHeight;
  NetworkImageWidget({
    super.key,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
  });

  final RegExp imageUrlRegExp =
      RegExp(r'^(https?:\/\/.*\.(?:png|jpg|jpeg|gif|svg|webp))$');

  bool isValidImageUrl(String? url) {
    // Use the regex pattern to validate the URL
    return imageUrlRegExp.hasMatch(url ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl != null
          ? (isValidImageUrl(imageUrl)
              ? imageUrl!
              : 'https://weadmin.figlab.co/storage/${imageUrl!}')
          : 'https://static.vecteezy.com/system/resources/thumbnails/003/715/503/small_2x/photo-icon-or-picture-icon-image-sign-and-symbol-vector.jpg',
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          'https://static.vecteezy.com/system/resources/thumbnails/003/715/503/small_2x/photo-icon-or-picture-icon-image-sign-and-symbol-vector.jpg',
          height: imageHeight ?? 116,
          width: imageWidth ?? Get.width,
          fit: BoxFit.cover,
        );
      },
      height: imageHeight ?? 116,
      width: imageWidth ?? Get.width,
      fit: BoxFit.cover,
    );
  }
}
