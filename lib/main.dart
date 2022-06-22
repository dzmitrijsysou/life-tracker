import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];
    List<List<int>> numbers = [];
    List<int> rowNumbers = [];

    Color _colorContainer = Colors.red;

    int startNumber = 0;
    int lengthRow = 5;

    for (int x = 0; x < 15; x++) {
      for (int y = startNumber; y < lengthRow + startNumber; y++) {
        rowNumbers.add(y);
      }
      startNumber = lengthRow + startNumber;
      numbers.add(rowNumbers);
      rowNumbers = [];
    }

    //print(numbers);

    rowChildren = numbers
        .map(
          (rows) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rows
                .map((nr) => Ink(
                        child: InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: _colorContainer,
                        child: Text(nr.toString()),
                      ),
                      onTap: () {
                        print(nr);
                        setState(() {
                          _colorContainer = _colorContainer == Colors.red ? Colors.blue : Colors.red;
                        });
                      },
                    )))
                .toList(),
          ),
        )
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("Life Tracker"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ));
  }
}
