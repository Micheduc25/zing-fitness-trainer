import 'package:flutter/material.dart';

class FootBgr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.105;
    return Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: size * 0.8,
                    child: Image.asset("assets/images/leftTree.png"),
                  ),
                  Transform.translate(
                    offset: Offset(-17, 0),
                    child: SizedBox(
                      width: size,
                      child: Image.asset("assets/images/runingWomanW.png"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: size * 1.2,
                  child: Image.asset("assets/images/yogaWoman.png"),
                ),
                SizedBox(
                  width: size * 1.2,
                  child: Image.asset("assets/images/treeRight.png"),
                ),
              ],
            )
          ],
        ));
  }
}
