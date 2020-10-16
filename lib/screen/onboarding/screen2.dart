import 'package:flutter/material.dart';
import 'package:school_app/widget/textfield.dart';
import 'package:school_app/widget/button.dart';

class Screen2Page extends StatefulWidget {
  @override
  _Screen2PageState createState() => _Screen2PageState();
}

class _Screen2PageState extends State<Screen2Page> {
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

  //https://data.education.gouv.fr/explore/dataset/fr-en-adresse-et-geolocalisation-etablissements-premier-et-second-degre/api/?disjunctive.nature_uai&disjunctive.nature_uai_libe&disjunctive.code_departement&disjunctive.code_region&disjunctive.code_academie&disjunctive.secteur_prive_code_type_contrat&disjunctive.secteur_prive_libelle_type_contrat&disjunctive.code_ministere&disjunctive.libelle_ministere&location=3,18.51593,-3.64035&basemap=jawg.streets&dataChart=eyJxdWVyaWVzIjpbeyJjb25maWciOnsiZGF0YXNldCI6ImZyLWVuLWFkcmVzc2UtZXQtZ2VvbG9jYWxpc2F0aW9uLWV0YWJsaXNzZW1lbnRzLXByZW1pZXItZXQtc2Vjb25kLWRlZ3JlIiwib3B0aW9ucyI6eyJkaXNqdW5jdGl2ZS5uYXR1cmVfdWFpIjp0cnVlLCJkaXNqdW5jdGl2ZS5uYXR1cmVfdWFpX2xpYmUiOnRydWUsImRpc2p1bmN0aXZlLmNvZGVfZGVwYXJ0ZW1lbnQiOnRydWUsImRpc2p1bmN0aXZlLmNvZGVfcmVnaW9uIjp0cnVlLCJkaXNqdW5jdGl2ZS5jb2RlX2FjYWRlbWllIjp0cnVlLCJkaXNqdW5jdGl2ZS5zZWN0ZXVyX3ByaXZlX2NvZGVfdHlwZV9jb250cmF0Ijp0cnVlLCJkaXNqdW5jdGl2ZS5zZWN0ZXVyX3ByaXZlX2xpYmVsbGVfdHlwZV9jb250cmF0Ijp0cnVlLCJkaXNqdW5jdGl2ZS5jb2RlX21pbmlzdGVyZSI6dHJ1ZSwiZGlzanVuY3RpdmUubGliZWxsZV9taW5pc3RlcmUiOnRydWV9fSwiY2hhcnRzIjpbeyJhbGlnbk1vbnRoIjp0cnVlLCJ0eXBlIjoibGluZSIsImZ1bmMiOiJBVkciLCJ5QXhpcyI6ImNvb3Jkb25uZWVfeCIsInNjaWVudGlmaWNEaXNwbGF5Ijp0cnVlLCJjb2xvciI6IiNBRjE5NzQifV0sInhBeGlzIjoiZGF0ZV9vdXZlcnR1cmUiLCJtYXhwb2ludHMiOiIiLCJ0aW1lc2NhbGUiOiJ5ZWFyIiwic29ydCI6IiJ9XSwiZGlzcGxheUxlZ2VuZCI6dHJ1ZSwiYWxpZ25Nb250aCI6dHJ1ZX0%3D

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
                        Text('Super ! Dans quelle école est tu ?',
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
