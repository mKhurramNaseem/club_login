import 'package:club_login/custom_button.dart';
import 'package:club_login/extension_methods.dart';
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
  static const playerNameErrorMessage = 'Invalid Name';
  static const emailAddressErrorMessage = 'Invalid Email';
  static const phoneNoErrorMessage = 'Invalid Phone No';
  static const phoneNoLengthErrorMessage = 'Invalid Length';
  static const playerIdErrorMessage = 'Invalid Length';
  static const playerIdEmptyErrorMessage = 'Empty Field';
  static const emptyErrorMessage = 'Empty Field';
  final double _opacity = 0;
  late GlobalKey<FormState> _globalKey;
  static const _duration = Duration(
    seconds: 2,
  );
  final double _endValue = 1;

  String? _playerNameValidator(String? value) {
    if (value.isNameString() == null) {
      return emptyErrorMessage;
    }
    return (value?.isNameString())! ? null : playerNameErrorMessage;
  }

  String? _playerIdValidator(String? value) {
    if (value == null) {
      return playerIdErrorMessage;
    }
    if (value.isEmpty) {
      return playerIdEmptyErrorMessage;
    }
    return value.length >= 2 && value.length <= 13
        ? null
        : playerIdErrorMessage;
  }

  String? _emailAddressValidator(String? value) {
    if (value.isEmailString() == null) {
      return emptyErrorMessage;
    }
    return (value?.isEmailString())! ? null : emailAddressErrorMessage;
  }

  String? _phoneNoValidator(String? value) {
    var (isTrue, from) = value.isPhoneNoString();
    if (!isTrue) {
      if (from == Modification.fromNull) {
        return emptyErrorMessage;
      } else if (from == Modification.fromCharacters) {
        return phoneNoErrorMessage;
      } else {
        return phoneNoLengthErrorMessage;
      }
    }
    return null;
  }

  void _btnLoginTap() {
    _globalKey.currentState?.validate();
  }

  void _btnCancelTap() {}

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey();
  }

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
                child: Form(
                  key: _globalKey,
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
                        validator: _playerNameValidator,
                      ),
                      InputWidget(
                        width: width * inputFieldWidthPercent,
                        height: height * inputFieldHeightPercent,
                        hint: 'Player Id',
                        iconPath: 'assets/images/id_icon.png',
                        validator: _playerIdValidator,
                      ),
                      InputWidget(
                        width: width * inputFieldWidthPercent,
                        height: height * inputFieldHeightPercent,
                        hint: 'Email Address',
                        iconPath: 'assets/images/email_icon.png',
                        validator: _emailAddressValidator,
                      ),
                      InputWidget(
                        width: width * inputFieldWidthPercent,
                        height: height * inputFieldHeightPercent,
                        hint: 'Phone No.',
                        iconPath: 'assets/images/phone_icon_2.png',
                        validator: _phoneNoValidator,
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
                              text: 'SignUp',
                              onTap: _btnLoginTap,
                            ),
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
                              onTap: _btnCancelTap,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
