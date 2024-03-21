import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Тестовое задание'),
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
  TextEditingController text_in = TextEditingController();
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  String enteredText = 'Введите:';


  void Validator(){
    setState(() {
    if (text_in.text.isNotEmpty) {
        enteredText = text_in.text;
      }
    else(enteredText = 'Пусто');
    });
  }

  void clear_text(){
    setState(() {
      text_in.text ='';
      enteredText = 'Введите:';
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _BuidldText()

    );

  }

  Widget _BuidldText(){
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(width: 200.0,
            height: 50,),
        TextField(
          controller: text_in,
          decoration:  InputDecoration(
            suffixIcon: IconButton(icon: const Icon(Icons.clear),
              onPressed: () {
              clear_text();
              },
            ),
            labelText: 'Введите текст',
            hintText: '',
            filled: true,
            ),
          ),
          SizedBox(width: 200.0,
            height: 50,),
          Text(enteredText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20)),

          SizedBox(width: 200.0,
            height: 50,),
          SizedBox(width: 500.0,
            height: 50,
          child: ElevatedButton(
            style: style,
            onPressed: () {
              Validator();
            },
            child: Text('Выполнить'),
            ),
          ),
          SizedBox(width: 500.0,
            height: 50,
            child: ElevatedButton(
              style: style,
              onPressed: () {
                clear_text();
              },
              child: Text('Стереть Text'),
            ),
          ),
        ],
      )
    );
  }

}
