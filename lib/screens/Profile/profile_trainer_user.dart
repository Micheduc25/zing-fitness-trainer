
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/providers/profile_provider.dart';
import 'package:zing_fitnes_trainer/screens/Profile/edit_profile_trainer.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/pFootbg.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileTabBar.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileup.dart';
import 'package:zing_fitnes_trainer/screens/Profile/trainer_profile_model.dart';
import 'package:zing_fitnes_trainer/screens/Profile/views/tabBarviews.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ProfileTrainerUser extends StatelessWidget {
  ProfileTrainerUser({this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    var profileModel = Provider.of<TrainerProfileModel>(context);
    return
      profileModel != null ?
      Scaffold(

          appBar: AppBar(
            elevation: 0.0,
            iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
            backgroundColor: MyColors().white,
            title:  Text(
                "Profile",
                style: TextStyle(
                    color: MyColors().deepBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            centerTitle: true,

          ),
          body: DefaultTabController(length: 2, child: ProfilePageBody(profileModel,userId) ),
        ) : Container();
  }
}

class ProfilePageBody extends StatelessWidget {
  ProfilePageBody(this.profileModel,this.userId);
  final TrainerProfileModel profileModel;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
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
                                      imageUrl: profileModel.profilePicUrl??"",
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
                                    profileModel.name,
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
                                        profileModel.age,
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
                                return StreamProvider.value(
                                    value: ProfileProvider.instance()
                                        .streamUserCerts(userId),
                                    catchError: (context, error) {
                                      print(error);
                                    },
                                    child: EditProfileTrainer(userId: userId,trainerProfileModel: profileModel,));
                                //  child: ProfileRegularUser();
                              }),
                            );

                          },
                        ),
                      ],
                    ),
                  ),
                  ProfileTabBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  TabBarViews(userId: userId,profileModel: profileModel,)
                ],
              ),
            ),
            FootBgr(),
          ],
        ),
      ),
    );
  }
}
