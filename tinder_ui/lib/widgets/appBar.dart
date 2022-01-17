import 'package:flutter/material.dart';
import 'package:tinder_ui/widgets/bottomBar.dart';

class TopBar extends StatefulWidget {
  TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
     // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           buttonWidget(Icons.star, Colors.amber),
          imageWidget('assets/tinderlogo.png'),
          imageWidget('assets/diamond.png'),
         
          buttonWidget(Icons.notifications, Colors.grey.shade400)
        ],
      ),
    );
  }
}

Widget imageWidget(String image) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(shape: BoxShape.circle,
    image:  DecorationImage(image: AssetImage(image),
    fit:BoxFit.cover )),
  );
}
