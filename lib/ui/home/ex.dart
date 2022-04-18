import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:queen/locators.dart';

import '../../services/printer.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('test')),
      body: PdfPreview(
        build: (format) async{
          final service = Locators.find<PrinterPageServices>();
          final file = await service.generatePdf();
          return file;
        }
      ),
    );
  }

  // Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
  //   final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  //   final font = await PdfGoogleFonts.nunitoExtraLight();
  //
  //   pdf.addPage(
  //     pw.Page(
  //       theme: theme,
  //       pageFormat: PrintService.rollSize,
  //       build: (context) {
  //         return Directionality(
  //           textDirection: TextDirection.rtl,
  //           child: Column(
  //             children: [
  //               SizedBox(height: 5),
  //               Container(
  //                 height: 40,
  //                 width: 80,
  //                 color: PdfColors.amber,
  //               ),
  //               SizedBox(height: 5),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     '(',
  //                     style: theme.tableHeader.copyWith(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 7,
  //                     ),
  //                   ),
  //                   Text(
  //                     'غنوان الفاتورة',
  //                     style: theme.tableHeader.copyWith(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 7,
  //                     ),
  //                   ),
  //                   Text(
  //                     ')',
  //                     style: theme.tableHeader.copyWith(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 7,
  //                     ),
  //                   ),
  //                   Text(
  //                     'فاتورة جديدة',
  //                     style: theme.tableHeader
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 3),
  //               Text(
  //                 'العنوان',
  //                 style: theme.paragraphStyle.copyWith(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 7,
  //                 ),
  //               ),
  //               SizedBox(height: 3),
  //               Text(
  //                 'رقم الهاتف',
  //                 style: theme.paragraphStyle.copyWith(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 7,
  //                 ),
  //               ),
  //               SizedBox(height: 3),
  //               Text(
  //                 'فاتورة ضريبة مبسطة',
  //                 style: theme.tableHeader.copyWith(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               SizedBox(height: 3),
  //               Text(
  //                 'Simplified Tax Invoice',
  //                 style: theme.tableHeader.copyWith(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 7,
  //                 ),
  //               ),
  //               SizedBox(height: 3),
  //               Text(
  //                 '(INV - 10)',
  //                 style: const TextStyle(fontSize: 7)
  //                     .copyWith(fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(height: 3),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 5,
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       'Vat Number',
  //                       style: const TextStyle(fontSize: 7)
  //                           .copyWith(fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(
  //                       '123456',
  //                       style: const TextStyle(fontSize: 7)
  //                           .copyWith(fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(
  //                       'الرقم الضريبي',
  //                       style: const TextStyle(fontSize: 7)
  //                           .copyWith(fontWeight: FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Divider(
  //                 color: PdfColors.black,
  //                 borderStyle: BorderStyle.dashed,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'اسم الطاولة',
  //                     style: const TextStyle(fontSize: 7)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     '#' + '50',
  //                     style: const TextStyle(fontSize: 12)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     'كاشير اول',
  //                     style: const TextStyle(fontSize: 7)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 3),
  //               Divider(
  //                 color: PdfColors.black,
  //                 borderStyle: BorderStyle.dashed,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 5,
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       'Date',
  //                       style: const TextStyle(fontSize: 8)
  //                           .copyWith(fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(
  //                       DateFormat('yyyy-MM-dd   hh:mm a')
  //                           .format(DateTime.now()),
  //                       style: const TextStyle(fontSize: 8)
  //                           .copyWith(fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(
  //                       'التاريخ',
  //                       style: const TextStyle(fontSize: 8),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Divider(
  //                 color: PdfColors.black,
  //                 borderStyle: BorderStyle.dashed,
  //               ),
  //               Table(
  //                 defaultVerticalAlignment: TableCellVerticalAlignment.top,
  //                 columnWidths: const {
  //                   0: FlexColumnWidth(2),
  //                   1: FlexColumnWidth(2),
  //                   // 2: FlexColumnWidth(2),
  //                   // 3: FlexColumnWidth(4),
  //                 },
  //                 children: [
  //                   TableRow(
  //                     verticalAlignment: TableCellVerticalAlignment.middle,
  //                     children: [
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             'اسم المنتج',
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: 7,
  //                             ).copyWith(fontWeight: FontWeight.bold),
  //                           ),
  //                           SizedBox(height: 3),
  //                           Text(
  //                             'Product Name',
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: 7,
  //                             ).copyWith(fontWeight: FontWeight.bold),
  //                           ),
  //                         ],
  //                       ),
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             'السعر',
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: 7,
  //                             ).copyWith(fontWeight: FontWeight.bold),
  //                           ),
  //                           SizedBox(height: 3),
  //                           Text(
  //                             'Price',
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: 7,
  //                             ).copyWith(fontWeight: FontWeight.bold),
  //                           ),
  //                         ],
  //                       ),
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             'الكمية',
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: 7,
  //                             ).copyWith(fontWeight: FontWeight.bold),
  //                           ),
  //                           SizedBox(height: 3),
  //                           Text(
  //                             'Quantity',
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: 7,
  //                             ).copyWith(fontWeight: FontWeight.bold),
  //                           ),
  //                         ],
  //                       ),
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             'المجموع',
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: 7,
  //                             ).copyWith(fontWeight: FontWeight.bold),
  //                           ),
  //                           SizedBox(height: 3),
  //                           Text(
  //                             'Total',
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: 7,
  //                             ).copyWith(fontWeight: FontWeight.bold),
  //                           ),
  //                         ],
  //                       ),
  //                     ].reversed.toList(),
  //                   ),
  //                   TableRow(
  //                     children: [
  //                       SizedBox(height: 3),
  //                       SizedBox(height: 3),
  //                       SizedBox(height: 3),
  //                       SizedBox(height: 3),
  //                     ],
  //                   ),
  //                   // ...order.products
  //                   //     .map(
  //                   //       (e) => productRow(
  //                   //     product: e.product,
  //                   //     variable: e.variable,
  //                   //     quantity: e.quantity,
  //                   //     category: e.category,
  //                   //   ),
  //                   // )
  //                   //     .toList(),
  //                   // for (final offer in order.offers) ...[
  //                   //   TableRow(
  //                   //     children: [
  //                   //       Text(
  //                   //         offer.offer.title,
  //                   //         textAlign: TextAlign.center,
  //                   //         style: const TextStyle(
  //                   //           fontSize: 7,
  //                   //         ).copyWith(fontWeight: FontWeight.bold),
  //                   //       ),
  //                   //       Spacer(),
  //                   //       Spacer(),
  //                   //       Text(
  //                   //         offer.priceWithTax.toStringAsFixed(2),
  //                   //         textAlign: TextAlign.center,
  //                   //         style: const TextStyle(
  //                   //           fontSize: 7,
  //                   //         ).copyWith(fontWeight: FontWeight.bold),
  //                   //       ),
  //                   //     ].reversed.toList(),
  //                   //   ),
  //                   //   ...offer.items
  //                   //       .map(
  //                   //         (i) => productRow(
  //                   //       product: i.product,
  //                   //       variable: i.variable,
  //                   //       quantity: i.quantity,
  //                   //       category: i.category,
  //                   //       isOfferRow: true,
  //                   //     ),
  //                   //   )
  //                   //       .toList(),
  //                   // ],
  //                 ],
  //               ),
  //               Divider(
  //                 color: PdfColors.black,
  //                 borderStyle: BorderStyle.dashed,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     '1000 ريال',
  //                     style: const TextStyle(fontSize: 8)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Spacer(),
  //                   Text(
  //                     ')غير شامل الضريبة(',
  //                     style: const TextStyle(fontSize: 5)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     'المبلغ الاجمالي',
  //                     style: const TextStyle(fontSize: 8)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 3),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     '1000 ريال',
  //                     style: const TextStyle(fontSize: 8)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Spacer(),
  //                   Text(
  //                     '(VAT)',
  //                     style: const TextStyle(fontSize: 5)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     'ضريبة القيمه المضافة',
  //                     style: const TextStyle(fontSize: 8)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 3),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     '1000 ريال',
  //                     style: const TextStyle(fontSize: 8)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Spacer(),
  //                   Text(
  //                     '(total)',
  //                     style: const TextStyle(fontSize: 7)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     'المبلغ الاجمالي',
  //                     style: const TextStyle(fontSize: 8)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //               Divider(
  //                 borderStyle: BorderStyle.dashed,
  //                 color: PdfColors.black,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     '1000 ريال',
  //                     style: const TextStyle(fontSize: 8)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     'المبلغ المستحق',
  //                     style: const TextStyle(fontSize: 8)
  //                         .copyWith(fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //               Divider(
  //                 borderStyle: BorderStyle.dashed,
  //                 color: PdfColors.black,
  //               ),
  //               Row(
  //                 children: [
  //                   barCodeGenerator('Hazem Elgohary 😍 ♥ 🤟'),
  //                   Spacer(),
  //                   // Column(
  //                   //   children: order.paymentMethods
  //                   //       .map(
  //                   //         (e) => Text(
  //                   //       e.title,
  //                   //       style: const TextStyle(fontSize: 8).copyWith(fontWeight: FontWeight.bold),
  //                   //     ),
  //                   //   )
  //                   //       .toList(),
  //                   // ),
  //                 ],
  //               ),
  //               Divider(
  //                 borderStyle: BorderStyle.dashed,
  //                 color: PdfColors.black,
  //               ),
  //               qrGenerator(
  //                 sellerName: 'Hazem Elgohary 😍 ♥ 🤟',
  //                 sellerTRN: 'Hazem Elgohary 😍 ♥ 🤟',
  //                 vatPrice: 'Hazem Elgohary 😍 ♥ 🤟',
  //                 totalWithVat: 'Hazem Elgohary 😍 ♥ 🤟',
  //               ),
  //               SizedBox(
  //                 height: 5,
  //               ),
  //             ],
  //           ),
  //         ); // Center
  //       },
  //     ),,
  //   );
  //
  //   return pdf.save();
  // }
}