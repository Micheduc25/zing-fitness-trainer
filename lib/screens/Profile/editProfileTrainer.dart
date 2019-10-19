import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/components/button.dart';
import 'package:zing_fitnes_trainer/providers/profile_provider.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/pFootbg.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileInputField.dart';
import 'package:zing_fitnes_trainer/screens/Profile/profile_model.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import 'package:zing_fitnes_trainer/utils/validator.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class EditProfileTrainer extends StatelessWidget {
  EditProfileTrainer({this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    var profileModel = Provider.of<ProfileModel>(context);
    return profileModel == null ? Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
    ) :
    Scaffold(

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

        ),


        body:Container(
          color: MyColors().skyBlue,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                FormSection(userId,profileModel),

              ],
            ),
          ),
        )
    );
  }
}






class FormSection extends StatefulWidget {
     FormSection(this.userId,this.profileModel);
     final String userId;
     final ProfileModel profileModel;

  @override
  _FormSectionState createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {

  final GlobalKey<FormState>_regularFormKey = GlobalKey<FormState>();

  File file;
  var targetPath;
  Future<File> _imageFile;
  String profilePic;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }



  void _onImageButtonPressed(ImageSource source) async {

    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);

    });

  }

  Future<File> compressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, targetPath,
      quality: 88,

    );

    print(file.path);
    print(result.path);

    print(file.lengthSync());
    print(result.lengthSync());

    return result;
  }


  Widget _previewImage() {
    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            file = snapshot.data;
            print("image file "+snapshot.data.toString());
            return InkWell(
              onTap: () => _onImageButtonPressed(ImageSource.gallery),
              child:  Container(
                  padding: EdgeInsets.all(10),
                  width: 100,

                  height: 100,
                  child: ClipOval(child: Image.file(snapshot.data,fit: BoxFit.cover,))
              ),
            );
          } else if (snapshot.error != null) {
            //  showInSnackBar("Error Picking Image");

            return InkWell(
              onTap: () {
                _onImageButtonPressed(ImageSource.gallery);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.account_circle,size: 100,),
              ),
            );
          } else {
            //  showInSnackBar("You have not yet picked an image.");
            return InkWell(
              onTap: () {
                _onImageButtonPressed(ImageSource.gallery);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.account_circle,size: 100,),
              ),
            );
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child:Form(
            key: _regularFormKey,
            child:
            Center(
             child:  Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               _previewImage(),

                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

                ProfileInputField(
                  hintText: 'Mobile number',
                  icon: Icons.phone_iphone,

                  validator: (value){return null;},
                ),


                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),
///////////
/// as from here is the trainer info on the design sheet
///////////
                TrainerInfoInput(
                  labelText: 'Certificates',
                  icon: Icons.add_circle,
                ),

                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

                TrainerInfoInput(
                  labelText: 'Service area',
                ),

                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

                Container(
                 width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 7),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  

                  children: <Widget>[
                    RowTextInput(label:'Experince'),

                    Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

                    RowTextInput(label:'Session Rate'),
                  ],
                ) ,
               ),

               Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

              TrainerInfoInput(
               labelText: 'Specialty',
              ),

             
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

              //Notes(hintText:'Notes'),
            

              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

              Button(
                text:'Update' ,
                onClick: () async{
                  if(file != null)
    {


    var dir = await path_provider.getTemporaryDirectory();
    var targetPath = dir.absolute.path + "/temp.png";

    print("file image is" + file.path);
    compressAndGetFile(file, targetPath).then((File result) {
    print("result is" + result.path);

    ProfileProvider.instance().uploadImage(result).then((value){

    Map userData = Map<String,dynamic>();

    userData[Config.profilePicUrl] = value;
    userData[Config.phone]= "324974234";


    ProfileProvider.instance().saveUserData(widget.userId, userData).then((_){
    print("successfull");
    });

    });
    });

    }}





              ),

              
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/15)),
            
              FootBgr()
              

               


             
              ]
            ),
           )
          )
        ));
  }
}


///
/// This class containers a row and a textfield input
///
class RowTextInput extends StatelessWidget{
  final String label;
  final String initialValue;
  RowTextInput({this.label, this.initialValue});
  @override
  Widget build(BuildContext context)=>
      Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(label+ ' ', style: TextStyle(color:MyColors().deepBlue,)),
            SizedBox(
              width: MediaQuery.of(context).size.width/4,
              child: TextFormField(
                initialValue: initialValue,
                //keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  fillColor: MyColors().inputBlue,
                  filled: true,
                  contentPadding: EdgeInsets.only(bottom: 0)
                ),
              ),
            )
          ],
        );
}



///
///The class below is for editing the textfields under the trainerinfo
///
class TrainerInfoInput extends StatelessWidget{
  final String labelText;
  final IconData icon;
  final initialValue;
  final Function () onClick;
  TrainerInfoInput({this.labelText, this.icon, this.initialValue, this.onClick});
  final colors=MyColors();
  @override
  Widget build(BuildContext context){
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
          onChanged: (value){print(value);},
          validator: (value){return null;},
          minLines: 1,
          maxLines: 5,

          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: onClick,
                icon: Icon(icon),),
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





