import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  IconWidget(
      {required this.icon,
      required this.label,
      required this.colorIcon,
      required this.avatarColor});

  final IconData icon;
  final String label;
  final Color colorIcon;
  final Color avatarColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: avatarColor,
          child: Icon(
            icon,
            color: colorIcon,
            size: 50.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(label,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: colorIcon,
            )),
      ],
    );
  }
}
