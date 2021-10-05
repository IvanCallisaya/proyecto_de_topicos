import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() => runApp(new CalculadoraApp());

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suma',
      home: MiCalculadora(),
    );
  }
}

class MiCalculadora extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<MiCalculadora> {
  final controller_primero = TextEditingController();
  final controller_segundo = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  

  String muestreResultado = "";

  void calcularSuma() {
    if (my_form_key.currentState.validate()) {
      int sumaValor1 = int.parse(controller_primero.text);
      int sumaValor2 = int.parse(controller_segundo.text);
      int resultado = sumaValor1 + sumaValor2;
      setState(() {
      muestreResultado = "El resultado es: $resultado";
    });
    }


  }

   @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Color(0xFFf01DFD7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Form(
          key: my_form_key,
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[

                  //agregamos un Container
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 70,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                            child: TextFormField(
                              controller: controller_primero,
                              validator: (value) {
                                if (value.isEmpty) return "Digita el primer valor";
                              },
                              decoration: InputDecoration(
                                hintText: "Primer valor",
                                icon: Icon(Icons.calculate_outlined,
                                color: Colors.blueAccent)
                              ),
                              keyboardType: TextInputType.number,
                            ),
                        ),
                        Divider(),
                        Container(
                          width: 300,
                          height: 70,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                            child: TextFormField(
                              controller: controller_segundo,
                              validator: (value) {
                                if (value.isEmpty) return "Digita el segundo valor";
                              },
                              decoration: InputDecoration(
                                hintText: "Segundo Valor",
                                icon: Icon(Icons.calculate,
                                color: Colors.blueAccent)
                              ),
                              keyboardType: TextInputType.number,
                            ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: calcularSuma ,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.blueAccent,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[Icon(Icons.add), Text('Sumar')],
                          ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 40.0,
                  ),
                  //caja de resultado
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF607EE9), Color(0xFFFFFFFF8)]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                      //creamos resultado del TextFormField
                      child: Center(
                        child: Text(
                          muestreResultado,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                  ),
                ],
              ))),
    );
  }
}
