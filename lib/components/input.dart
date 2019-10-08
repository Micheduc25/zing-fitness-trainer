import 'package:flutter/material.dart';

class Input_field extends StatelessWidget{
  final IconData icon;
  final String hintText;
  Input_field({this.icon, this.hintText});
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.fromLTRB( 
        MediaQuery.of(context).size.width/30 ,
        0,
        MediaQuery.of(context).size.width/32,
        0,
      ),


      
      width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color:Color(0xff6bd4ff),
      ),

      child: TextField(
        decoration:InputDecoration(
          icon: Icon(icon,size: MediaQuery.of(context).size.width/15, color: Color(0xff2f00ad),),
          labelText: hintText,
          labelStyle: TextStyle(color:Color(0xff2f00ad),),
          border:InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color:Color(0xff6bd4ff)),
          )
        )
      ),


    );
  }
}