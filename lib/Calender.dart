import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calender',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, primaryColor: Colors.deepPurple),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override 
  __HomePageState createState() =>  __HomePageState();
  }

class __HomePageState extends State<HomePage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  TextEditingController _eventController;
  List<dynamic> _selectedEvents;
  SharedPreferences prefs;

  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
  }

Map<String ,dynamic> encodeMap (Map <String,dynamic> map)
{
  Map<String ,dynamic> newMap ={};
  map.forEach((key, value) {
    newMap[key.toString()] = map[key];
  });
  return newMap;
}
Map<DateTime ,dynamic> decodeMap (Map <DateTime,dynamic> map)
{
  Map<DateTime ,dynamic> newMap ={};
  map.forEach((key, value) {
    newMap[DateTime.parse(key.toIso8601String())] = map[key];
  });
  return newMap;
}

  @override 
  Widget build(BuildContext context){
    var selectedEvents = _selectedEvents;
    return Scaffold(appBar: AppBar(
      title: Text("Calender"),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            events: _events,
            initialCalendarFormat: CalendarFormat.week,
            calendarStyle: CalendarStyle(
              todayColor: Colors.red,
              selectedColor: Colors.blueAccent,
              todayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white
              ) 
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (date , events){
              setState(() {
                _selectedEvents = events;
              });
            },
            calendarController: _controller,
            ),
        ],),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _showAddDialog,
    ),);
  }

_showAddDialog(){
  if(_controller.isToday(_controller.selectedDay) == true)
  {
    showDialog(context: context,
    builder:(context) =>AlertDialog(
    content: new Text(
      "Present",
    ),
    actions: <Widget>[
      FlatButton(
        child: Text("Save"),
        onPressed: (){
          setState(() {
          if(_events[_controller.selectedDay] != null){
            _events[_controller.selectedDay].add("Present");
          }
          else{
            _events[_controller.selectedDay] = ["Present"];
          }
          Navigator.pop(context);
          });
        },
      )
    ]
  )
  );
}
else {
  showDialog(context: context,
    builder:(context) =>AlertDialog(
    content: new Text(
      "Select today's date",
    ),
    actions: <Widget>[
      FlatButton(
        child: Text("Go back"),
        onPressed: (){
          Navigator.pop(context);
        },
      )
    ]
  )
  );
}

}

}