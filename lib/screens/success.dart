import 'package:flutter/material.dart';
import 'package:prueba_tecnica/screens/home_widget.dart';
import 'package:prueba_tecnica/screens/sign_in.dart';
import '../utils/global_colors.dart';

class SuccessMessage extends StatelessWidget {
  final bool isSave;
  const SuccessMessage({super.key, required this.isSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/success.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              !isSave ? 'Registro exitoso' : 'Simulación Exitosa',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 350,
              child: Text(
                !isSave
                    ? 'Hemos guardado tus credenciales de forma exitosa. Presiona continuar para seguir \nadelante.'
                    : 'Hemos guardado tu simulación de forma exitosa. Presiona continuar para seguir \nadelante.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
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
                  !isSave
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignIn())))
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const HomeWidget())));
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
