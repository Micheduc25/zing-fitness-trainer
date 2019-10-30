
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import 'package:zing_fitnes_trainer/components/button.dart';
import 'package:zing_fitnes_trainer/providers/profile_provider.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/pFootbg.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileInputField.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/row_text_input.dart';
import 'package:zing_fitnes_trainer/screens/Profile/profile.dart';
import 'package:zing_fitnes_trainer/screens/Profile/regular_profile_model.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import 'package:zing_fitnes_trainer/utils/validator.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
class EditProfileRegular extends StatefulWidget {
  EditProfileRegular({this.regularProfileModel});
  final RegularProfileModel regularProfileModel;
  @override
  _EditProfileRegularState createState() => _EditProfileRegularState();
}

class _EditProfileRegularState extends State<EditProfileRegular> {
  File file;
  var targetPath;
  Future<File> _imageFile;
  String profilePic;
  bool loading = false;

  final GlobalKey<FormState>_regularFormKey = GlobalKey<FormState>();
  final  userNameController = TextEditingController();
  final  locationController = TextEditingController();
  final  phoneController = TextEditingController();
  final  heightController = TextEditingController();
  final  ageController = TextEditingController();
  final  weightController = TextEditingController();
  final  notesController = TextEditingController();

  void _onImageButtonPressed(ImageSource source) async {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }



  Future<File> compressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
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
            print("image file " + snapshot.data.toString());
            return InkWell(
              onTap: () => _onImageButtonPressed(ImageSource.gallery),
              child: Container(
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  child: ClipOval(
                      child: Image.file(
                        snapshot.data,
                        fit: BoxFit.cover,
                      ))),
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
                child: Icon(
                  Icons.account_circle,
                  size: 100,
                ),
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
                child: Icon(
                  Icons.account_circle,
                  size: 100,
                ),
              ),
            );
          }
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    setState(() {
      profilePic = widget.regularProfileModel.profilePicUrl;
      userNameController.text = widget.regularProfileModel.name;
      phoneController.text = widget.regularProfileModel.phoneNumber;
      heightController.text = widget.regularProfileModel.height;
      ageController.text = widget.regularProfileModel.age;
      weightController.text = widget.regularProfileModel.weight;
      locationController.text = widget.regularProfileModel.location;


    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

          appBar: AppBar(
            elevation: 0.0,
            iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
            backgroundColor: MyColors().skyBlue,
            title: Text(
                "Profile",
                style: TextStyle(
                    color: MyColors().deepBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            centerTitle: true,
            ),




          body:Container(
            color: MyColors().skyBlue,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                  profilePic != null ?

                  ClipRRect(
                      borderRadius:
                      BorderRadius.circular(60),
                      child: CachedNetworkImage(
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                        imageUrl: profilePic??"",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, ex) =>
                            Icon(Icons.error),
                      )) :
                  _previewImage(),

            Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

            Container(

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


                                ProfileInputField(
                                  hintText: 'Name',
                                  controller: userNameController,
                                  icon: Icons.account_circle,
                                  validator: (value){return Validator().textValidator(value);},
                                ),

                                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),
                                ProfileInputField(
                                  hintText: 'Mobile Number',
                                  controller: phoneController,
                                  icon: Icons.phone,

                                  validator: (value){return Validator().textValidator(value);},
                                ),
                                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

                                ProfileInputField(
                                  hintText: 'Location',
                                  controller: locationController,
                                  icon: Icons.location_on,
                                  validator: (value){return Validator().textValidator(value);},
                                ),


                                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

                                Container(
                                  width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: <Widget>[
                                      RowTextInput(label:'Height',controller: heightController,validator: (value){return Validator().textValidator(value);},),
                                      RowTextInput(label:'Age',controller: ageController,validator: (value){return Validator().textValidator(value);},),
                                    ],
                                  ) ,
                                ),

                                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

                                Container(
                                  width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 7),
                                  child:RowTextInput(label:'Weight',controller: weightController,validator: (value){return Validator().textValidator(value);},),
                                ),



                                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),



                                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50)),

                              loading?
                                   Center(
                                child: CircularProgressIndicator(),
                              ) :
                              Button(
                                  text:'Update' ,
                                  onClick: () async{
    if (_regularFormKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      if (file != null){


        var dir = await path_provider.getTemporaryDirectory();
        var targetPath = dir.absolute.path + "/temp.png";

        print("file image is" + file.path);
        compressAndGetFile(file, targetPath)
            .then((File result) {
          print("result is" + result.path);

          ProfileProvider.instance()
              .uploadImage(result)
              .then((value) {
            Map userData = Map<String, dynamic>();

            userData[Config.profilePicUrl] = value;
            userData[Config.fullNames] = userNameController.text;
            userData[Config.location] = locationController.text;
            userData[Config.height] = heightController.text;
            userData[Config.age] = ageController.text;
            userData[Config.weight] = weightController.text;
            userData[Config.phone] = phoneController.text;

            ProfileProvider.instance()
                .saveUserData(widget.regularProfileModel.userId, userData)
                .then((_) {
              print("successfull");
              setState(() {
                loading = false;
              });
              Navigator.of(context).pop();
            });
          });
        });
      }
    }else
      {
        setState(() {
          loading = false;
        });
      }
                                  },
                                ),


                                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/15)),

                                FootBgr()






                              ]
                          ),
                        )
                    )
                ))

            ],
          ),)));

  }
}






///
///The class below is for the Notes Textfield
///
class Notes extends StatelessWidget{
  final String hintText;
  Notes({this.hintText});
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
          onChanged: (value){print(value);},
          validator: (value){return null;},
          minLines: 1,
          maxLines: 5,

          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height / 40,
                  0,
                  MediaQuery.of(context).size.height / 40),
              alignLabelWithHint: true,
            
              labelText: hintText,
              labelStyle: TextStyle(color: colors.deepBlue),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: colors.inputBlue),
              ))),
    );
  }
}





