import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class PasswordInputfield extends StatefulWidget {
   IconData icon;
   String hintText;
   String Function(String) validator;
   Function onChanged;
  

  PasswordInputfield(
      {this.icon, this.hintText, this.validator, this.onChanged});

  @override
  _PasswordInputfieldState createState() => _PasswordInputfieldState();
}

class _PasswordInputfieldState extends State<PasswordInputfield> {
  IconData suffixIcon=Icons.visibility;
  bool hide=true;
  @override
  Widget build(BuildContext context) {
    var colors = new MyColors();
    return Row(
      children: <Widget>[
        Container(
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
              onChanged: widget.onChanged,
              validator: widget.validator,
              obscureText: hide,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                      0,
                      MediaQuery.of(context).size.height / 40,
                      0,
                      MediaQuery.of(context).size.height / 40),
                  alignLabelWithHint: true,

                  suffixIcon: IconButton(icon:
                   Icon(suffixIcon, color: colors.deepBlue),
                   onPressed: (){
                     setState(() {
                       if(hide==false){
                         hide=true;
                         suffixIcon=Icons.visibility;
                       }else{
                         suffixIcon=Icons.visibility_off;
                         hide=false;
                       }
                      
                     });
                   },
                  ),

                  icon: Icon(
                    widget.icon,
                    size: MediaQuery.of(context).size.width / 15,
                    color: colors.deepBlue,
                  ),
                  labelText: widget.hintText,
                  labelStyle: TextStyle(color: colors.deepBlue),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: colors.inputBlue),
                  ))),
        ),


        //IconButton(icon: Icon(Icons.remove_red_eye),)
      ],
    );
  }
}
