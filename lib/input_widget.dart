import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef Validator = String? Function(String? value);

class InputWidget extends StatelessWidget {
  final double width, height;
  final String hint;
  final String iconPath;
  final Validator validator;
  static const radius = 20.0;

  const InputWidget({
    super.key,
    required this.width,
    required this.height,
    required this.hint,
    required this.iconPath,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final hintTextStyle = GoogleFonts.ebGaramond(
      textStyle: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: (width + height) / 30,
      ),
    );
    final textStyle = GoogleFonts.ebGaramond(
      textStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: (width + height) / 30,
      ),
    );
    final errorTextStyle = GoogleFonts.ebGaramond(
      textStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: (width + height) / 40,
      ),
    );
    return SizedBox(
      width: width,
      child: TextFormField(
        validator: validator,
        style: textStyle,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: width * 0.15,
            height: height,
            child: Image.asset(iconPath),
          ),
          hintText: hint,
          hintStyle: hintTextStyle,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          helperText: '',
          errorStyle: errorTextStyle,
        ),
      ),
    );
  }
}
