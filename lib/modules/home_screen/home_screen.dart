import 'package:calculate_calories/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../result/result.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {


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
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/wp4915433-gym-weight-mobile-wallpapers.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 160.0,
                  start: 20.0
                ),
                child: Text(
                  'Let\'s start with your goal:',
                  style: TextStyle(
                    color: Color(0xd0121923),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              defaultButton(
                  label: 'Lose Weight',
                  function: ()
                {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => result(
                          goal: -500.0,
                        ),
                        )
                    );
                  });
                }
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                  label: 'Maintain Weight',
                  function: ()
                  {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => result(
                          goal: 0.0,
                        ),
                        )
                      );
                    });
                  }
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                  label: 'Gain Weight',
                  function: ()
                  {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => result(
                            goal: 500.0,
                          ),
                          )
                      );
                    });
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
