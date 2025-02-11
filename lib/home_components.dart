// ignore_for_file: prefer_const_constructors

import 'package:credbevy/Utilities/app_colors.dart';
import 'package:credbevy/Utilities/functions.dart';
import 'package:credbevy/Utilities/image_constants.dart';
import 'package:credbevy/Utilities/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBarThing extends StatelessWidget {
  TopBarThing({
    super.key,
    required this.size,
    this.anything,
    required this.tapIt,
  });

  final Size size;
  Widget? anything;
  Function() tapIt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: tapIt,
          child: anything ??
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 4 * size.height / 100,
                  width: 8.8 * size.width / 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage(kImages.image2),
                    ),
                  ),
                ),
              ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 4 * size.height / 100,
            width: 8.8 * size.width / 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: AssetImage(kImages.image1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardsWidget extends StatelessWidget {
  CardsWidget({
    super.key,
    required this.bank,
    required this.date,
    required this.name,
    required this.number,
    required this.color,
  });
  String number, name, date, bank;
  Color color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 19 * size.height / 100,
      width: 75 * size.width / 100,
      padding: EdgeInsets.symmetric(
        horizontal: 4.5 * size.width / 100,
        vertical: 2 * size.height / 100,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kTxt(
                text: '$bank',
                color: kColors.whiteColor,
                size: 14,
                weight: FontWeight.w500,
              ),
              Image.asset(
                kImages.master,
                height: 2.8 * size.height / 100,
              ),
            ],
          ),
          Height(h: 2),
          Align(
            alignment: Alignment.centerLeft,
            child: kTxt(
              text: '$number',
              size: 16,
              color: kColors.whiteColor,
            ),
          ),
          Height(h: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kTxt(
                    text: 'Name',
                    size: 10,
                    color: kColors.whiteColor,
                  ),
                  kTxt(
                    text: '$name',
                    size: 12,
                    weight: FontWeight.w500,
                    color: kColors.whiteColor,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kTxt(
                    text: 'Expiry',
                    size: 10,
                    color: kColors.whiteColor,
                  ),
                  kTxt(
                    text: '$date',
                    size: 12,
                    weight: FontWeight.w500,
                    color: kColors.whiteColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  TransactionTile({
    super.key,
    required this.amount,
    required this.month,
    required this.index,
  });
  String amount, month;
  int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      borderRadius: BorderRadius.circular(18),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3 * size.width / 100,
          vertical: 0.5 * size.height / 100,
        ),
        height: 10 * size.height / 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: kColors.textGrey.withOpacity(0.1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  index == 0
                      ? kImages.uber
                      : index == 1
                          ? kImages.spotify
                          : index == 2
                              ? kImages.netflix
                              : kImages.uber,
                  height: 4 * size.height / 100,
                ),
                Width(w: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    kTxt(
                      text: index == 0
                          ? 'Uber Ride'
                          : index == 1
                              ? 'Spotify Subscription'
                              : index == 2
                                  ? 'Netflix Account'
                                  : 'Uber Ride',
                      size: 15,
                      weight: FontWeight.w600,
                    ),
                    Height(h: 0.4),
                    kTxt(
                      text: '$month - 12:00pm',
                      size: 12,
                      weight: FontWeight.w500,
                      color: kColors.textGrey.withOpacity(0.8),
                    ),
                  ],
                ),
              ],
            ),
            kTxt(
              text: '-\$${formatNumberWithCommas(amount)}',
              size: 15,
              weight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteBoxes extends StatelessWidget {
  FavoriteBoxes({
    super.key,
    required this.name,
    required this.index,
  });
  String name;
  int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 20 * size.height / 100,
      width: 36 * size.width / 100,
      padding: EdgeInsets.symmetric(
        vertical: 0.2 * size.height / 100,
        horizontal: 2 * size.width / 100,
      ),
      decoration: BoxDecoration(
        color: index == 0 ? kColors.primaryColor : kColors.whiteColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kColors.primaryColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 6 * size.height / 100,
              width: 12.5 * size.width / 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(kImages.image1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Height(h: 2),
          SizedBox(
            width: 30 * size.width / 100,
            child: kTxt(
              text: '$name',
              color: index == 0 ? kColors.whiteColor : kColors.primaryColor,
              size: 14,
              weight: FontWeight.w500,
              textalign: TextAlign.center,
              maxLine: 1,
            ),
          ),
          Height(h: 1),
          SvgPicture.asset(
            kImages.fav1,
            color: index == 0 ? kColors.whiteColor : kColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
