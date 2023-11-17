import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:prueba_tecnica/screens/credit_result.dart';
import 'package:prueba_tecnica/utils/global_colors.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../models/credit_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _monthsController = TextEditingController();
  final TextEditingController _loanController = TextEditingController();
  String cleanLoanValue = '';
  String cleanSalaryValue = '';
  bool isSimulated = false;
  final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
  CreditType? _selectedCreditType;
  double _maxLoan = 0;
  String formattedMaxLoan = '';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cuota máxima de préstamo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'ProductSans',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                formattedMaxLoan,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'ProductSans',
                ),
              ),
              Text(
                "*Este valor suele cambiar con respecto \na tu salario",
                style: TextStyle(
                  color: GlobalColors.mainColor,
                  fontSize: 15,
                  fontFamily: 'ProductSans',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Tasa Efectiva Anual desde",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.secondaryColor,
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '-%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Tasa Mensual Vencida desde",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.secondaryColor,
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '-%',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Valor total del prestamo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.secondaryColor,
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '\$-',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Text(
                    "Valor total a pagar \n(capital + intereses + seguro)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$-',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !isSimulated
        ? Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hola Brayan D. 👋',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'ProductSans',
                            ),
                          ),
                          SizedBox(width: 100),
                          Icon(Icons.notifications_active_outlined)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Simulador de crédito",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'ProductSans',
                                color: GlobalColors.mainColor),
                          ),
                          Icon(Icons.info_outline,
                              color: GlobalColors.mainColor)
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Ingresa los datos para tu crédito según lo \nque necesites.",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'ProductSans',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("¿Qué tipo de crédito deseas realizar?",
                          style: TextStyle(
                              fontFamily: "ProductSans",
                              color: Colors.black,
                              fontSize: 16)),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: DropdownButtonFormField<CreditType>(
                          decoration: InputDecoration(
                            labelText: 'Tipo de crédito',
                            hintText: 'Selecciona el tipo de crédito',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: GlobalColors.mainColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: GlobalColors.mainColor,
                              ),
                            ),
                          ),
                          value: _selectedCreditType,
                          hint: const Text('Selecciona el tipo de crédito'),
                          items: creditTypes.map((CreditType type) {
                            return DropdownMenuItem<CreditType>(
                              value: type,
                              child: Text(type.name),
                            );
                          }).toList(),
                          onChanged: (CreditType? value) {
                            setState(() {
                              _selectedCreditType = value;
                            });
                            if (value != null) {}
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("¿Cúanto es tu salario base?",
                          style: TextStyle(
                              fontFamily: "ProductSans",
                              color: Colors.black,
                              fontSize: 16)),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'))
                            ],
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            controller: _salaryController,
                            cursorColor: GlobalColors.mainColor,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.info_outline,
                                  color: GlobalColors.mainColor,
                                ),
                                onPressed: () {
                                  _showModal();
                                },
                              ),
                              labelText: "\$10'000.000,00",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: GlobalColors.mainColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: GlobalColors.mainColor,
                                ),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Porfavor digite su salario base para continuar.";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              cleanSalaryValue =
                                  value.replaceAll(RegExp(r'[^0-9]'), '');

                              String formattedValue = formatter
                                  .format(double.parse(cleanSalaryValue) / 100);
                              _maxLoan =
                                  (double.parse(cleanSalaryValue) * 7 / 100) /
                                      0.15;
                              formattedMaxLoan = formatter.format(_maxLoan);
                              _salaryController.value = TextEditingValue(
                                text: formattedValue,
                                selection: TextSelection.collapsed(
                                    offset: formattedValue.length),
                              );
                            },
                            onEditingComplete: () {}),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: _loanController,
                          cursorColor: GlobalColors.mainColor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: HexColor("#e0e0e0"),
                            labelText: "\$0",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: GlobalColors.mainColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: GlobalColors.mainColor,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            cleanLoanValue =
                                value.replaceAll(RegExp(r'[^0-9]'), '');
                            String formattedValue = formatter
                                .format(double.parse(cleanLoanValue) / 100);
                            _loanController.value = TextEditingValue(
                              text: formattedValue,
                              selection: TextSelection.collapsed(
                                  offset: formattedValue.length),
                            );
                          },
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("¿A cuántos meses?",
                          style: TextStyle(
                              fontFamily: "ProductSans",
                              color: Colors.black,
                              fontSize: 16)),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _monthsController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          cursorColor: GlobalColors.mainColor,
                          decoration: InputDecoration(
                            labelText: "48",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: GlobalColors.mainColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: GlobalColors.mainColor,
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            }
                            if (double.parse(_monthsController.text) < 12) {
                              return "La cuota mínima es 12";
                            }
                            if (double.parse(_monthsController.text) > 84) {
                              return "La cuota máxima es 84";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Elije un plazo desde 12 a 84 meses",
                        style: TextStyle(color: GlobalColors.secondaryColor),
                      ),
                      const SizedBox(height: 20),
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
                            if (_selectedCreditType != null &&
                                _salaryController.text.isNotEmpty &&
                                _loanController.text.isNotEmpty &&
                                _monthsController.text.isNotEmpty) {
                              // Todos los campos obligatorios están llenos, procede con la simulación
                              isSimulated = true;
                              setState(() {});
                            } else {}
                          },
                          child: const Text(
                            'Simular',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          )
        : CreditResult(
            loanAmount: double.parse(cleanLoanValue) / 100,
            interestRate: _selectedCreditType!.interestRate,
            numberOfInstallments: int.parse(_monthsController.text));
  }
}
