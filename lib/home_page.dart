// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:credbevy/Utilities/app_colors.dart';
import 'package:credbevy/Utilities/image_constants.dart';
import 'package:credbevy/Utilities/lazy_loader.dart';
import 'package:credbevy/Utilities/reusables.dart';
import 'package:credbevy/home_components.dart';
import 'package:credbevy/providers.dart';
import 'package:credbevy/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var myprov = Provider.of<MyProviders>(context, listen: false);
      myprov.fetchUserCards(context: context);
      myprov.fetchUserTrxns(context: context);
      myprov.fetchUserBal(context: context);
      myprov.fetchBeneficiaries(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var myprov = Provider.of<MyProviders>(context);

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
              tapIt: () {},
              size: size,
            ),
            Height(h: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: kTxt(
                text: 'My Cards',
                weight: FontWeight.w700,
                size: 20,
              ),
            ),
            Height(h: 2),
            SizedBox(
              height: 20 * size.height / 100,
              child: myprov.fetchCardsisLoading
                  ? CardLoader()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myprov.cards.length,
                      itemBuilder: (context, index) {
                        var cards = myprov.cards[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 2 * size.width / 100),
                          child: CardsWidget(
                            name: cards['name'],
                            bank: cards['bank_name'],
                            number: cards['card_number'],
                            date: cards['expiry_date'],
                            color:
                                index == 0 ? kColors.dimPink : kColors.dimBlue,
                          ),
                        );
                      },
                    ),
            ),
            Height(h: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kTxt(
                  text: 'Transaction History',
                  size: 16,
                  weight: FontWeight.w600,
                ),
                Icon(
                  Icons.filter_list,
                  size: 26,
                ),
              ],
            ),
            Expanded(
              child: myprov.fetchTrxnsisLoading
                  ? TrxnLoader()
                  : ListView.builder(
                      itemCount: myprov.trxns.length,
                      itemBuilder: (context, index) {
                        var trxn = myprov.trxns[index];
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: 1.5 * size.height / 100),
                          child: TransactionTile(
                            index: index,
                            amount: trxn['amount_spent'].toString(),
                            month: trxn['month'].toString(),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GenBtnW(
            img: kImages.icon2,
            size: size,
            width: 40,
            height: 5.5,
            btnColor: kColors.whiteColor,
            borderColor: kColors.primaryColor,
            borderRadius: 15,
            btnText: 'Analytics',
          ),
          Width(w: 4),
          GenBtnW(
            img: kImages.icon1,
            size: size,
            width: 40,
            height: 5.5,
            btnColor: kColors.primaryColor,
            borderColor: kColors.primaryColor,
            txtColor: kColors.whiteColor,
            borderRadius: 15,
            btnText: 'Send Money',
            tap: () {
              goTo(context, TransferScreen());
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
