import 'package:club_login/input_widget.dart';
import 'package:club_login/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double width, height;
  final String imagePath, text;
  final Color buttonColor, textColor, borderColor;
  final Icon? icon;
  final GestureTapCallback onTap;
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    this.imagePath = '',
    required this.text,
    this.borderColor = Colors.white,
    this.buttonColor = primaryColor,
    this.textColor = Colors.white,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                InputWidget.radius,
              ),
            ),
            border: Border.all(color: borderColor),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 3,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              const Expanded(flex: 5, child: SizedBox()),
              Expanded(
                flex: 15,
                child: SizedBox(
                  height: height * 0.7,
                  child: Builder(builder: (context) {
                    return icon ??
                        Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        );
                  }),
                ),
              ),
              const Expanded(flex: 20, child: SizedBox()),
              Expanded(
                flex: 60,
                child: Text(
                  text,
                  style: GoogleFonts.ebGaramond(
                    textStyle: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: (width + height) / 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
