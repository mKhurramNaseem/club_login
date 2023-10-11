import 'package:club_login/custom_button.dart';
import 'package:club_login/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

const Color primaryColor = Colors.blue;

class MyApp extends StatelessWidget {
  static const appBarTitle = 'Argentina National Team';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appBarTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appBarTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const playerImagePath = 'assets/images/player.png';
  static const pageTitle = 'SignUp Form';
  static const inputFieldWidthPercent = 0.4;
  static const inputFieldHeightPercent = 0.05;
  final double _opacity = 0;
  static const _duration = Duration(
    seconds: 2,
  );
  final double _endValue = 1;

  @override
  Widget build(BuildContext context) {
    Tween<double> opacityTween = Tween(begin: _opacity, end: _endValue);
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    var imageWidth = width * 0.3;
    var imageHeight = height * 0.7;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          widget.title,
          style: GoogleFonts.ebGaramond(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: (width + height) / 80,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Row(
          children: [
            TweenAnimationBuilder(
              tween: opacityTween,
              duration: _duration,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: SizedBox(
                    width: imageWidth * value,
                    height: imageHeight * value,
                    child: child!,
                  ),
                );
              },
              child: Image.asset(
                playerImagePath,
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: width * 0.7,
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      pageTitle,
                      maxLines: 2,
                      style: GoogleFonts.ebGaramond(
                        textStyle: TextStyle(
                          color: primaryColor,
                          fontSize: (width + height) / 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InputWidget(
                      width: width * inputFieldWidthPercent,
                      height: height * inputFieldHeightPercent,
                      hint: 'Player Name',
                      iconPath: 'assets/images/player_icon.png',
                    ),
                    InputWidget(
                      width: width * inputFieldWidthPercent,
                      height: height * inputFieldHeightPercent,
                      hint: 'Player Id',
                      iconPath: 'assets/images/id_icon.png',
                    ),
                    InputWidget(
                      width: width * inputFieldWidthPercent,
                      height: height * inputFieldHeightPercent,
                      hint: 'Email Address',
                      iconPath: 'assets/images/email_icon.png',
                    ),
                    InputWidget(
                      width: width * inputFieldWidthPercent,
                      height: height * inputFieldHeightPercent,
                      hint: 'Phone No.',
                      iconPath: 'assets/images/phone_icon_2.png',
                    ),
                    SizedBox(
                      width: width * inputFieldWidthPercent,
                      height: height * inputFieldHeightPercent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                              width: width * 0.15,
                              height: height * 0.15,
                              imagePath: 'assets/images/player_icon_2.png',
                              text: 'SignUp'),
                          CustomButton(
                            width: width * 0.15,
                            height: height * 0.15,
                            icon: const Icon(
                              Icons.cancel,
                              color: primaryColor,
                            ),
                            text: 'Cancel',
                            buttonColor: Colors.white,
                            textColor: primaryColor,
                            borderColor: primaryColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
