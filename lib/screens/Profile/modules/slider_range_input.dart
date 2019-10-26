
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class SliderRangeInput extends StatefulWidget{
  @override
  _SliderRangeInputState createState() => _SliderRangeInputState();
}

class _SliderRangeInputState extends State<SliderRangeInput> {
  double _sliderValue=5;
  @override
  Widget build(BuildContext context){
    return Slider.adaptive(
      value: _sliderValue,
      activeColor: MyColors().deepBlue,
      inactiveColor: MyColors().inputBlue,
      min: 0,
      max: 11,
      onChanged: (value){
        setState(() {
         _sliderValue=value; 
        });
      },
    );
  }
}