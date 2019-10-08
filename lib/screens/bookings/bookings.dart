import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/providers/provider.dart';
import 'package:zing_fitnes_trainer/components/Profile.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/screens/bookings/modules/bookings.dart';
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
    return TabBarView(
      children: <Widget>[Container(), Bookings()],
    );
  }
}
