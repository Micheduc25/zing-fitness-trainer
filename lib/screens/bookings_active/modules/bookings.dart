import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/Profile.dart';

class Bookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          Profile(
            name: "Ndjock Junior",
            experience: 4,
            paid: true,
            imageLink: "me.jpg",
          ),
          Divider(),
          Profile(
            name: "Tangu Achilis",
            experience: 6,
            paid: true,
            imageLink: "fam1.jpg",
          ),
          Divider(),
          Profile(
            name: "Akum Lesly",
            experience: 1,
            paid: true,
            imageLink: "fam3.jpg",
          ),
          Divider(),
          Profile(
            name: "Eviane Clara",
            experience: 3,
            paid: true,
            imageLink: "fam2.jpg",
          ),
          Divider(),
          Profile(
            name: "Olivain Afungchwi",
            experience: 7,
            paid: true,
            imageLink: "fam4.jpg",
          ),
          Divider(),
          Profile(
            name: "Swag Boy",
            experience: 8,
            paid: true,
            imageLink: "im4.png",
          ),
          Divider(),
          Profile(
            name: "The Babysitter",
            experience: 1,
            paid: true,
            imageLink: "babysitter1.jpg",
          ),
          Divider(),
        ],
      ),
    );
  }
}
