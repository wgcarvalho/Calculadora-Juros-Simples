import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: JS(),
  ));
}

class JS extends StatefulWidget {
  @override
  _JSState createState() => _JSState();
}

class _JSState extends State<JS> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController capital = new TextEditingController();
  TextEditingController taxa = new TextEditingController();
  TextEditingController mes = new TextEditingController();

  String resultado = "Resultado:";

  void calcular() {
    double capitalN = double.parse(capital.text);
    double taxaN = double.parse(taxa.text) / 100;
    double mesN = double.parse(mes.text);

    double montante = capitalN + (capitalN * taxaN * mesN);

    setState(() {
      resultado =
          "O montante final será de ${montante.toStringAsPrecision(7)} reais ";
    });
  }

  String validacao(String value) {
    if (value.isEmpty) {
      return "Insira o valor solicitado";
    } else {
      if (double.parse(value) <= 0) {
        return "o valor deve ser maior que zero";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calcula de Juros Simples"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: capital,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Insira o Capital Inicial:'),
                validator: (value) {
                  return validacao(value);
                },
              ),
              TextFormField(
                controller: taxa,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Insira a Taxa de Juros (mês):'),
                validator: (value) {
                  return validacao(value);
                },
              ),
              TextFormField(
                controller: mes,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Insira o periodo (meses):'),
                validator: (value) {
                  return validacao(value);
                },
              ),
              RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      calcular();
                    }
                  },
                  child: Text("Calcular")),
              Text(resultado),
            ],
          ),
        ));
  }
}
