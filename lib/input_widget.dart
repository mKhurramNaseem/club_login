import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  final double width, height;
  final String hint;
  final String iconPath;
  static const radius = 20.0;
  const InputWidget({
    super.key,
    required this.width,
    required this.height,
    required this.hint,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        style: GoogleFonts.ebGaramond(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: (width + height) / 30,
          ),
        ),
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: width * 0.15,
            height: height,
            child: Image.asset(iconPath),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.ebGaramond(
            textStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: (width + height) / 30,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
