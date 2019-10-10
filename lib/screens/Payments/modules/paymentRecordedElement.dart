import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
///This is the element that holds user info in Payment History and it is made up of a Row 
///the Row has two children which are all Rows, of which
///the first Row two children, a CircleAvatar and a column holding name and date time
///the second Row has Two text children
////////////////////////////////////////////////////////////////////////////////////////////////////////////
class PaymentRecordedElement extends StatelessWidget{
  final String profilePic;
  final String userName;
  final String date;
  final String amount;
  final col=MyColors();
  PaymentRecordedElement({this.profilePic, this.userName, this.date, this.amount});

  @override
  Widget  build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height/200,
        horizontal: MediaQuery.of(context).size.width/25,
        ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,


      children: <Widget>[
        //
        //this is the first child with the circleAvatar, username and date time
        //
        Row(
          children: <Widget>[
            CircleAvatar(),
            
            Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/100),),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(userName),
                Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/200),),
                Text(date, style: TextStyle(fontSize: 9),),
              ],
            ) 
          ],
        ),


      //
      //this is the first child with the Debited text and the amount, 
      //there is a padding between the two Text widgets
      //
        Row(
          children: <Widget>[
            Text('Debited', style: TextStyle(fontSize: 10)),

            Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/25),),

            Text('\$ '+amount, style: TextStyle(color:col.deepBlue))
          ],
        ),
      ],

    ),
    );
  }
}