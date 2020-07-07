import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/screens/new_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  TaskProvider provider = TaskProvider();
  @override
  void initState() {
    
     super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    final radius  = MediaQuery.of(context).size.width * 0.1 ;
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        elevation: 0,
        title: Text('TODO'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.only(top : 16.0 , bottom: 16.0),
            child: Column(
              children: <Widget>[
                Text(
                  formatted,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Current Time',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.only(topLeft: Radius.circular(radius) , topRight: Radius.circular(radius))),
              padding: EdgeInsets.only(top: 12),
              child: Padding(
                padding:  EdgeInsets.only(top : 18.0),
                child: Consumer<TaskProvider>(
                  builder: (context , value , child){
                    return ListView.builder(itemCount: value.dataLength() , itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value.getTitle(index) , style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      subtitle: Text(value.getDescription(index)),
                    );
                  });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(backgroundColor:Colors.lightBlue[900] ,child: Text('+' , style: TextStyle(fontSize: 24),),onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (context) => NewTaskScreen()));
      }),
    );
  }
}
