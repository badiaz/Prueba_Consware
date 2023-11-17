import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_tecnica/screens/success.dart';
import 'package:prueba_tecnica/utils/global_colors.dart';
import '../services/excel_service.dart';

class CreditResult extends StatefulWidget {
  final double loanAmount;
  final double interestRate;
  final int numberOfInstallments;

  const CreditResult({
    Key? key,
    required this.loanAmount,
    required this.interestRate,
    required this.numberOfInstallments,
  }) : super(key: key);
  @override
  CreditResultState createState() => CreditResultState();
}

class CreditResultState extends State<CreditResult> {
  late final List<Map<String, dynamic>> amortizationTable;

  void _showModal() {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                SvgPicture.asset('assets/alert.svg'),
                const SizedBox(height: 10),
                const Text(
                  '¿Estás seguro que desea \nGuardar la cotización?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'ProductSans',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'La cotización realizada la podrás consultar en tu historial de créditos.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GlobalColors.secondaryColor,
                    fontSize: 16,
                    fontFamily: 'ProductSans',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SuccessMessage(
                                    isSave: true,
                                  ))));
                    },
                    child: const Text(
                      'Guardar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: GlobalColors.mainColor),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: GlobalColors.mainColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    amortizationTable = calculateAmortizationTable(
      widget.loanAmount,
      widget.interestRate,
      widget.numberOfInstallments,
    );
  }

  List<Map<String, dynamic>> calculateAmortizationTable(
    double loanAmount,
    double interestRate,
    int numberOfInstallments,
  ) {
    List<Map<String, dynamic>> result = [];
    double remainingBalance = loanAmount;
    double monthlyInterest = interestRate;
    double initialBalance = loanAmount;
    double installmentAmount = (loanAmount * monthlyInterest) /
        (1 - pow(1 + monthlyInterest, -numberOfInstallments));

    for (int i = 1; i <= numberOfInstallments; i++) {
      double interest = remainingBalance * monthlyInterest;
      double principal = installmentAmount - interest;
      double periodBalance = remainingBalance - principal;

      result.add({
        'cuota': i,
        'saldo_inicial': i == 1
            ? double.parse(initialBalance.toStringAsFixed(2))
            : double.parse(remainingBalance.toStringAsFixed(2)),
        'valor_cuota': double.parse(installmentAmount.toStringAsFixed(2)),
        'interes': double.parse(interest.toStringAsFixed(2)),
        'abono_capital': double.parse(principal.toStringAsFixed(2)),
        'saldo_periodo': double.parse(periodBalance.toStringAsFixed(2)),
      });

      remainingBalance = periodBalance;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Resultado de tu \nsimulador de crédito',
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'ProductSans',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Te presentamos en tu tabla de amortización el \nresultado del movimiento de tu crédito.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'ProductSans',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1.2,
            ),
            const Text(
              'Tabla de créditos',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'ProductSans',
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columnSpacing: 10,
                    columns: const [
                      DataColumn(
                          label: Text(
                        'No. Cuota',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: 'ProductSans',
                        ),
                      )),
                      DataColumn(
                          label: Text(
                        'Saldo inicial',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: 'ProductSans',
                        ),
                      )),
                      DataColumn(
                          label: Text(
                        'Valor de cuota',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: 'ProductSans',
                        ),
                      )),
                      DataColumn(
                          label: Text(
                        'Interés',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: 'ProductSans',
                        ),
                      )),
                      DataColumn(
                          label: Text(
                        'Abono a capital',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: 'ProductSans',
                        ),
                      )),
                      DataColumn(
                          label: Text(
                        'Saldo del periodo',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: 'ProductSans',
                        ),
                      )),
                    ],
                    rows: amortizationTable.map((data) {
                      return DataRow(
                        cells: [
                          DataCell(Center(
                            child: Text(
                              data['cuota'].toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: 'ProductSans',
                              ),
                            ),
                          )),
                          DataCell(Center(
                            child: Text(
                              '\$${data['saldo_inicial'].toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: 'ProductSans',
                              ),
                            ),
                          )),
                          DataCell(Center(
                            child: Text(
                              '\$${data['valor_cuota']}',
                              style: TextStyle(
                                color: GlobalColors.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: 'ProductSans',
                              ),
                            ),
                          )),
                          DataCell(Center(
                            child: Text(
                              '\$${data['interes']}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: 'ProductSans',
                              ),
                            ),
                          )),
                          DataCell(Center(
                            child: Text(
                              '+\$${data['abono_capital']}',
                              style: TextStyle(
                                color: GlobalColors.greenColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: 'ProductSans',
                              ),
                            ),
                          )),
                          DataCell(Center(
                            child: Text(
                              '\$${data['saldo_periodo']}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: 'ProductSans',
                              ),
                            ),
                          )),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  exportToExcel(context, amortizationTable);
                },
                child: const Text(
                  'Descargar Tabla',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: GlobalColors.mainColor),
                  ),
                ),
                onPressed: () {
                  _showModal();
                },
                child: Text(
                  'Guardar cotización',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.mainColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
