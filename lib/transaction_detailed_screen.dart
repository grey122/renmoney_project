import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renmoney_project/color_const.dart';
import 'package:renmoney_project/helper/dateConverte.dart';
import 'package:renmoney_project/modules/transaction.dart';
import 'package:renmoney_project/utils.dart';

const SystemUiOverlayStyle lightTaskBar = SystemUiOverlayStyle(
  statusBarColor: ColorsConst.transactionDetailsBG,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);

class TransactionDetailed extends StatelessWidget {
  const TransactionDetailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Transaction transaction = Get.arguments;

    return Scaffold(
      backgroundColor: ColorsConst.transactionDetailsBG,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        backgroundColor: ColorsConst.transactionDetailsBG,
        systemOverlayStyle: lightTaskBar,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transaction details",
              style: TextStyle(
                fontFamily: 'product-sans',
                fontWeight: FontWeight.w700,
                color: ColorsConst.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TransactionDetailedContainer(
              amount: transaction.amount.toString(),
              date: convertDateFromString(transaction.entryDate),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionDetailedContainer extends StatelessWidget {
  const TransactionDetailedContainer({
    Key? key,
    required this.amount,
    required this.date,
  }) : super(key: key);

  final String amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 354,
      width: width(context),
      padding: const EdgeInsets.fromLTRB(16, 36, 37, 37),
      decoration: BoxDecoration(
        color: ColorsConst.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Detailed summary of transaction",
            style: TextStyle(
              fontFamily: 'product-sans',
              color: ColorsConst.primary,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const TrasactionDoc(
            tittle: "Recepient",
            subTittle: "John",
          ),
          TrasactionDoc(
            tittle: "Amount",
            subTittle: "₦ $amount",
          ),
          TrasactionDoc(
            tittle: "Transaction date",
            subTittle: date,
          ),
          const TrasactionDoc(
            tittle: "Reference",
            subTittle: "0001111AXDRfrqy",
          ),
          const TrasactionDoc(
            tittle: "Status",
            subTittle: "Successful",
          ),
        ],
      ),
    );
  }
}

class TrasactionDoc extends StatelessWidget {
  const TrasactionDoc({
    Key? key,
    required this.tittle,
    required this.subTittle,
  }) : super(key: key);

  final String tittle;
  final String subTittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tittle,
            style: const TextStyle(
              fontFamily: 'product-sans',
              color: ColorsConst.blackTwo,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          subTittle == "Successful"
              ? const Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: CircleAvatar(
                    backgroundColor: ColorsConst.successfull,
                    radius: 4,
                  ),
                )
              : const SizedBox(),
          Text(
            subTittle,
            style: TextStyle(
              // fontFamily: 'product-sans',
              color: subTittle == "Successful"
                  ? ColorsConst.successfull
                  : ColorsConst.black,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
