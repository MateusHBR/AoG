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
  var _gasCtrl = new MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    precision: 3,
  );
  var _alcCtrl = new MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    precision: 3,
  );
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar alcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).primaryColor, // utilizar a cor primaria
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Sucess(
                    reset: reset,
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
    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res > 0.66) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar Álcool!";
        }

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _alcCtrl = new MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: '.',
        precision: 3,
      );
      _gasCtrl = new MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: '.',
        precision: 3,
      );
      _completed = false;
      _busy = false;
    });
  }
}
