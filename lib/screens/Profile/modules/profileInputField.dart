import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ProfileInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String Function(String) validator;
  final Function onChanged;
  final String initialValue;

  ProfileInputField(
      {this.icon, this.hintText, this.validator, this.onChanged, this.initialValue});
  @override
  Widget build(BuildContext context) {
    var colors = new MyColors();
    return Container(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 30,
        5,
        MediaQuery.of(context).size.width / 32,
        0,
      ),
      width: MediaQuery.of(context).size.width -
          (MediaQuery.of(context).size.width / 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: colors.inputBlue,
      ),




      child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue,

          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height / 40,
                  0,
                  MediaQuery.of(context).size.height / 40),
              alignLabelWithHint: true,
              icon: Icon(
                icon,
                size: MediaQuery.of(context).size.width / 15,
                color: colors.deepBlue,
              ),
              labelText: hintText,
              labelStyle: TextStyle(color: colors.deepBlue),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: colors.inputBlue),
              ))),
    );
  }
}
