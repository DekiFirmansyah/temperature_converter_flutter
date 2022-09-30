import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //var listItem = ["Kelvin", "Reamur"];
  final myController = TextEditingController();
  double _inputUser = 0;
  double _kelvin = 0.0;
  double _reamor = 0.0;
  double _fahrenheit = 0.0;

  myConvert() {
    setState(() {
      _inputUser = double.parse(myController.text);
      _kelvin = (4 / 5) * _inputUser;
      _reamor = ((9 / 5) * _inputUser) + 32;
      _fahrenheit = _inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conventer Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyConverter"),
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      controller: myController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        hintText: "Input Temperature in Celcius",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FloatingActionButton(
                      onPressed: myConvert(),
                      tooltip: 'Convert',
                      child: const Icon(Icons.ac_unit),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Kelvin",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$_kelvin',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Reamor",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$_reamor',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Fahrenheit",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$_fahrenheit',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /* Container(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                              value: "Kelvin",
                              child: Container(child: Text("Kelvin"))),
                          DropdownMenuItem(
                              value: "Reamur",
                              child: Container(child: Text("Reamur"))),
                        ],
                        value: null,
                        onChanged: (String changeValue) {},
                      ),
                      // ignore: prefer_const_constructors
                      Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12.0),
                        child: const Text(
                          'Timnas Garuda TC Di Eropa',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'open sans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
