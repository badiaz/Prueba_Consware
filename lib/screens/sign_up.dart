import 'package:flutter/material.dart';
import 'package:prueba_tecnica/screens/loader.dart';
import 'package:prueba_tecnica/screens/sign_in.dart';
import 'package:prueba_tecnica/screens/success.dart';
import 'package:prueba_tecnica/utils/global_colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset('assets/logo.png'),
                  const SizedBox(height: 30),
                  const Text(
                    "Regístrate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                  Text(
                    "Sólo te tomará unos minutos.",
                    style: TextStyle(
                      fontSize: 16,
                      color: GlobalColors.secondaryColor,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Nombre completo",
                      style: TextStyle(
                          fontFamily: "ProductSans",
                          color: GlobalColors.secondaryColor,
                          fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: GlobalColors.mainColor,
                      decoration: InputDecoration(
                        labelText: 'Escribe tu nombre',
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
                        prefixIcon: Icon(Icons.person_outline,
                            color: GlobalColors.mainColor),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu nombre completo';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text("Identificación",
                      style: TextStyle(
                          fontFamily: "ProductSans",
                          color: GlobalColors.secondaryColor,
                          fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: GlobalColors.mainColor,
                      decoration: InputDecoration(
                        labelText: 'Escribe tu número de identificación',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu identificación';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text("Email",
                      style: TextStyle(
                          fontFamily: "ProductSans",
                          color: GlobalColors.secondaryColor,
                          fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: GlobalColors.mainColor,
                      decoration: InputDecoration(
                        labelText: 'Uname@mail.com',
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
                        prefixIcon: Icon(Icons.email_outlined,
                            color: GlobalColors.mainColor),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu correo electrónico';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Ingresa un correo electrónico válido';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text("Contraseña",
                      style: TextStyle(
                          fontFamily: "ProductSans",
                          color: GlobalColors.secondaryColor,
                          fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: GlobalColors.mainColor,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: GlobalColors.mainColor,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: GlobalColors.mainColor,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: GlobalColors.mainColor,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa una contraseña';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        value: _acceptedTerms,
                        onChanged: (value) {
                          setState(() {
                            _acceptedTerms = value ?? false;
                          });
                        },
                      ),
                      SizedBox(
                        width: 311,
                        child: RichText(
                          text: TextSpan(
                            text: 'Acepto los ',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'términos',
                                style: TextStyle(
                                  color: GlobalColors.mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' y ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'condiciones',
                                style: TextStyle(
                                  color: GlobalColors.mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' y la ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'política de \nprivacidad',
                                style: TextStyle(
                                  color: GlobalColors.mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' de Banca créditos',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Loader(
                                statusText: 'Registrando usuario');
                          },
                        );
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccessMessage(
                                      isSave: false,
                                    )),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Continuar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿Ya tienes una cuenta?",
                          style: TextStyle(color: GlobalColors.secondaryColor)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const SignIn())));
                          },
                          child: Text(
                            "Inicia sesión",
                            style: TextStyle(color: GlobalColors.mainColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
