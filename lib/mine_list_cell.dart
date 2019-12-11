import 'package:flutter/material.dart';

class MineListCell extends StatefulWidget {
  const MineListCell(this.imgPath, this.text);

  final String imgPath;
  final String text;

  @override
  State<StatefulWidget> createState() => new MineListCellState();
}

class MineListCellState extends State<MineListCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset(widget.imgPath),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(widget.text),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/images/shop/icon_address_add.png",
                  scale: 2,
                ),
              ),
            ),
          ],
        ),
      ),
      height: 60,
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
