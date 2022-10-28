

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late double Gasolina;
  late double Etanol;
  var _Gasolina = MaskedTextController(mask: '0.00');
  var _Etanol = MaskedTextController(mask: '0.00');


  double? Calculo;



  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          backgroundColor:Colors.purple,
          title: Text(
            'Calculo de Etanol x Combustível',
            style: TextStyle(fontFamily: 'Anton',
              color: Colors.white,

            ),
          ),
          centerTitle: true,
        ),
      body: Center(
        child: Stack(
          children: [
            (Image.asset("assets/posto.jpg", fit: BoxFit.cover,height: 1000,
            )
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          TextFormField(
                            controller: _Gasolina,
                            decoration: const InputDecoration(
                              labelText: 'Gasolina',
                              labelStyle:TextStyle(
                                  color: Colors.purple,
                                fontSize: 20),
                              hintText: 'Insira seu preço',
                              hintStyle: TextStyle(color: Colors.purple),
                              suffixText: 'Reais',
                              counterText: '',
                              border: OutlineInputBorder( ),
                            ),
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            validator: (text) {
                              if (text == null || text.isEmpty)
                                return 'Campo obrigatório';
                              double? Gasolina = double.parse(text);
                              this.Gasolina = Gasolina;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(

                            controller: _Etanol,

                            decoration: const InputDecoration(
                              labelText: 'Etanol',
                              labelStyle: TextStyle(color: Colors.purple),
                              hintText: 'Insira seu preço',
                              hintStyle: TextStyle(color: Colors.purple),
                              suffixText: 'Reais',
                              counterText: '',
                              border:
                              OutlineInputBorder()
                            ),
                            maxLength:4,
                            keyboardType: TextInputType.number,
                            validator: (text) {
                              if (text == null || text.isEmpty)
                                return 'Campo obrigatório';
                              double? Etanol = double.parse(text);
                              this.Etanol = Etanol;
                            },

                          ),
                          const SizedBox(height: 16),

                          ElevatedButton(style: ElevatedButton.styleFrom(
                              primary: Colors.purple),
                            onPressed: () {
                            if (formKey.currentState!.validate()) {
                                setState(() {
                                  Calculo = Etanol / Gasolina;
                                  if (Calculo! > 0.70)
                                    print("Gasolina");
                                  else if (Calculo! < 0.70)
                                    print ("Etanol");
                                }
                                );
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(

                                    title: Text('(Obs) Se o valor for maior que 0.70 compensa Gasolina se for menor compensa Etanol:',
                                        style:
                                        TextStyle(
                                            fontFamily: 'Anton',
                                            color: Colors.blueAccent,
                                            fontSize: 20)
                                    ),
                                    content:
                                    Text( Calculo!.toStringAsFixed(1),
                                      textAlign: TextAlign.center ,
                                      style:TextStyle(color: Colors.blueAccent,
                                          fontSize: 40),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: Navigator.of(context).pop,
                                        child: Text('OK',
                                            style:TextStyle(color: Colors.blueAccent,
                                            fontSize: 30),),
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Text('Calcular',
                                style:TextStyle(color: Colors.white,
                                fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],

        )
      )

    );
  }
}
