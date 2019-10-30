import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/providers/profile_provider.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/certificate_model.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/user_certificate_model.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class CertificateScreen extends StatelessWidget {
  CertificateScreen(this.userId);
  final String userId;
  @override
  Widget build(BuildContext context) {
    var userCertModel = Provider.of<List<UserCertificateModel>>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
        backgroundColor: MyColors().white,
        title: Text(
          "Certificates",

          style: TextStyle(
              color: MyColors().deepBlue,
              fontSize: 17,
              fontWeight: FontWeight.w900),

        ),
        centerTitle: true,
      ),
      body: userCertModel != null ?SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return StreamProvider.value(value: ProfileProvider.instance().streamCertificateDocument(userCertModel[index].certId),
                catchError: (context,error){
                  print(error);
                }, child: Consumer<CertificateModel>(
                  builder: (_,value,child){
                    return value !=null ? Column(children: <Widget>[
                      ListTile(
                      title: Text(value.certName),
                      trailing: IconButton(icon: Icon(Icons.cancel,color: Colors.red,), onPressed: (){
                        ProfileProvider.instance().deleteCertificateDocument(value.certId, userId);
                      }),
                    ),
Divider(),

                    ],) : Container();
                  },
                ),);
            },
            itemCount: userCertModel.length,),
        ),
      ) : Container(),
    );
  }
}
