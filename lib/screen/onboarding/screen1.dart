import 'package:flutter/material.dart';
import 'package:school_app/widget/textfield.dart';
import 'package:school_app/widget/button.dart';

class Screen1Page extends StatefulWidget {
  @override
  _Screen1PageState createState() => _Screen1PageState();
}

class _Screen1PageState extends State<Screen1Page> {
  final myControllerNom = TextEditingController();
  final myControllerPrenom = TextEditingController();
  bool isPrenomOk = false;
  bool isNomOk = false;

  @override
  void dispose() {
    myControllerNom.dispose();
    myControllerPrenom.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myControllerNom.addListener(_getNomValue);
    myControllerPrenom.addListener(_getPrenomValue);
  }

  _getNomValue() {
    setState(() {
      isNomOk = myControllerNom.text.length >= 3;
    });
  }

  _getPrenomValue() {
    setState(() {
      isPrenomOk = myControllerPrenom.text.length >= 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff9188E5),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), //const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0), //const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 40.0),
                        Text('C\'est parti ! Comment est-ce que tu t\appelles ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white)),
                        SizedBox(height: 20.0),
                        CustomTextField(
                          suffixIcon: isNomOk,
                          keyboardType: TextInputType.name,
                          inputFormatters: [],
                          hintText: "Julien",
                          controller: myControllerPrenom,
                        ),
                        SizedBox(height: 5.0),
                        CustomTextField(
                          suffixIcon: isPrenomOk,
                          keyboardType: TextInputType.name,
                          inputFormatters: [],
                          hintText: "Dupuy",
                          controller: myControllerNom,
                        ),
                      ],
                    ),
                  )),
                  Text(
                      'lorem ipsum; lorem ipsum  lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0, color: Colors.white)),
                  SizedBox(height: 20.0),
                  CustomButton(
                    borderColor: Colors.transparent,
                    color: !(isNomOk && isPrenomOk) ? Colors.white.withAlpha(50) : Color(0xffFFCA5D),
                    color2: !(isNomOk && isPrenomOk) ? Color(0xff0D0A06).withAlpha(50) : Color(0xff0D0A06),
                    label: "Continuer",
                    onPressed: () async {
                      //if (isNomOk && isPrenomOk) {

                      //}
                    },
                  ),
                  SizedBox(height: 10.0),
                ])));
  }
}
