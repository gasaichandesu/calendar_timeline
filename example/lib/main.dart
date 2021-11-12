import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.blue,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Color(0xFF333A47),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'),
        const Locale('en'),
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'SELECTED DATE: $_selectedDate',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          CalendarTimeline(
            scale: 0.8,
            offset: 20,
            locale: 'ru',
            initialDate: _selectedDate,
            dayWithEventsPredicate: (date) => date.day != 14,
            // selectableDayPredicate: (date) => date.day != 23,
            firstDate: DateTime.now().subtract(Duration(days: 10)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
            // dotsColor: Colors.white,
            // monthColor: Colors.white70,
            // dayColor: Colors.teal[200],
            // activeDayColor: Colors.white,
            // dayNameColor: Color(0xFF333A47),
            // activeBackgroundDayColor: Colors.redAccent[100],
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CupertinoButton(
                        color: Theme.of(context).backgroundColor,
                        child: Text(
                          'RESET',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => setState(
                          () => _resetSelectedDate(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
