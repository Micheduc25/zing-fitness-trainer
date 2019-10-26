import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class RowTextInput extends StatelessWidget {
  final String label;
  final String Function (String) validator;
  void Function (String) onChanged;
  final String initialValue;
  RowTextInput({this.label, this.initialValue, this.validator});
  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(label + ' ',
              style: TextStyle(
                color: MyColors().deepBlue,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: TextFormField(
              validator: validator,
              onChanged: onChanged,
              initialValue: initialValue,
              //keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  fillColor: MyColors().inputBlue,
                  filled: true,
                  contentPadding: EdgeInsets.only(bottom: 0, top: 5)),
            ),
          )
        ],
      );
}

class RowTextInputForRate extends StatelessWidget {
  final String label;
  final String Function (String) validator;
  void Function (String) onChanged;
  final String initialValue;
  RowTextInputForRate({this.label, this.initialValue, this.validator, this.onChanged});
  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            label + ' ',
            style: TextStyle(
              color: MyColors().deepBlue,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: TextFormField(
              validator: validator,
              onChanged: onChanged,
              initialValue: initialValue,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                fillColor: MyColors().inputBlue,
                filled: true,
                contentPadding: EdgeInsets.only(bottom: 0, top: 5),
                border: InputBorder.none,
              ),
            ),
          ),
          Text('\$', style: TextStyle(color: MyColors().deepBlue, fontSize: 25))
        ],
      );
}
