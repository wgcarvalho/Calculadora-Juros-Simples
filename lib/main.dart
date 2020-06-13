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
  TextEditingController capital = new TextEditingController();
  TextEditingController taxa = new TextEditingController();
  TextEditingController mes = new TextEditingController();

  String resultado = "Resultado:";

  void calcular(){
    double capitalN = double.parse(capital.text);
    double taxaN = double.parse(taxa.text)/100;
    double mesN = double.parse(mes.text);

    double montante = capitalN + (capitalN*taxaN*mesN);

    setState(() {
      resultado = "O montante final será de ${montante.toStringAsPrecision(7)} reais ";
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcula de Juros Simples"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            controller: capital,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Insira o Capital Inicial:'),
          ),
          TextFormField(
            controller: taxa,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Insira a Taxa de Juros (mês):'),
          ),
          TextFormField(
            controller: mes,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Insira o periodo (meses):'),
          ),
          RaisedButton(
            onPressed: (){calcular();},
            child: Text("Calcular")
          ),
          Text(resultado),
        ],
      ),
    );
  }
}
