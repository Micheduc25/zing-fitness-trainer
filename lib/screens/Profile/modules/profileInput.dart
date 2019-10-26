import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ProfileInfoInput extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final initialValue;
  final Function() onClick;
  void Function(String) onChanged;
  ProfileInfoInput(
      {this.labelText,
      this.icon,
      this.initialValue,
      this.onClick,
      this.onChanged});
  final colors = MyColors();
  @override
  Widget build(BuildContext context) {
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
          initialValue: initialValue,
          onChanged: onChanged,
          validator: (value) {
            return null;
          },
          minLines: 1,
          maxLines: 5,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: onClick,
                icon: Icon(icon),
              ),
              contentPadding: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height / 40,
                  0,
                  MediaQuery.of(context).size.height / 40),
              alignLabelWithHint: true,
              labelText: labelText,
              labelStyle: TextStyle(color: colors.deepBlue),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: colors.inputBlue),
              ))),
    );
  }
}
