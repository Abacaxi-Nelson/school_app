import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:apple_sign_in/apple_sign_in.dart' as ios;
import 'package:school_app/apple_sign_in_available.dart';
import 'package:school_app/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:school_app/screen/onboarding/screen1.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<void> _signInWithApple(BuildContext context) async {
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      final user = await authService.signInWithApple(scopes: [Scope.email]);
      print('uid: ${user.uid}');
      print('user: ${user.email}');
    } catch (e) {
      // TODO: Show alert here
      print("Error:");
      print(e);
    }
  }

  Widget getBody(BuildContext context) {
    List<Widget> pages = [
      Container(
        color: Color(0xff9188E5),
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Color(0xff9188E5),
      ),
    ];
    final controller = PageController(
      initialPage: 1,
    );
    final appleSignInAvailable = Provider.of<AppleSignInAvailable>(context, listen: false);

    return Stack(
      children: <Widget>[
        PageView(
          children: pages,
          controller: controller,
          scrollDirection: Axis.horizontal,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //height: 150.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(""),
                ),
                SmoothPageIndicator(
                    controller: controller, // PageController
                    count: pages.length,
                    effect: SlideEffect(
                        spacing: 8.0,
                        radius: 4.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Color(0xffC1BCF2),
                        activeDotColor: Colors.white), // your preferred effect
                    onDotClicked: (index) {}),
                SizedBox(height: 20.0),
                if (appleSignInAvailable.isAvailable)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ios.AppleSignInButton(
                      style: ios.ButtonStyle.black,
                      type: ios.ButtonType.signIn,
                      onPressed: () => _signInWithApple(context),
                    ),
                  ),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return Scaffold(backgroundColor: Color(0xff9188E5), body: getBody(context));
          }

          return Screen1Page();

          // redirect to Sashboard
          //return HomePage();
          print("Dashboard");
        } else {
          return Scaffold(
            backgroundColor: Color(0xff9188E5),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
