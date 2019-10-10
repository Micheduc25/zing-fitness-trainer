import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';


class DropDown extends StatelessWidget{
  //
  //this class takes two parameters
  //the label which serves as the content of the labeltext property
  // and item which is an array containing strings which are passed on as drop down items
  //
  final col=MyColors();
  final String label;
  final List<String> item;

  DropDown({this.label, this.item});

  @override
  Widget build(BuildContext context){
    return Container(
              width: MediaQuery.of(context).size.width -(MediaQuery.of(context).size.width / 7),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: col.inputBlue,
              ),

              child: DropdownButtonFormField(
                //
                //here we are to take the elements inside the item List and then perform a mapping on each to 
                //to form a DropdownMenuItem
                //
                     items: item.map((String value){
                       return DropdownMenuItem(child: Text(value), value: value,);}).toList(),
                     onChanged: null,

                     decoration: InputDecoration(
                      
                       contentPadding: EdgeInsets.fromLTRB(
                          10,
                          MediaQuery.of(context).size.height/90,
                          0,
                          MediaQuery.of(context).size.height/90
                        ),


                          labelText: label,
                          labelStyle: TextStyle(color: col.deepBlue),
                          border: InputBorder.none,
                     ),
                   )
    );
  }
}


