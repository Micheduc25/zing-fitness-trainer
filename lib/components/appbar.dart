import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/components/tabBar.dart';
import 'package:zing_fitnes_trainer/providers/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Color.fromRGBO(0, 144, 109, 1),
              ),
              onPressed: () {},
            ),
            Consumer<AppBarData>(
              builder: (context, data, _) => Text(
                data.getTitle,
                style: TextStyle(
                    color: Color.fromRGBO(0, 144, 109, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(0, 144, 109, 1),
                size: 27,
              ),
              onPressed: () {},
            ),
          ],
        ),
        MyTabBar()
      ],
    ));
  }
}
