import 'package:calculate_calories/modules/home_screen/home_screen.dart';
import 'package:calculate_calories/modules/result/result.dart';
import 'package:calculate_calories/shared/components/components.dart';
import 'package:flutter/material.dart';

class finalResult extends StatefulWidget {

  final double result;

  finalResult({
    required this.result
});

  @override
  _finalResultState createState() => _finalResultState();
}

class _finalResultState extends State<finalResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xd0121923),
        title: Text(
          'Calculate Calories',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
            vertical: 50.0
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wp4915433-gym-weight-mobile-wallpapers.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              'Your Calories: ${widget.result.round()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'You need to take ${widget.result.round()} calories per day to achieve your goal',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: 80,
            ),
            defaultButton(
                function: ()
                {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => homeScreen()),
                        (route) => false
                    );
                  });
                },
                label: 'Recalculate',
              padding: 0.0
            ),
          ],
        ),
      ),
    );
  }
}
