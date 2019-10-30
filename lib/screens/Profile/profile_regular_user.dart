
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/screens/Profile/edit_profile_regular.dart';
import 'package:zing_fitnes_trainer/screens/Profile/edit_profile_trainer.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/pFootbg.dart';

import 'package:zing_fitnes_trainer/screens/Profile/regular_profile_model.dart';
import 'package:zing_fitnes_trainer/screens/Profile/views/tabBarviews.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ProfileRegularUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var regularProModel = Provider.of<RegularProfileModel>(context);
    return regularProModel != null ?Scaffold(

          appBar: AppBar(
            elevation: 0.0,
            iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
            backgroundColor: MyColors().white,
            title: Text(
                "Profile",
                style: TextStyle(
                    color: MyColors().deepBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),centerTitle: true,),


          body:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                  Container(
                  padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: MyColors().gray,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    DottedBorder(
                      //the image with the dotted border here
                      borderType: BorderType.Circle,
                      padding: EdgeInsets.all(8),
                      color: MyColors().deepBlue,
                      strokeWidth: 2,
                      dashPattern: [5, 8],
                      child:  ClipRRect(
                          borderRadius:
                          BorderRadius.circular(60),
                          child: CachedNetworkImage(
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.cover,
                            imageUrl: regularProModel.profilePicUrl??"",
                            placeholder: (context, url) =>
                             CircularProgressIndicator(),
                            errorWidget: (context, url, ex) =>
                             Icon(Icons.error),
                          ))
                    ),

                    //the name and age here in a column

                    Padding(
                      padding:  EdgeInsets.only(left: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            regularProModel.name,
                            style:
                            TextStyle(color: MyColors().textBlack, fontSize: 16),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Age: ",
                                style:
                                TextStyle(color: MyColors().textBlack, fontSize: 13),
                              ),
                              Text(
                                regularProModel.age,
                                style:
                                TextStyle(color: MyColors().textBlack, fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.topRight,
                  icon: Icon(
                    Icons.settings,
                    color: MyColors().deepBlue,
                    size: 15,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return EditProfileRegular(regularProfileModel: regularProModel,);
                      }),
                    );
                  },
                ),
              ],
            ),
          ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),

                      PersonalDetails(regularProModel)

                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height/20,
                ),


                FootBgr(),


              ],
            ),
          ),) :
    Scaffold(

        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
          backgroundColor: MyColors().white,
          title: Text(
            "Profile",
            style: TextStyle(
                color: MyColors().deepBlue,
                fontSize: 17,
                fontWeight: FontWeight.w900),
          ),centerTitle: true,),

     );



  }
}




class PersonalDetails extends StatelessWidget {
  PersonalDetails(this.regularProfileModel);
  final RegularProfileModel regularProfileModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //the gray container containing physical properties and their values
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: MyColors().gray,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _physicalItem("Height", regularProfileModel.height),
                  _physicalItem("Weight", regularProfileModel.weight+" Kg"),
                 // _physicalItem("HR max", "189"),
                //  _physicalItem("Type", "Crossfit"),
                ],
              ),
            ),
            //container ends here,

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                detailItem("Username", regularProfileModel.name),
                Divider(
                  color: MyColors().gray,
                  thickness: 2,
                ),
                detailItem("Email Id", regularProfileModel.email),
                Divider(
                  color: MyColors().gray,
                  thickness: 2,
                ),
                detailItem("Mobile no", regularProfileModel.phoneNumber),
                Divider(
                  color: MyColors().gray,
                  thickness: 2,
                ),
                detailItem("Location", regularProfileModel.location),
              ],
            )
          ]),
        ));
  }
}

Widget _physicalItem(property, value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(property, style: TextStyle(fontSize: 12)),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
      ),
      Text(value,
          style: TextStyle(
              color: MyColors().deepBlue,
              fontWeight: FontWeight.w900,
              fontSize: 14))
    ],
  );
}

Widget detailItem(String property, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          property,
          style: TextStyle(fontSize: 12, color: MyColors().textBlack),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: MyColors().textBlack),
        )
      ],
    ),
  );
}

