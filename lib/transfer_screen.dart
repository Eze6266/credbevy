// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:credbevy/Utilities/app_colors.dart';
import 'package:credbevy/Utilities/functions.dart';
import 'package:credbevy/Utilities/image_constants.dart';
import 'package:credbevy/Utilities/lazy_loader.dart';
import 'package:credbevy/Utilities/reusables.dart';
import 'package:credbevy/home_components.dart';
import 'package:credbevy/providers.dart';
import 'package:credbevy/show_toast.dart';
import 'package:credbevy/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  TextEditingController amount = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var myprov = Provider.of<MyProviders>(context);
    isLoading = Provider.of<MyProviders>(context).payIsLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColors.primaryColor,
        toolbarHeight: 0.001,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4 * size.width / 100),
        child: Column(
          children: [
            Height(h: 2),
            TopBarThing(
              anything: Image.asset(
                kImages.house,
                height: 4 * size.height / 100,
              ),
              tapIt: () {
                goBack(context);
              },
              size: size,
            ),
            Height(h: 3),
            Align(
              alignment: Alignment.centerLeft,
              child: kTxt(
                text: 'Current Balance',
                color: kColors.primaryColor,
                size: 16,
                weight: FontWeight.w500,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: kTxt(
                text: '\$${formatNumberWithCommas(myprov.balance)}',
                color: kColors.primaryColor,
                size: 22,
                weight: FontWeight.w700,
              ),
            ),
            Height(h: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GenBtnW(
                      img: kImages.fav1,
                      size: size,
                      width: 30,
                      height: 4,
                      btnColor: kColors.whiteColor,
                      borderColor: kColors.primaryColor,
                      borderRadius: 50,
                      btnText: 'Favorites',
                    ),
                    Width(w: 3),
                    GenBtnW(
                      img: kImages.fav2,
                      size: size,
                      width: 30,
                      height: 4,
                      btnColor: kColors.whiteColor,
                      borderColor: kColors.textGrey.withOpacity(0.3),
                      txtColor: kColors.textGrey.withOpacity(0.8),
                      borderRadius: 50,
                      btnText: 'All Friends',
                    ),
                  ],
                ),
                Image.asset(
                  kImages.add,
                  height: 3.5 * size.height / 100,
                ),
              ],
            ),
            Height(h: 2),
            SizedBox(
              height: 21 * size.height / 100,
              child: myprov.fetchBeneficiariiesisLoading
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 2 * size.width / 100),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 36 * size.width / 100,
                              height: 20 * size.height / 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kColors.whiteColor,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myprov.beneficiaries.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 2 * size.width / 100),
                          child: FavoriteBoxes(
                            index: index,
                            name: myprov.beneficiaries[index]['fullname']
                                .toString(),
                          ),
                        );
                      },
                    ),
            ),
            Height(h: 2),
            TitleTField(
              title: 'Name',
              radius: 10,
              hint: 'Walter White',
            ),
            Height(h: 1.5),
            TitleTField(
              title: 'Amount \$',
              radius: 10,
              keyType: TextInputType.number,
              hint: 'How much do you want to send?',
            ),
            Height(h: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GenBtn(
                  size: size,
                  width: 17,
                  height: 4,
                  btnColor: kColors.whiteColor,
                  borderRadius: 50,
                  textSize: 16,
                  borderColor: kColors.textGrey,
                  txtColor: kColors.textGrey,
                  btnText: '+ 10',
                ),
                Width(w: 2),
                GenBtn(
                  size: size,
                  width: 17,
                  height: 4,
                  btnColor: kColors.whiteColor,
                  borderRadius: 50,
                  textSize: 16,
                  borderColor: kColors.textGrey,
                  txtColor: kColors.textGrey,
                  btnText: '+ 100',
                ),
                Width(w: 2),
                GenBtn(
                  size: size,
                  width: 17,
                  height: 4,
                  btnColor: kColors.whiteColor,
                  borderRadius: 50,
                  textSize: 16,
                  borderColor: kColors.textGrey,
                  txtColor: kColors.textGrey,
                  btnText: '- 10',
                ),
              ],
            ),
            Height(h: 2),
            TitleTField(
              title: 'Reference',
              radius: 10,
              keyType: TextInputType.text,
              hint: 'What is the transfer for?',
            ),
            Height(h: 3),
            GenBtnW(
              img: kImages.icon1,
              size: size,
              width: 90,
              height: 6,
              isLoading: isLoading,
              btnColor: kColors.primaryColor,
              borderColor: kColors.primaryColor,
              txtColor: kColors.whiteColor,
              borderRadius: 15,
              btnText: 'Send Money',
              tap: () {
                myprov.pay(context: context).then((value) {
                  if (value == 'false') {
                    goTo(context, SuccessScreen());
                  } else {
                    showCustomErrorToast(
                        context, 'An error occurred try again');
                  }
                });
              },
            ),
            Height(h: 1),
          ],
        ),
      ),
    );
  }
}
