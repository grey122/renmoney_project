import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:renmoney_project/color_const.dart';
import 'package:renmoney_project/helper/dateConverte.dart';
import 'package:renmoney_project/transaction_detailed_screen.dart';

import 'controller/controller.dart';

class ListPageWidget extends StatelessWidget {
  const ListPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "All Transactions",
                style: TextStyle(
                  fontFamily: 'product-sans',
                  fontWeight: FontWeight.w700,
                  color: ColorsConst.primary,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Obx(
                () => _controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: Column(
                        children: [
                          ...List.generate(_controller.transactionList.length,
                              (index) {
                            return InkWell(
                              onTap: () {
                                Get.to(const TransactionDetailed(),
                                    arguments:
                                        _controller.transactionList[index]);
                              },
                              child: TransactionContainer(
                                money: _controller.transactionList[index].amount
                                    .toString(),
                                date: convertDateFromString(_controller
                                    .transactionList[index].entryDate),
                                type: _controller.transactionList[index].type,
                              ),
                            );
                          })
                        ],
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({
    Key? key,
    required this.money,
    required this.date,
    required this.type,
  }) : super(key: key);

  final String money;
  final String date;
  final String type;

  @override
  Widget build(BuildContext context) {
    Widget transactionContainer() {
      if (type == "TRANSFER") {
        return CircleAvatar(
          child: const Icon(
            Icons.arrow_upward_rounded,
            size: 18,
            color: ColorsConst.primary,
          ),
          backgroundColor: ColorsConst.primary.withOpacity(0.1),
          radius: 20,
        );
      }
      return CircleAvatar(
        child: const Icon(
          Icons.arrow_downward_rounded,
          size: 18,
          color: ColorsConst.successfull,
        ),
        backgroundColor: ColorsConst.successfull.withOpacity(0.1),
        radius: 20,
      );
    }

    String description() {
      if (type == "TRANSFER") {
        return "Money Transfer to";
      } else if (type == "DEPOSIT") {
        return "Money received from";
      }
      return "Money Withdrawn from";
    }

    return Container(
      height: 69,
      padding: const EdgeInsets.fromLTRB(13, 16, 11, 15),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: ColorsConst.transactionContainer,
        borderRadius: BorderRadiusDirectional.circular(8),
      ),
      child: Row(
        children: [
          transactionContainer(),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: description(),
                  style: const TextStyle(
                    fontFamily: 'product-sans',
                    fontWeight: FontWeight.w700,
                    color: ColorsConst.black,
                    fontSize: 13,
                  ),
                  children: const [
                    TextSpan(
                      text: " John",
                      style: TextStyle(
                        fontFamily: 'product-sans',
                        fontWeight: FontWeight.w700,
                        color: ColorsConst.primary,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Text(
                date,
                style: const TextStyle(
                  fontFamily: 'product-sans',
                  color: ColorsConst.blackTwo,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            money,
            style: TextStyle(
              // fontFamily: 'product-sans',
              fontWeight: FontWeight.w700,
              color: money.contains("-")
                  ? ColorsConst.errorColor
                  : ColorsConst.successfull,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
