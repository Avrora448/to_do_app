import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_provider.dart';

class AddTaskScreen extends StatelessWidget{
   const AddTaskScreen({super.key});
   @override
  Widget build(BuildContext context) {
     String? newTaskTile;
     return Container(
       color: const Color(0xff757575),
       child: Container(
         padding: EdgeInsets.all(20.0),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20.0),
             topRight: Radius.circular(20.0),
           ),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Text(
               'Add task',
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 30.0,
                 color: Colors.purpleAccent,
               ),
             ),
             TextField(
               autofocus: true,
               textAlign: TextAlign.center,
               onChanged: (newText){
                 newTaskTile = newText;
               },
             ),
             ElevatedButton(
               style: ButtonStyle(
                 backgroundColor:
                   WidgetStateProperty.all(Colors.purpleAccent),
               ),
                 onPressed: (){
                 Provider.of<TaskProvider>(context, listen: false).addTask(newTaskTile!);
                 },
                 child: Text(
                     'Add',
                   style: TextStyle(
                     color: Colors.white,
                   ),
                 )
             )
           ],
         ),
       ),
     );
  }

}
