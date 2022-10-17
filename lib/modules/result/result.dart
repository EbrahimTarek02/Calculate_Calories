import 'package:calculate_calories/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../final_result/final_result.dart';

class result extends StatefulWidget {

  final double goal;

  result({
    required this.goal
});

  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {

  var height = TextEditingController();
  var weight = TextEditingController();
  var age = TextEditingController();
  var activityRate;
  late double result;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
        padding: EdgeInsetsDirectional.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wp4915433-gym-weight-mobile-wallpapers.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Follow the next steps:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                defaultTextFormField(
                    controller: height,
                    label: 'Height',
                    suffixLabel: 'cm',
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultTextFormField(
                    controller: weight,
                    label: 'Weight',
                    suffixLabel: 'kg',
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultTextFormField(
                    controller: age,
                    label: 'Age',
                    suffixLabel: 'years',
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                    validator: (value)
                    {
                      if(value == null){
                        return 'please select your activity rate';
                      }
                    },
                    value: activityRate,
                    iconEnabledColor: Colors.white,
                    iconSize: 25,
                    isExpanded: true,
                    dropdownColor: Colors.transparent,
                    hint: Text(
                      'Activity Rate' ,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    items: [1.2 , 1.4 , 1.6 , 1.8].map((e) => DropdownMenuItem(
                      child: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text("$e")
                      ) ,
                      value: e,)).toList(),
                    onChanged: (value){
                      setState(() {
                        activityRate =  value;
                      });
                    },
                ),
                SizedBox(
                  height: 100.0,
                ),
                defaultButton(
                    function: ()
                    {
                      if (formKey.currentState!.validate()){
                        setState(() {
                          result = (
                              (double.parse(weight.value.text) * 10) +
                              (double.parse(height.value.text) * 6.25) +
                              (double.parse(age.value.text)) +
                              5) * activityRate + (widget.goal);
                          print('result = ${result}');
                          print ('${widget.goal}');
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => finalResult(
                                result: result,
                              ))
                          );
                        });
                      }
                    },
                    label: 'CALCULATE',
                    backgroundColor: Colors.lightBlueAccent,
                    padding: 0.0
                ),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
