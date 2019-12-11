import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MineHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MineHeaderState();
}

class MineHeaderState extends State<MineHeader> {
  String showText = "";

  // _gotoUserCenter(BuildContext context, String arg) async {
  //   String text = await Navigator.pushNamed(context, "/user_center", arguments: arg);
  //   // setState(() {
  //   //   showText = text;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // decoration: BoxDecoration(color: Colors.red),
      child: Padding(
        padding: EdgeInsets.only(right: 15),
        child: Center(
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add_location),
                  onPressed: () => {
                        Navigator.pushNamed(context, "/user_center",
                                arguments: "什么鬼")
                            .then((value) {
                          setState(() {
                            showText = value;
                          });
                        }),
                      }),
              Text(showText),
            ],
          ),
        ),
      ),
    );
  }
}
