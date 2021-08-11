import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';


///For showing assets images on the screen
class AssetImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Color color;

  const AssetImageWidget({this.image, this.height, this.width,this.color});

  @override
  Widget build(BuildContext context) {
    //Image.network('https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png', );
    return Image.asset(
      image,
      height: height,
      width: width,
      color: color!=null ? AppColors.black.withOpacity(0.5) : null,
    );
  }
}
