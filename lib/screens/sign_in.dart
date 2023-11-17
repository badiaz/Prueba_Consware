import 'package:flutter/material.dart';
import 'package:prueba_tecnica/screens/home_widget.dart';
import 'package:prueba_tecnica/screens/sign_up.dart';
import 'package:prueba_tecnica/utils/global_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Inicia sesión o continua',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "ProductSans",
                          fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: ', sólo te tomará\nunos minutos.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
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
                  const SizedBox(height: 16.0),
                  Text("Email o Usuario",
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
                      Row(
                        children: [
                          const Text("Recordarme",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "ProductSans",
                                  fontSize: 16)),
                          const SizedBox(
                            width: 70,
                          ),
                          Text(
                            "¿Olvide mi contraseña?",
                            style: TextStyle(color: GlobalColors.mainColor),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomeWidget())));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: GlobalColors.secondaryColor,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: GlobalColors.secondaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/google.png",
                          width: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Ingresa con google",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "ProductSans",
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: GlobalColors.secondaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/apple.svg"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Ingresa con Apple",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "ProductSans",
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿No una cuenta?",
                          style: TextStyle(color: GlobalColors.secondaryColor)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const SignUp())));
                          },
                          child: Text(
                            "Registrate",
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
