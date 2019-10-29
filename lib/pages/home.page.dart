import 'package:alcool_gasolina/widgets/logo.widget.dart';
import 'package:alcool_gasolina/widgets/submit-form.dart';
import 'package:alcool_gasolina/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl = new MoneyMaskedTextController();

  var _alcCtrl = new MoneyMaskedTextController();

  var _busy = false;

  var _completed = false;

  var _resultText = "Compensa utilizar alcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).primaryColor, // utilizar a cor primaria
      body: ListView(
        children: <Widget>[
          Logo(),
          _completed
              ? Sucess(
                  reset: () {},
                  result: "$_resultText",
                )
              : SubmitForm(
                  alcCtrl: _alcCtrl,
                  gasCtrl: _gasCtrl,
                  busy: _busy,
                  submitFunc: calculate,
                ),
        ],
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;
    setState(() {
      _completed = false;
      _busy = true;
    });
  }
}
