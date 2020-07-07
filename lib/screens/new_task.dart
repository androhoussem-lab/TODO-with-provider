import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/screens/home_screen.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  NewTaskState createState() => NewTaskState();
}

class NewTaskState extends State {
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text('New Task'),
        centerTitle: true,
      ),
      body: Form(
        autovalidate: _validate,
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: _titleController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Task title is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    controller: _descriptionController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Task description is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: MaterialButton(
                      child: Text(
                        'CREATE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      color: Colors.lightBlue[900],
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          setState(() {
                            _validate = true;
                          });
                        } else {
                          Provider.of<TaskProvider>(context , listen: false).addToTask(
                              _titleController.text,
                              _descriptionController.text);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => HomePage()));
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
