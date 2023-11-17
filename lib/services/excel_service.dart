import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';

Future<void> exportToExcel(
    BuildContext context, List<Map<String, dynamic>> data) async {
  var excel = Excel.createExcel();

  var sheet = excel['Sheet1'];

  sheet.appendRow([
    'No. Cuota',
    'Saldo inicial',
    'Valor de cuota',
    'Interés',
    'Abono a capital',
    'Saldo del periodo',
  ]);

  for (var row in data) {
    sheet.appendRow([
      row['cuota'],
      row['saldo_inicial'],
      row['valor_cuota'],
      row['interes'],
      row['abono_capital'],
      row['saldo_periodo'],
    ]);
  }

  var excelBytes = excel.save();

  var directory = Directory('/storage/emulated/0/Download');
  var filePath = '${directory.path}/tabla_amortizacion.xlsx';

  File(filePath)
    ..createSync(recursive: true)
    ..writeAsBytesSync(excelBytes!);

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Tabla guardada en la carpeta de descargas'),
      duration: Duration(seconds: 3),
    ),
  );
}
