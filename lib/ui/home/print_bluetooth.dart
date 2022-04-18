import 'dart:async';
import 'dart:typed_data';

import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:testing_print/facades/print.dart';
import 'package:testing_print/ui/views/pick_printer.dart';

class BluePrintScreen extends StatefulWidget {
  const BluePrintScreen({Key? key}) : super(key: key);

  @override
  _BluePrintScreenState createState() => _BluePrintScreenState();
}

class _BluePrintScreenState extends State<BluePrintScreen> {
  bool isConnected = false;
  Uint8List? bill;
  @override
  void initState() {
    createBill();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PickPrinterView(
              onChange: (value) async {
                String select = value;
                List list = select.split("#");
                // String name = list[0];
                String mac = list[1];
                Print.setConnect(mac);
                isConnected = true;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.red,
              ),
              child: MaterialButton(
                onPressed: isConnected
                    ? () async {
                  Print.printThrowBluetooth(bill!);
                  // Print.bytes(bytes: bill);
                }
                    : null,
                child: const Text("Print"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createBill()async{
    final res = await Print.createBill();
    bill = res;
    setState(() {});
  }
}
