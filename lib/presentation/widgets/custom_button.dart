import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final BoxBorder? border;
  final Function()? onTap;
  final FontWeight? fontWeight;
  final Widget? image;
  final double marginVertical;
  final double? textSize;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    this.buttonColor = const Color(0xFFEE4D2D),
    this.textColor = Colors.white,
    this.border,
    this.fontWeight,
    this.onTap,
    this.image,
    this.marginVertical = 10,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: marginVertical,
      ),
      height: height ?? 50,
      width: width ?? MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: buttonColor,
          border: border,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[800]!.withOpacity(0.8),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ]),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Row(
            mainAxisAlignment: image != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: image!,
                ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize ?? 16,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
