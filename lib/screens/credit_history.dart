import 'package:flutter/material.dart';
import 'package:prueba_tecnica/utils/global_colors.dart';

class CreditHistory extends StatefulWidget {
  const CreditHistory({Key? key}) : super(key: key);

  @override
  CreditHistoryState createState() => CreditHistoryState();
}

class CreditHistoryState extends State<CreditHistory> {
  // Ejemplo de datos simulados para la tabla
  List<Map<String, dynamic>> dataTableRows = [
    {
      'monto_credito': '\$10,000.00',
      'fecha': '2023-11-20',
      'no_cuotas': 12,
      'tasa_interes': '3.5%',
    },
    {
      'monto_credito': '\$12,000.00',
      'fecha': '2023-11-20',
      'no_cuotas': 84,
      'tasa_interes': '1%',
    },
  ];

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
              children: const [
                Text(
                  'Historial de créditos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'ProductSans',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Aquí encontrarás tu historial de créditos y el \nregistro de todas tus simulaciones.',
                  style: TextStyle(
                    fontSize: 18,
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
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 10,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Monto del crédito',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Fecha',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'No. de cuotas',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Tasa de interés',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ),
                ],
                rows: dataTableRows.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Center(
                        child: Text(
                          data['monto_credito'],
                          style: TextStyle(
                            color: GlobalColors.secondaryColor,
                            fontSize: 13,
                            fontFamily: 'ProductSans',
                          ),
                        ),
                      )),
                      DataCell(Center(
                        child: Text(
                          data['fecha'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'ProductSans',
                          ),
                        ),
                      )),
                      DataCell(Center(
                        child: Text(
                          data['no_cuotas'].toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'ProductSans',
                          ),
                        ),
                      )),
                      DataCell(Center(
                        child: Text(
                          data['tasa_interes'],
                          style: const TextStyle(
                            color: Colors.black,
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
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Alineación al centro
                children: [
                  Icon(Icons.info_outline, color: GlobalColors.secondaryColor),
                  Text(
                    'No hay más datos por mostrar',
                    style: TextStyle(
                      color: GlobalColors.secondaryColor,
                      fontSize: 13,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
