import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heishi_app/first_page.dart';
import 'package:heishi_app/heishi_page.dart';
import 'package:heishi_app/mine_page.dart';
import 'package:heishi_app/scanner_page.dart';
import 'package:heishi_app/shop_page.dart';

class InstaHome extends StatefulWidget {
  @override
  createState() => new InstaHomeState();
}

class InstaHomeState extends State<InstaHome> {
  var _indexPage = 0;
  final pages = <Widget>[
    new FirstPageControler(),
    new HeiShiPageControler(),
    new ScannerPageControler(),
    new ShopPageControler(),
    new MinePageControler()
  ];

  @override
  void initState() {
    super.initState();
  }

  void onTap(index) {
    setState(() {
      _indexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: pages[_indexPage],
        // bottomNavigationBar: new Container(
        //   // color: Colors.red,
        //   height: 70.0,
        //   alignment: Alignment.center,
        //   child: new BottomAppBar(
        //     child: new Row(
        //       // alignment: MainAxisAlignment.spaceAround,
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: <Widget>[
        // new IconButton(
        //   icon: ImageIcon(
        //     _indexPage == 0
        //         ? AssetImage("assets/images/home/icon_index_press.png")
        //         : AssetImage("assets/images/home/icon_index.png"),
        //     size: 60,
        //   ),
        //   onPressed: () {
        //     setState(() {
        //       _indexPage = 0;
        //     });
        //   },
        //   iconSize: 70,
        // ),
        // new IconButton(
        //   icon: ImageIcon(
        //     _indexPage == 1
        //         ? AssetImage("assets/images/home/icon_play_press.png")
        //         : AssetImage("assets/images/home/icon_play.png"),
        //   ),
        //   iconSize: 60,
        //   onPressed: () {
        //     setState(() {
        //       _indexPage = 1;
        //     });
        //   },
        // ),
        // new IconButton(
        //   icon: ImageIcon(
        //     _indexPage == 2
        //         ? AssetImage("assets/images/home/icon_QR_press.png")
        //         : AssetImage("assets/images/home/icon_QR.png"),
        //   ),
        //   iconSize: 60,
        //   onPressed: () {
        //     setState(() {
        //       _indexPage = 2;
        //     });
        //   },
        // ),
        // new IconButton(
        //   icon: ImageIcon(
        //     _indexPage == 3
        //         ? AssetImage("assets/images/home/icon_market_press.png")
        //         : AssetImage("assets/images/home/icon_market.png"),
        //   ),
        //   iconSize: 60,
        //   onPressed: () {
        //     setState(() {
        //       _indexPage = 3;
        //     });
        //   },
        // ),
        // new IconButton(

        //   icon: ImageIcon(
        //     _indexPage == 3
        //         ? AssetImage("assets/images/home/icon_person_press.png")
        //         : AssetImage("assets/images/home/icon_person.png"),
        //   ),

        //   iconSize: 60,
        //   onPressed: () {
        //     setState(() {
        //       _indexPage = 4;
        //     });
        //   },
        // ),

        //         new Image.asset(_indexPage == 0
        //             ? "assets/images/home/icon_person_press.png"
        //             : "assets/images/home/icon_person.png"),
        //         new Image.asset(_indexPage == 1
        //             ? "assets/images/home/icon_market_press.png"
        //             : "assets/images/home/icon_market.png"),
        // new Image.asset(_indexPage == 2
        //     ? "assets/images/home/icon_QR_press.png"
        //     : "assets/images/home/icon_QR.png"),
        // new Image.asset(_indexPage == 3
        //     ? "assets/images/home/icon_play_press.png"
        //     : "assets/images/home/icon_play.png"),
        //       ],
        //     ),
        //   ),
        // ));

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexPage,
          // selectedItemColor: Colors.black,
          // unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home/icon_index.png",
                width: 45,
                height: 45,
              ),
              title: Text(""),
              activeIcon: Image.asset(
                "assets/images/home/icon_index_press.png",
                width: 45,
                height: 45,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home/icon_play.png",
                width: 45,
                height: 45,
              ),
              title: Text(""),
              activeIcon: Image.asset(
                "assets/images/home/icon_play_press.png",
                width: 45,
                height: 45,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home/icon_QR.png",
                width: 45,
                height: 45,
              ),
              title: Text(""),
              activeIcon: Image.asset(
                "assets/images/home/icon_QR_press.png",
                width: 45,
                height: 45,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home/icon_market.png",
                width: 45,
                height: 45,
              ),
              title: Text(""),
              activeIcon: Image.asset(
                "assets/images/home/icon_market_press.png",
                width: 45,
                height: 45,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home/icon_person.png",
                width: 45,
                height: 45,
              ),
              title: Text(""),
              activeIcon: Image.asset(
                "assets/images/home/icon_person_press.png",
                width: 45,
                height: 45,
              ),
            ),
          ],
          onTap: this.onTap,
          iconSize: 25,
          //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
          fixedColor: Color.fromARGB(255, 0, 188, 96),
          type: BottomNavigationBarType.fixed,
          // selectedFontSize: 11,
          // unselectedFontSize: 10,
        ));
  }
}
