import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/components/button.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/pFootbg.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileInputField.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import 'package:zing_fitnes_trainer/utils/validator.dart';

class EditTrainerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Profile page",
        home: Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              elevation: 0.0,
              iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
              backgroundColor: MyColors().skyBlue,
              title: Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: MyColors().deepBlue,
                      fontSize: 17,
                      fontWeight: FontWeight.w900),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.power_settings_new,
                      color: MyColors().deepBlue),
                )
              ],
            ),
            body: EditTrainer()));
  }
}

class EditTrainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors().skyBlue,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
                child: CircleAvatar(
              radius: 40,
            )),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 50)),
            FormSection(),
          ],
        ),
      ),
    );
  }
}

class FormSection extends StatefulWidget {
  @override
  _FormSectionState createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final GlobalKey<FormState> _regularFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
            child: Form(
                key: _regularFormKey,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileInputField(
                          hintText: 'Trianer-name',
                          icon: Icons.account_circle,
                          validator: (value) {
                            return Validator().textValidator(value);
                          },
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50)),

                        ProfileInputField(
                          hintText: 'Mobile number',
                          icon: Icons.phone_iphone,
                          validator: (value) {
                            return null;
                          },
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50)),
///////////
                        /// as from here is the trainer info on the design sheet
///////////
                        TrainerInfoInput(
                          labelText: 'Certificates',
                          icon: Icons.add_circle,
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50)),

                        TrainerInfoInput(
                          labelText: 'Service area',
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50)),

                        Container(
                          width: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width / 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Slider(
                                activeColor: Colors.indigoAccent,
                                min: 0.0,
                                max: 15.0,
                                value: 10,
                                onChanged: (value){print(value);},
                              ),
                              RowTextInput(label: 'Experince'),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          50)),
                              RowTextInput(label: 'Session Rate'),
                            ],
                          ),
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50)),

                        TrainerInfoInput(
                          labelText: 'Specialty',
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50)),

                        //Notes(hintText:'Notes'),

                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50)),

                        Button(
                          text: 'Update',
                          onClick: () {
                            print('hi');
                          },
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 15)),

                        FootBgr()
                      ]),
                ))));
  }
}

///
/// This class containers a row and a textfield input
///
class RowTextInput extends StatelessWidget {
  final String label;
  final String initialValue;
  RowTextInput({this.label, this.initialValue});
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
              initialValue: initialValue,
              //keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  fillColor: MyColors().inputBlue,
                  filled: true,
                  contentPadding: EdgeInsets.only(bottom: 0)),
            ),
          )
        ],
      );
}

///
///The class below is for editing the textfields under the trainerinfo
///
class TrainerInfoInput extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final initialValue;
  final Function() onClick;
  TrainerInfoInput(
      {this.labelText, this.icon, this.initialValue, this.onClick});
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
          onChanged: (value) {
            print(value);
          },
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
