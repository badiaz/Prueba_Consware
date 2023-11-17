import 'package:flutter/material.dart';

import '../utils/global_colors.dart';

class Loader extends StatelessWidget {
  final String statusText;

  const Loader({super.key, required this.statusText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[300],
                strokeWidth: 10,
                valueColor:
                    AlwaysStoppedAnimation<Color>(GlobalColors.mainColor),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              statusText,
              style: TextStyle(
                color: GlobalColors.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
