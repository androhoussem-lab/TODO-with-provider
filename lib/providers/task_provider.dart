import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';

class TaskProvider extends ChangeNotifier {

List<Task> tasks = new List();

void addToTask(String title , String description){
  tasks.add(Task(title,description));
  notifyListeners();
}
List<Task> getData(){
  return this.tasks;
}
int dataLength(){
  return tasks.length;
}
String getTitle(int index){
  return tasks[index].title;
}
String getDescription(int index){
  return tasks[index].description;
}

}