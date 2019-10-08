import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  final int experience;
  final bool paid;
  final String imageLink;
  @override
  Profile(
      {Key key,
      @required this.name,
      @required this.experience,
      @required this.paid,
      this.imageLink})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(5),
      leading: CircleAvatar(
        radius: 27,
        backgroundImage: AssetImage("assets/" + this.imageLink),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              this.name,
              style: TextStyle(fontSize: 13),
            ),
          ),
          RichText(
            text: TextSpan(
                text: this.experience.toString() + "+ ",
                style: TextStyle(
                    color: Color.fromRGBO(0, 144, 109, 1), fontSize: 10),
                children: <TextSpan>[
                  TextSpan(
                      text: "yrs experience",
                      style: TextStyle(color: Colors.black))
                ]),
          ),
          paidWidget()
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.navigate_next,
          color: Colors.grey,
        ),
        onPressed: () {
          print("Hello");
        },
      ),
    );
  }

  //the below function determines if the paid icon has to be shown or not with the corresponding text
  Widget paidWidget() {
    if (this.paid) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.check_box,
            color: Color.fromRGBO(0, 144, 109, 1),
            size: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 3),
            child: Text(
              "Paid",
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
