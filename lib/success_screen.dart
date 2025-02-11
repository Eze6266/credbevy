// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:credbevy/Utilities/app_colors.dart';
import 'package:credbevy/Utilities/image_constants.dart';
import 'package:credbevy/Utilities/reusables.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColors.primaryColor,
        toolbarHeight: 0.001,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              kImages.check,
              height: 13 * size.height / 100,
            ),
          ),
          Height(h: 3),
          kTxt(
            text: '\$5,000',
            size: 26,
            weight: FontWeight.w700,
          ),
          Height(h: 1.5),
          kTxt(
            text:
                'Transfer successfully sent to Walter White.\nRef: The latest batch 99.5% pure',
            textalign: TextAlign.center,
            weight: FontWeight.w500,
            color: kColors.primaryColor,
          ),
        ],
      ),
      floatingActionButton: GenBtn(
        size: size,
        width: 90,
        height: 5.5,
        btnColor: kColors.primaryColor,
        borderColor: kColors.primaryColor,
        txtColor: kColors.whiteColor,
        borderRadius: 15,
        btnText: 'Back',
        tap: () {
          goBack(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
