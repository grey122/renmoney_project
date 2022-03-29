import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renmoney_project/color_const.dart';

import 'package:renmoney_project/transaction_detailed_screen.dart';
import 'package:renmoney_project/transaction_list_screen.dart';

import 'controller/controller.dart';

void main() {
  runApp(const MyApp());
}

const SystemUiOverlayStyle lightTaskBar = SystemUiOverlayStyle(
  statusBarColor: ColorsConst.white,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // accentColor: colorSchemeData.secondary,
        scaffoldBackgroundColor: ColorsConst.backgroundColor,
        backgroundColor: ColorsConst.backgroundColor,
        appBarTheme: const AppBarTheme(
          color: ColorsConst.backgroundColor,
          systemOverlayStyle: lightTaskBar,
          elevation: 0.0,
          centerTitle: false,
        ),
        primaryColor: ColorsConst.primary,

        // primarySwatch: colorSchemeData.secondary,

        // accentTextTheme: textThemeData,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const TransactionDetailed()));

              // _controller.fetchTransactions();
              Get.to(const ListPageWidget());
            },
            child: const Text("Navigate to next Page")),
      )),
    );
  }
}
