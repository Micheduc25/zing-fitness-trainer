
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colors = MyColors();
    var size = MediaQuery.of(context).size;
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      Positioned(
        top: 0,
        child: Container(
          decoration: BoxDecoration(
              color: colors.gray,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.only(top: 10, bottom: 30, left: 10, right: 10),
          width: size.width * 0.75,
          child: Text("Booking Details",
              style: TextStyle(color: colors.deepBlue, fontSize: 13)),
        ),
      ),
      Transform.translate(
          offset: Offset(0, 35),
          child: Container(
              decoration: BoxDecoration(
                  color: colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: size.width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 15,
                          child: Text("DK"),
                          backgroundImage: AssetImage("assets/images/me.jpg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Text(
                            "David Kovalev",
                            style: TextStyle(
                                color: MyColors().textBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, bottom: 38, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 7, bottom: 7),
                          child: Text(
                            "Note:",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: colors.textBlack),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: colors.textBlack, fontSize: 10),
                              text:
                                  "Sed quis justo vel ligula vestibulum molestie. Nam vitae est eget enim ultrices viverra nec id mauris. Praesent ut neque eleifend, tempus magna ut, volutpat nulla. Donec in placerat nibh, vitae consectetur ante. Aenean ac nibh eget nibh lobortis pellentesque at elementum lacus. Vestibulum sem purus, sollicitudin nec dolor eget, egestas vestibulum ligula. Sed mi leo, vehicula sit amet dolor ut, imperdiet interdum mauris. Nam condimentum turpis pharetra venenatis sollicitudin."),
                        ),
                      ],
                    ),
                  )
                ],
              )))
    ]);
  }
}
