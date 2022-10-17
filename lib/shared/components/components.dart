import 'package:flutter/material.dart';

Widget defaultButton({
  required Function function,
  required String label,
  Color backgroundColor = Colors.transparent,
  double padding = 20.0
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: backgroundColor),
        onPressed: () {
          function();
        },
        child: Text(
          '${label}',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required String label,
  required String suffixLabel,
}) => TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 15.0),
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text(
            '${label}',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          focusColor: Colors.white,
          filled: true,
          suffixText: '${suffixLabel}',
          suffixStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0)),
          cursorColor: Colors.white,
          validator: (value){
            if(value!.isEmpty)
              return '${label} must not be empty';
            if(label == 'Height' && (double.parse(value) < 50 || double.parse(value) > 230))
              return 'Please enter a valid height';
            if(label == 'Weight' && (double.parse(value) < 30 || double.parse(value) > 500))
              return 'Please enter a valid weight';
            if(label == 'Age' && (double.parse(value) < 18 || double.parse(value) > 100))
              return 'Please enter a valid age';
          },
    );
