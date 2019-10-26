
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class SliderRangeInput extends StatefulWidget{
  final double sliderValue;
  void Function (double) onChanged;
  SliderRangeInput({this.sliderValue, this.onChanged});
  @override
  _SliderRangeInputState createState() => _SliderRangeInputState();
}

class _SliderRangeInputState extends State<SliderRangeInput> {
  double _sliderValue;
  @override
  void initState() {
    _sliderValue=widget.sliderValue;
    super.initState();
  }
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

      onChangeEnd: widget.onChanged,
    );
  }
}