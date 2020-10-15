import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:school_app/auth/phone_auth/get_phone.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> pages = [
    Container(
      color: Color(0xff9188E5),
    ),
    Container(
      color: Color(0xff9188E5),
    ),
    Container(
      color: Color(0xff9188E5),
    ),
  ];
  static final controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9188E5),
      body: Stack(
        children: <Widget>[
          PageView(
            children: pages,
            controller: controller,
            scrollDirection: Axis.horizontal,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0), //EdgeInsets.all(8.0),
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0), side: BorderSide(color: Colors.white)),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15.0),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
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
                  FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                    color: Color(0xffFFCA5D),
                    textColor: Color(0xff1F1E2C),
                    padding: EdgeInsets.all(15.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhoneAuthGetPhone()),
                      );
                    },
                    child: Text(
                      "Démarrer",
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
