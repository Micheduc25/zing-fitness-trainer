import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/providers/provider.dart';
import 'package:zing_fitnes_trainer/components/Profile.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import 'package:zing_fitnes_trainer/components/tabBar.dart';

class BookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => AppBarData(),
        )
      ],
      child: DefaultTabController(
        length: 2,
        child: MaterialApp(
          title: 'Bookings',
          home: Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              elevation: 0.0,
              iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
              backgroundColor: MyColors().white,
              title: Consumer<AppBarData>(
                builder: (context, data, _) => Center(
                  child: Text(
                    data.getTitle,
                    style: TextStyle(
                        color: MyColors().deepBlue,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 50),
                child: MyTabBar(),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )
              ],
            ),
            body: BookingsBody(),
          ),
        ),
      ),
    );
  }
}

class BookingsBody extends StatelessWidget {
  //this will be modified later to make the list dynamic
  @override
  Widget build(BuildContext context) {
    return Container(
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
