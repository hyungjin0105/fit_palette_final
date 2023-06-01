import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:water_bottle/water_bottle.dart';
import 'package:calendar_agenda/calendar_agenda.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final plainBottleRef = GlobalKey<WaterBottleState>();
  var waterLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    final plain = WaterBottle(
      key: plainBottleRef,
      waterColor: Colors.blue,
      bottleColor: Colors.lightBlue,
      capColor: Colors.blueGrey,
    );

    final bottle = Center(
      child: SizedBox(
        width: 100,
        height: 150,
        child: plain,
      ),
    );

    final waterSlider = Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.opacity),
          SizedBox(width: 10),
          Expanded(
            child: Slider(
              value: waterLevel,
              max: 1.0,
              min: 0.0,
              onChanged: (value) {
                setState(() {
                  waterLevel = value;
                  plainBottleRef.currentState?.waterLevel = waterLevel;
                });
              },
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          CalendarAgenda(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 140)),
            lastDate: DateTime.now().add(Duration(days: 4)),
            onDateSelected: (date) {
            print(date);
            },
          ),
          SleekCircularSlider(
            appearance: CircularSliderAppearance(),
            onChange: (double value) {
            },
          ),
          bottle,
          waterSlider,
        ],
      ),
    );
  }
}
