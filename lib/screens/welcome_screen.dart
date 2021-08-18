import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';
import 'package:project1/screens/login_screen.dart';
import 'package:project1/screens/register_screen.dart';
import 'package:slide_button/slide_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image:  AssetImage('assets/images/login_background.png'),
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: (size.width * 0.6),
                height: (size.width * 0.6),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                height: size.width * 0.1,
                child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: size.width * 0.08,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    child: Text(
                      'Tenders',
                    )),
              ),
              BuildMainButton(
                size: size.width,
                text: login,
                slideDirection: SlideDirection.RIGHT,
                icon: Icons.arrow_forward,
                textDirection: TextDirection.ltr,
                onButtonOpened: (val) {
                  if (val >= 0.8) {
                     Get.off(LogInScreen(),transition: Transition.zoom);
                    print('go To Login Screen');
                  }
                },
              ),
              BuildMainButton(
                size: size.width,
                text: register,
                slideDirection: SlideDirection.LEFT,
                icon: Icons.arrow_back,
                textDirection: TextDirection.rtl,
                onButtonOpened: (val) {
                  if (val >= 0.8) {
                    Get.off(RegisterScreen(),transition: Transition.zoom);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildMainButton extends StatelessWidget {

  final double size;
  final String text;
  final SlideDirection slideDirection;
  final Function onButtonOpened;
  final IconData icon;
  final TextDirection textDirection;

  const BuildMainButton(
      {Key key, this.size, this.text, this.slideDirection, this.onButtonOpened, this.icon, this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding / 1.2),
      width: size * 0.8,
      height: size * 0.15,
      decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: K2ColorFBFBFB, width: 1.5)),
      child: SlideButton(
        slidingChild: BuildCoustomContainer(
          size: size,
          icon: icon,
        ),
        height: size * 0.15,
        backgroundChild: Center(
          child: Text(text),
          /*AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                text,
                textDirection: textDirection,
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ],
            isRepeatingAnimation: true,
            repeatForever: true,
          ),
          */
        ),
        backgroundColor: Colors.transparent,
        slidingBarColor: Colors.transparent,
        slideDirection: slideDirection,
        onButtonSlide: onButtonOpened,
      ),
    );
  }
}

class BuildCoustomContainer extends StatelessWidget {


  final double size;

  final IconData icon;

  const BuildCoustomContainer({Key key, this.size, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  size * 0.2,
      height:  size * 0.1,
      decoration: BoxDecoration(
        color: K1Color1A73CA,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Icon(
        icon,
        color: KWhiteColor,
      ),
    );
  }
}

