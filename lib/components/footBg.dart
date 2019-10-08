import 'package:flutter/widgets.dart';

class FootBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var imgWidth = size.height * 0.09;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.translate(
                offset: Offset(3, -25),
                child: SizedBox(
                    width: imgWidth * 0.7,
                    child: Image.asset("assets/images/leftCloud.png")),
              ),
              SizedBox(
                  width: imgWidth * 1.29,
                  child: Image.asset("assets/images/runningMan.png")),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                  width: imgWidth * 0.97,
                  child: Transform.translate(
                      offset: Offset(14, 0.0),
                      child: Image.asset("assets/blackWoman.png"))),
              SizedBox(
                  width: imgWidth * 1.1,
                  child: Image.asset("assets/rightCloud.png")),
            ])
      ],
    );
  }
}
