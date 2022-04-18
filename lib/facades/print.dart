import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart' hide Image;
import 'package:image/image.dart';
import 'package:printing/printing.dart';
import 'package:queen/queen.dart';
import 'package:pdf/pdf.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:pdfx/pdfx.dart' as x;

import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';

import '../services/printer.dart';

/// handles printing functionality
abstract class Print {
  static bool connected = false;

  /// list of available printers throw [Bluetooth]
  static final bluetoothDevices = [];

  /// create a [Bill] for [OrderModel] size of [80mm]
  static Future<Uint8List> createBill() =>
      Locators.find<PrinterPageServices>().generatePdf();

  /// print bytes to the selected printer
  static Future<void> bytes({
    required Uint8List bytes,
  }) async {
    return printThrowBluetooth(bytes);
  }

  /// save bytes to the device on the temp path if non was provided
  static Future<File> saveToTemp(
    Uint8List bytes, {
    String? path,
  }) async {
    final output = path ??
        join(
          // will store inside the project directory
          Directory.current.path,
          // database file name
          'temp.pdf',
        );

    final file = File(output);
    // if (await file.exists()) await file.delete(recursive: true);
    await file.writeAsBytes(bytes);

    return file;
  }

  static const rollSize = PdfPageFormat(
    70 * PdfPageFormat.mm,
    double.infinity,
    marginAll: 5,
  );

  static void updateBluetoothPrinterStatus(bool isBluetoothPrinterActive) =>
      Prefs.setBool('is_bluetooth_printer_active', isBluetoothPrinterActive);

  static bool get bluetoothPrinterStatus =>
      Prefs.getBool('is_bluetooth_printer_active');

  // bluetooth functions
  static Future<List<int>> buildReceiptForBluetooth(Uint8List data) async {
    List<int> bytes = [];

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    bytes += generator.image(await generateReceiptImage(data));

    bytes += generator.hr();

    bytes += generator.cut();

    return bytes;
  }

  static Future<Image> generateReceiptImage(
    Uint8List data,
  ) async {
    final document = await x.PdfDocument.openData(data);
    final page = await document.getPage(1);
    final image = await page.render(
      width: (rollSize.width * 2) * 0.96,
      height: page.height * 2,
      format: x.PdfPageImageFormat.jpeg,
    );

    page.close();
    final bytes = image!.bytes;
    final img = decodeImage(bytes.buffer.asUint8List());
    if (img != null) {
      return img;
    } else {
      throw Exception('Could not decode image');
    }
    // return Image.fromBytes(image.width!, image.height!, bytes);
  }

  static Future<void> printThrowBluetooth(Uint8List data) async {
    String? isConnected = await BluetoothThermalPrinter.connectionStatus;
    if (isConnected == "true") {
      List<int> bytes = await buildReceiptForBluetooth(data);
      await BluetoothThermalPrinter.writeBytes(bytes);
    } else {
      throw 'Must Select Printer';
    }
  }

  static Future<List> refreshBluetoothDevices() async {
    final bluetooths = await BluetoothThermalPrinter.getBluetooths;
    bluetoothDevices.clear();
    bluetoothDevices.addAll(bluetooths ?? []);
    return bluetoothDevices;
  }

  static Future<void> setConnect(String mac) async {
    try {
      final result = await BluetoothThermalPrinter.connect(mac);
      if (result == "true") {
        connected = true;
        log('your printer is connected');
      } else {

        log('your printer is not connected');
        throw 'error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
