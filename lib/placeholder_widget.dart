import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
    final Color color;

    PlaceholderWidget(this.color);

    @override
    Widget build(BuildContext context) {
        return Container(
            color: color,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                    Image.asset(
                        "assets/images/lolcat-fixing.jpg",
                        fit: BoxFit.cover,
                    ),
                    Text('Under development')
                ],
            )
            
        );
    }
}