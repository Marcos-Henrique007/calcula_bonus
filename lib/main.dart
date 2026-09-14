import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcula Bônus',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.lightGreen),
      ),
      home: const MyHomePage(title: 'Calculador de Bônus'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double bonus = 0.05;
  String campo = '';
  String resultado = '';

  void _calcularBonus() {
    double? salario = double.tryParse(campo);

    if (salario == null) {
      setState(() {
        resultado = 'Valor inválido';
      });
      return;
    }

    double calculo = salario * bonus;
    setState(() {
      resultado = calculo.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),

                  Image.asset(
                      "assets/images/bonus.png",
                      width: 300,
                      height: 300,
                  ),

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite o seu salário:',
                      ),
                      onChanged: (value) {
                        campo = value;
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _calcularBonus,
                    child: Text("Calcular"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text('O bônus é de: R\$ $resultado'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
