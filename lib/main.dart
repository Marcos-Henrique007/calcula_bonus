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
      home: const MyHomePage(title: 'Calculador de Bonus'),
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
  double bonus = 0.1;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite o Seu salário:',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      campo = value;
                    }
                  ),
                  
                  ElevatedButton(
                    onPressed: _calcularBonus,
                    child: Text("Calcular"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                    ),
                  ),
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
