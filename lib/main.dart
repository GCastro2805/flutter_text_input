

/* ---------------------
  Captura de Texto
  GACC 201912191246
  --------------------- */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            title: 'Retrieve Text Input',
            home: MyCustomForm(),
        );
    }
}

// Define un widget de formulario personalizado
class MyCustomForm extends StatefulWidget{
    @override
    _MyCustomFormState createState() => _MyCustomFormState();
}
// Define una clase de estado correspondiente. Esta clase contendrá los datos relacionados con nuestro formulario
class _MyCustomFormState extends State<MyCustomForm>{
//Crea un controlador de texto. Lo usaremos para recuperar el valor actual del TextField!
final myController = TextEditingController();
@override
    void initState(){
    super.initState();
    myController.addListener(_printLatestValue);
}
@override
    void dispose(){
    //Limpia el controlador cuando el Widget se elimine del árbol de widgets
    //Esto también elimina el listener _printLatestValue.
    myController.dispose();
    super.dispose();
}
_printLatestValue(){
    print('Second text field: ${myController.text}');
}
@override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Retrieve Text Input'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: <Widget>[
                    TextField(
                        onChanged: (text){
                            print('First text field: $text');
                        },
                    ),
                    TextField(
                        controller: myController,
                    ),
                ],
            ),
        ),
    );
  }
}



