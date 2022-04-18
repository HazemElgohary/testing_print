import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:path/path.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' ;
import 'package:intl/intl.dart' hide TextDirection;
import 'package:printing/printing.dart';
import 'package:queen/translations.dart';

import '../generated/assets.dart';

class PrinterPageServices {

  Future<Uint8List> generatePdf() async {
    final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
    final ttf = await fontFromAssetBundle(Asset.fonts.tajawalBold);
    final theme = ThemeData.withFont(
      base: ttf,
      bold: ttf,
      boldItalic: ttf,
      icons: ttf,
      italic: ttf,
    );

    pdf.addPage(
        Page(
          theme: theme,
          pageFormat: const PdfPageFormat(
            70 * PdfPageFormat.mm,
            double.infinity,
            marginAll: 5,
          ),
          build: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '(',
                        style: theme.tableHeader.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 7,
                        ),
                      ),
                      Text(
                        'غنوان الفاتورة',
                        style: theme.tableHeader.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFallback: [ttf],
                          fontSize: 7,
                        ),
                      ),
                      Text(
                        ')',
                        style: theme.tableHeader.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 7,
                        ),
                      ),
                      Text(
                        'فاتورة جديدة',
                        style: theme.tableHeader
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Text(
                    'العنوان',
                    style: theme.paragraphStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 7,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'رقم الهاتف',
                    style: theme.paragraphStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 7,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'فاتورة ضريبة مبسطة',
                    style: theme.tableHeader.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Simplified Tax Invoice',
                    style: theme.tableHeader.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 7,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '(INV - 10)',
                    style: const TextStyle(fontSize: 7)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vat Number',
                          style: const TextStyle(fontSize: 7)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '123456',
                          style: const TextStyle(fontSize: 7)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'الرقم الضريبي',
                          style: const TextStyle(fontSize: 7)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: PdfColors.black,
                    borderStyle: BorderStyle.dashed,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اسم الطاولة',
                        style: const TextStyle(fontSize: 7)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '#' '50',
                        style: const TextStyle(fontSize: 12)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'كاشير اول',
                        style: const TextStyle(fontSize: 7)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Divider(
                    color: PdfColors.black,
                    borderStyle: BorderStyle.dashed,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: const TextStyle(fontSize: 8)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd   hh:mm a')
                              .format(DateTime.now()),
                          style: const TextStyle(fontSize: 8)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'التاريخ',
                          style: const TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: PdfColors.black,
                    borderStyle: BorderStyle.dashed,
                  ),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(2),
                      // 2: FlexColumnWidth(2),
                      // 3: FlexColumnWidth(4),
                    },
                    children: [
                      TableRow(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اسم المنتج',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 7,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Product Name',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 7,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'السعر',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 7,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Price',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 7,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'الكمية',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 7,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Quantity',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 7,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'المجموع',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 7,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Total',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 7,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ].reversed.toList(),
                      ),
                      TableRow(
                        children: [
                          SizedBox(height: 3),
                          SizedBox(height: 3),
                          SizedBox(height: 3),
                          SizedBox(height: 3),
                        ],
                      ),
                      // ...order.products
                      //     .map(
                      //       (e) => productRow(
                      //     product: e.product,
                      //     variable: e.variable,
                      //     quantity: e.quantity,
                      //     category: e.category,
                      //   ),
                      // )
                      //     .toList(),
                      // for (final offer in order.offers) ...[
                      //   TableRow(
                      //     children: [
                      //       Text(
                      //         offer.offer.title,
                      //         textAlign: TextAlign.center,
                      //         style: const TextStyle(
                      //           fontSize: 7,
                      //         ).copyWith(fontWeight: FontWeight.bold),
                      //       ),
                      //       Spacer(),
                      //       Spacer(),
                      //       Text(
                      //         offer.priceWithTax.toStringAsFixed(2),
                      //         textAlign: TextAlign.center,
                      //         style: const TextStyle(
                      //           fontSize: 7,
                      //         ).copyWith(fontWeight: FontWeight.bold),
                      //       ),
                      //     ].reversed.toList(),
                      //   ),
                      //   ...offer.items
                      //       .map(
                      //         (i) => productRow(
                      //       product: i.product,
                      //       variable: i.variable,
                      //       quantity: i.quantity,
                      //       category: i.category,
                      //       isOfferRow: true,
                      //     ),
                      //   )
                      //       .toList(),
                      // ],
                    ],
                  ),
                  Divider(
                    color: PdfColors.black,
                    borderStyle: BorderStyle.dashed,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1000 ريال',
                        style: const TextStyle(fontSize: 8)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        ')غير شامل الضريبة(',
                        style: const TextStyle(fontSize: 5)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'المبلغ الاجمالي',
                        style: const TextStyle(fontSize: 8)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1000 ريال',
                        style: const TextStyle(fontSize: 8)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '(VAT)',
                        style: const TextStyle(fontSize: 5)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ضريبة القيمه المضافة',
                        style: const TextStyle(fontSize: 8)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1000 ريال',
                        style: const TextStyle(fontSize: 8)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '(total)',
                        style: const TextStyle(fontSize: 7)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'المبلغ الاجمالي',
                        style: const TextStyle(fontSize: 8)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    borderStyle: BorderStyle.dashed,
                    color: PdfColors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1000 ريال',
                        style: const TextStyle(fontSize: 8)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'المبلغ المستحق',
                        style: const TextStyle(fontSize: 8)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    borderStyle: BorderStyle.dashed,
                    color: PdfColors.black,
                  ),
                  // Row(
                  //   children: [
                  //     barCodeGenerator('Hazem Elgohary 😍 ♥ 🤟'),
                  //     // Spacer(),
                  //     // Column(
                  //     //   children: order.paymentMethods
                  //     //       .map(
                  //     //         (e) => Text(
                  //     //       e.title,
                  //     //       style: const TextStyle(fontSize: 8).copyWith(fontWeight: FontWeight.bold),
                  //     //     ),
                  //     //   )
                  //     //       .toList(),
                  //     // ),
                  //   ],
                  // ),
                  Divider(
                    borderStyle: BorderStyle.dashed,
                    color: PdfColors.black,
                  ),
                  // qrGenerator(
                  //   sellerName: 'Hazem Elgohary 😍 ♥ 🤟',
                  //   sellerTRN: 'Hazem Elgohary 😍 ♥ 🤟',
                  //   vatPrice: 'Hazem Elgohary 😍 ♥ 🤟',
                  //   totalWithVat: 'Hazem Elgohary 😍 ♥ 🤟',
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ); // Center
          },
        ),
    );

    return pdf.save();
  }



  // Future<File> saveToTemp(Document doc) async {
  //   final dbPath = await getDatabasesPath();
  //   final output = join(
  //     // will store the database inside the project directory
  //     dbPath,
  //     // database file name
  //     'temp.pdf',
  //   );
  //
  //   final file = File(output);
  //
  //   await file.writeAsBytes(await doc.save());
  //
  //   return file;
  // }

  Widget barCodeGenerator(String code) {
    // 'C128',2.5,50
    return BarcodeWidget(
      barcode: Barcode.code128(),
      color: PdfColors.black,
      data: code,
      height: 20,
      width: 50,
    );
  }



  Widget qrGenerator({
    required String sellerName,
    required String sellerTRN,
    required String vatPrice,
    required String totalWithVat,
  }) {
    return BarcodeWidget(
      barcode: Barcode.qrCode(),
      color: PdfColors.black,
      data: getQrCodeContent(
        sellerName: sellerName,
        sellerTRN: sellerTRN,
        vatPrice: vatPrice,
        totalWithVat: totalWithVat,
      ),
      height: 40,
      width: 50,
    );
  }

  String getQrCodeContent({
    required String sellerName,
    required String sellerTRN,
    required String vatPrice,
    required String totalWithVat,
  }) {
    var dateTime = DateTime.now();
    final invoiceDate = DateFormat('yyyy-dd-MM hh:mm:ss').format(dateTime);
    // throw invoiceDate;
    // "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}:00";
    // final invoiceDate = "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
    final bytesBuilder = BytesBuilder();
    // 1. Seller Name
    bytesBuilder.addByte(1);
    final sellerNameBytes = utf8.encode(
      sellerName.toLocale(
        const Locale('ar'),
      ),
    );
    bytesBuilder.addByte(sellerNameBytes.length);
    bytesBuilder.add(sellerNameBytes);
    // 2. VAT Registration
    bytesBuilder.addByte(2);
    final vatRegistrationBytes = utf8.encode(
      sellerTRN.toLocale(
        const Locale('ar'),
      ),
    );
    bytesBuilder.addByte(vatRegistrationBytes.length);
    bytesBuilder.add(vatRegistrationBytes);
    // 3. Time
    bytesBuilder.addByte(3);
    final time = utf8.encode(
      invoiceDate.toLocale(
        const Locale('ar'),
      ),
    );
    bytesBuilder.addByte(time.length);
    bytesBuilder.add(time);
    // 4. total with vat
    bytesBuilder.addByte(4);
    final p1 = utf8.encode(
      totalWithVat.toLocale(
        const Locale('ar'),
      ),
    );
    bytesBuilder.addByte(p1.length);
    bytesBuilder.add(p1);
    // 5.  vat
    bytesBuilder.addByte(5);
    final p2 = utf8.encode(
      vatPrice.toLocale(
        const Locale('ar'),
      ),
    );
    bytesBuilder.addByte(p2.length);
    bytesBuilder.add(p2);

    final qrCodeAsBytes = bytesBuilder.toBytes();
    const b64Encoder = Base64Encoder();
    return b64Encoder.convert(qrCodeAsBytes);
  }

}
