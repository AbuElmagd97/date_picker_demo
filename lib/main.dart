import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'custom_date_picker.dart';
import 'custom_header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Date Picker Timeline Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CustomDatePickerController _controller = CustomDatePickerController();

  DateTime _selectedValue = DateTime.now();

  final days = DateTime.now().add(const Duration(days: 365)).day.toInt();

  var newDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.replay),
          onPressed: () {
            _controller.animateToSelection();
          },
        ),
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.blueGrey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You Selected:"),
              Text(
                _selectedValue.toString(),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              monthNameWidget(DateFormat('MMMM').format(_selectedValue)),
              Container(
                child: CustomDatePicker(
                  DateTime.now(),
                  dayTextStyle: TextStyle(color: Colors.black),
                  width: 60,
                  height: 80,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectedTextColor: Colors.white,

                  // inactiveDates: [
                  //   DateTime.now().add(Duration(days: 3)),
                  //   DateTime.now().add(Duration(days: 4)),
                  //   DateTime.now().add(Duration(days: 7))
                  // ],
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                  daysCount: 100 * 365,
                ),
              ),
            ],
          ),
        ));
  }

  Widget monthNameWidget(monthName) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (){
             setState(() {
               // int daysInMonth = DateTimeRange(
               //     start: _selectedValue,
               //     end: DateTime(_selectedValue.year, _selectedValue.month - 1))
               //     .duration
               //     .inDays;
               // newDate =  daysInMonth;
               // debugPrint("dd:$newDate");
             });
            },
              child: Icon(Icons.arrow_back_ios)),
          Text(
            monthName,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontStyle: FontStyle.italic,
            ),
          ),
          InkWell(
              onTap: (){
                // var month = DateTime(_selectedValue.year,_selectedValue.month + 1);
                // debugPrint("month$month");
                //
                // setState(() {});
              },
              child: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

}
