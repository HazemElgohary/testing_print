import 'package:flutter/material.dart';
import 'package:queen/core.dart';
import 'package:queen/facade.dart';
import 'package:queen/locators.dart';
import 'package:testing_print/services/printer.dart';
import 'package:testing_print/ui/home/print_bluetooth.dart';

import 'ui/home/ex.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await App.boot();
  Locators.putLazy(() => PrinterPageServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return QueenBuilder(
      enableDevtools: false,
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const BluePrintScreen(),
        );
      }
    );
  }
}
