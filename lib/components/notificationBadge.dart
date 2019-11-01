import 'package:flutter/material.dart';

class NotificationBadge extends StatefulWidget {
  final Color badgeColor;

  final bool notificationStatus;
  NotificationBadge({this.badgeColor, this.notificationStatus});
  @override
  _NotificationBadgeState createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  bool status;

  @override
  void initState() {
    super.initState();
    status = false;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SizedBox(
        width: 30,
        height: 30,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: widget.badgeColor,
              ),
              onPressed: () {},
            ),
            widget.notificationStatus
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  )
                : Container()
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}
