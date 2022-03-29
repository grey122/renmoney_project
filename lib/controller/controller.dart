import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:renmoney_project/modules/transaction.dart';

Map<String, String> headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  "charset": "utf-8",
  "Sourceappid": "ckpu7zo0p0000gg5436coo7xs",
  "Authorization":
      "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4OTkzOTQ5NjMzIiwiaWF0IjoxNjQ4NTQzOTg0LCJleHAiOjE2NDg2MzAzODR9.sSk1JzwzCoi3jTT2cjb2kVjWJYBD6H2ttTS4fXtChCfEQXRWf8v0q3iYw60jGvfJjGUhT8R2CtRS6jhRPsHYzQ"
};

class Controller extends GetxController {
  var transactionList = <Transaction>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    var url = Uri.parse(
        "https://api-sandbox.renmoney.com/deposit-transfer/api/v3/investment/3580016662/transactions");
    // var url = Uri.http('https://api-sandbox.renmoney.com',
    //     '/deposit-transfer/api/v3/investment/3580016662/transactions');
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final data = jsonDecode(response.body);

      List transList = data["data"]["clientTransactions"];

      transList.forEach((element) {
        var transat = Transaction.fromJson(element);
        transactionList.add(Transaction(
            transactionId: transat.transactionId,
            type: transat.type,
            amount: transat.amount,
            comment: transat.comment,
            entryDate: transat.entryDate,
            currencyCode: transat.currencyCode,
            balance: transat.balance));
      });

      print(transactionList[0].balance);

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
