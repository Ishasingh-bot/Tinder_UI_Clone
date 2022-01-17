import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tinder_ui/functions/alertFunction.dart';
import 'package:tinder_ui/utillss/constants.dart';
import 'package:tinder_ui/widgets/appBar.dart';
import 'package:tinder_ui/widgets/bottomBar.dart';
import 'package:swipe_cards/swipe_cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];

  MatchEngine? _matchEngine;
  List<String> names = ['Justine', 'Andrews', 'Cristine', 'Hardy B', 'Moanaa','Samaraa'];

  @override
  void initState() {
    for (int i = 0; i < names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: names[i]),
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {}));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70),
            TopBar(),
            Expanded(
                child: Container(
                    child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(images[index]), fit: BoxFit.cover),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        names[index],
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              },
              onStackFinished: () {
                return ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('The List Is OVER')));
              },
            ))),
            BottomBar()
          ],
        ),
      ),
    );
  }
}

class Content {
  final String? text;
  Content({this.text});
}
