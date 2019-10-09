import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/button.dart';
import 'package:zing_fitnes_trainer/components/footBg.dart';
import 'package:zing_fitnes_trainer/screens/Trainer_Info_add/modules/dropDown.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class TrainerInfoAdd extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: TrainerInfoAddHome(),
    );
  }
}



class TrainerInfoAddHome extends StatelessWidget{
  final col=MyColors();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Trainer Info',style: TextStyle(color: col.textBlack),),
        ),

        backgroundColor: col.skyBlue,
        elevation: 0,
      ),

      //
      //this is where the body starts
      //the body is a container with child ListView which inturn contains a Column
      //and the rest of the content are placed inside this column
      //
      body: Container(
        color: col.skyBlue,

        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                CircleAvatar(
                  backgroundImage: AssetImage('./assets/images/im4.png'),
                  radius: 35,
                ),


                Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/50),),

                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/1.845)
                  ),
                  width: MediaQuery.of(context).size.width/1.2,
                  

                  child:Column(
                    children: <Widget>[
                    /////////////////////////////////////////////////////////////////////////////////
                      DropDown(
                        label: 'Service area',
                        item: ['hello', 'how', 'are','you'],
                      ),


                      Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/100),),
                    /////////////////////////////////////////////////////////////////////////////////
                      DropDown(
                        label: 'Experience',
                        item: ['hello', 'how', 'are','you'],
                      ),


                      Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/100),),                        
                    /////////////////////////////////////////////////////////////////////////////////
                    /////this is where the date picker is implemented
                  
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color:col.inputBlue,
                        ),
                        
                        child: DateTimePickerFormField(
                          inputType: InputType.both,
                          editable: false,
                          resetIcon: null,
                      
                          decoration: InputDecoration(
                            labelText: 'Session Date',
                            labelStyle: TextStyle(color: col.deepBlue),
                            suffixIcon: Icon(Icons.date_range,color: col.deepBlue,),
                            contentPadding: EdgeInsets.fromLTRB(
                              10,
                              MediaQuery.of(context).size.height/34,
                              0,
                              MediaQuery.of(context).size.height/34),

                          alignLabelWithHint: true,

                        
                          border: InputBorder.none,
                          
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: col.inputBlue),
                          )
                          ),
                        )
        
                      ),

                      Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/100),),
                    /////////////////////////////////////////////////////////////////////////////////
                    DropDown(
                      label: 'Session Type',
                      item: ['hello', 'how', 'are','you'],
                    ),

                    /////////////////////////////////////////////////////////////////////////////////
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: true,
                          onChanged: (value){print('this is just a place holder');},
                          activeColor: col.deepBlue,
                        ),

                        Text('Accept policies')
                      ],
                    )
                    ],
                  )
                ),

                Button(text:'SIGN UP'),

                Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/120), ),

                FootBg(),
              ],
        ),
          ],
        )
      ),
    );
  }
}