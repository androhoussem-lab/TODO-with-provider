import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(primaryColorLight: Colors.lightBlue[900],),
       home: ChangeNotifierProvider(
         create: (context) => TaskProvider(),
         child: HomePage()
         ),
     );
    
  }

}