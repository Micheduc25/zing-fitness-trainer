import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:zing_fitnes_trainer/components/button.dart';
import 'package:zing_fitnes_trainer/components/footBg.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class EmailVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyEmailCheckout(),
    );
  }
}

class MyEmailCheckout extends StatelessWidget {
  final col = MyColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: col.skyBlue,
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height/1.3,

                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width / 15,
                          MediaQuery.of(context).size.height / 15,
                          MediaQuery.of(context).size.width / 15,
                          0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Email Verification',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: col.textBlack,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 140),
                          ),

                          Center(
                            child: Image.asset(
                              './assets/images/letter.png',
                              width: MediaQuery.of(context).size.width / 2.2,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 90),
                          ),

                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width -
                                  (MediaQuery.of(context).size.width / 2.9),
                              child: Text(
                                'Enter the Verification code that we have sent to your registed email id',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: col.white),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 70),
                          ),

          //four inputs is the class holding the four white input boxes
                        
                          PinCodeTextField(
                             autofocus: false,
                
                            hideCharacter: true,
                            highlight: true,
                            highlightColor: Colors.blue,
                            defaultBorderColor: Colors.transparent,
                            hasTextBorderColor: Colors.transparent,
                            maxLength: 4,
                            maskCharacter: "👀",
                            pinBoxHeight: MediaQuery.of(context).size.height / 10,
                            pinBoxWidth:MediaQuery.of(context).size.width / 5.19 ,
                            pinBoxColor: col.inputBlue,
                            pinBoxRadius: 10,
                            

                            onTextChanged: (text) {
                              print(text);
                            },

                            onDone: (text){
                              print("DONE $text");
                            },
                            pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                            wrapAlignment: WrapAlignment.start,
                            pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                            pinTextStyle: TextStyle(fontSize: 20.0),
                            pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                            pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 15),
                          ),

                          Button(
                            text: 'SUBMIT',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 120),
                          ),
                        ],
                      )),

                  //this is for the footer element
                  FootBg(),
                ],
              )
            ],
          )),
    );
  }
}

/*class FourInputs extends StatelessWidget {
  final col = MyColors();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        //first input field
        Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              color: col.inputBlue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            )),

//second input field
        Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              color: col.inputBlue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            )),

//third inputfield

        Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              color: col.inputBlue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            )),

//last input field
        Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              color: col.inputBlue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            )),
      ],
    );
  }
}*/
