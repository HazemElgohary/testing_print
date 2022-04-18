import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testing_print/facades/print.dart';

class PickPrinterView extends StatefulWidget {
  final ValueChanged onChange;
  const PickPrinterView({Key? key,required this.onChange,}) : super(key: key);

  @override
  _PickPrinterViewState createState() => _PickPrinterViewState();
}

class _PickPrinterViewState extends State<PickPrinterView> {
  final list = [];
  dynamic selected;

  @override
  void initState() {
    getPrinters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Pick your Printer'),
      subtitle: DropdownButtonFormField<dynamic>(
        value: selected,
        hint: const Text('select...'),
        items: list
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.toString()),
                ))
            .toList(),
        onChanged: (Object? value) {
          if (value == null) return;
          selected = value;
          widget.onChange(selected);
          setState(() {});
        },
      ),
    );
  }

  Future<void> getPrinters() async {
    final res = await Print.refreshBluetoothDevices();
    list.addAll(res);
    setState(() {});
  }

}
