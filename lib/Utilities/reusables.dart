import 'dart:math';

import 'package:credbevy/Utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void goTo(BuildContext context, Widget screen) {
  final random = Random();
  final animations = [
    _fadeTransition,
    _scaleTransition,
  ];
  final randomAnimation = animations[random.nextInt(animations.length)];

  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration:
          const Duration(milliseconds: 700), // Adjust duration for emphasis
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: randomAnimation,
    ),
  );
}

Widget _fadeTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
    child: child,
  );
}

Widget _scaleTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const begin = 0.0;
  const end = 1.0;
  const curve = Curves.easeInOutBack;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var scaleAnimation = animation.drive(tween);

  return ScaleTransition(
    scale: scaleAnimation,
    child: child,
  );
}

// Define the goback function
void goBack(BuildContext context) {
  Navigator.pop(context);
}

class Height extends StatelessWidget {
  Height({
    super.key,
    required this.h,
  });
  double h;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(height: h * size.height / 100);
  }
}

class Width extends StatelessWidget {
  Width({
    super.key,
    required this.w,
  });
  double w;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(width: w * size.width / 100);
  }
}

class kTxt extends StatelessWidget {
  kTxt(
      {super.key,
      this.color,
      this.size,
      required this.text,
      this.weight,
      this.textalign,
      this.letterSpace,
      this.maxLine,
      this.softRap,
      s});
  String text;
  Color? color;
  double? size, letterSpace;
  TextAlign? textalign;
  FontWeight? weight;
  int? maxLine;
  bool? softRap;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: color ?? kColors.blackColor,
          fontSize: size ?? 14.0,
          fontWeight: weight ?? FontWeight.w400,
          decoration: TextDecoration.none,
          letterSpacing: letterSpace ?? 0,
        ),
      ),
      textAlign: textalign ?? TextAlign.left,
      softWrap: softRap ?? false,
      maxLines: maxLine ?? null,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class GenBtn extends StatelessWidget {
  GenBtn({
    super.key,
    required this.size,
    required this.width,
    required this.height,
    required this.btnColor,
    this.textSize,
    this.borderColor,
    this.txtColor,
    required this.btnText,
    this.txtWeight,
    this.tap,
    this.borderRadius,
    this.isLoading,
  });

  final Size size;
  double? textSize, borderRadius;
  double width;
  double height;
  Color? btnColor, txtColor, borderColor;
  String btnText;
  FontWeight? txtWeight;
  Function()? tap;
  bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap ?? () {},
      child: Container(
        height: height * size.height / 100,
        width: width * size.width / 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: btnColor ?? kColors.whiteColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: isLoading ?? false
            ? Center(
                child: SizedBox(
                  height: 2 * size.height / 100,
                  width: 4 * size.width / 100,
                  child: CircularProgressIndicator(
                    color: kColors.whiteColor,
                  ),
                ),
              )
            : Center(
                child: kTxt(
                  text: btnText,
                  size: textSize ?? 14,
                  weight: txtWeight ?? FontWeight.w600,
                  color: txtColor ?? kColors.blackColor,
                ),
              ),
      ),
    );
  }
}

class GenBtnW extends StatelessWidget {
  GenBtnW({
    super.key,
    required this.size,
    required this.width,
    required this.height,
    required this.btnColor,
    this.textSize,
    this.borderColor,
    this.txtColor,
    required this.btnText,
    this.txtWeight,
    this.tap,
    this.borderRadius,
    this.isLoading,
    required this.img,
  });

  final Size size;
  double? textSize, borderRadius;
  double width;
  double height;
  Color? btnColor, txtColor, borderColor;
  String btnText, img;
  FontWeight? txtWeight;
  Function()? tap;
  bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap ?? () {},
      child: Container(
        height: height * size.height / 100,
        width: width * size.width / 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: btnColor ?? kColors.whiteColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: isLoading ?? false
            ? Center(
                child: SizedBox(
                  height: 2 * size.height / 100,
                  width: 4 * size.width / 100,
                  child: CircularProgressIndicator(
                    color: kColors.whiteColor,
                  ),
                ),
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(img),
                    Width(w: 2),
                    kTxt(
                      text: btnText,
                      size: textSize ?? 14,
                      weight: txtWeight ?? FontWeight.w600,
                      color: txtColor ?? kColors.blackColor,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class TitleTField extends StatelessWidget {
  TitleTField({
    super.key,
    required this.hint,
    this.hasTitle,
    this.height,
    this.radius,
    this.title,
    this.width,
    this.keyType,
    this.suffixIcon,
    this.elevated,
    this.obscure,
    this.fillColor,
    this.maxLine,
    this.controller,
    this.isLoading,
    this.onChanged,
    this.inputFormatters,
    this.important,
  });
  String? title, hint;
  bool? hasTitle, elevated, obscure, isLoading, important;
  double? height, width, radius;
  int? maxLine;
  TextInputType? keyType;
  Widget? suffixIcon;
  Color? fillColor;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? 90 * size.width / 100,
      child: Column(
        children: [
          hasTitle ?? true
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      kTxt(
                        text: title ?? '',
                        weight: FontWeight.w600,
                        size: 13,
                        color: kColors.blackColor.withOpacity(0.8),
                      ),
                      important ?? false
                          ? kTxt(
                              text: ' *',
                              color: kColors.red,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                )
              : SizedBox.shrink(),
          hasTitle ?? true ? Height(h: 0.3) : SizedBox.shrink(),
          SizedBox(
            height: height ?? 7 * size.height / 100,
            child: TextField(
              showCursor: true,
              cursorRadius: Radius.zero,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              style: TextStyle(
                fontSize: 12,
              ),
              controller: controller,
              maxLines: maxLine ?? 1,
              keyboardType: keyType ?? TextInputType.text,
              obscureText: obscure ?? false ? true : false,
              obscuringCharacter: '*',
              cursorColor: kColors.blackColor,
              readOnly: isLoading ?? false ? true : false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 2 * size.width / 100),
                filled: true,
                fillColor: fillColor ?? kColors.whiteColor,
                hintText: '$hint',
                hintStyle: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: kColors.textGrey.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
                suffixIcon: suffixIcon ?? SizedBox.shrink(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 5),
                  borderSide: BorderSide(
                    color: kColors.textGrey,
                    width: 0.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 5),
                  borderSide: BorderSide(
                    color: kColors.textGrey,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 5),
                  borderSide: BorderSide(
                    color: kColors.textGrey,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
