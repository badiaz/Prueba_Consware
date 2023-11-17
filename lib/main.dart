import 'package:flutter/material.dart';
import 'package:prueba_tecnica/screens/splash.dart';
import 'package:prueba_tecnica/utils/global_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return GlobalColors.mainColor;
              }
              return Colors.grey;
            },
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontFamily: 'ProductSans'),
        ),
      ),
      home: const Splash(),
    );
  }
}
