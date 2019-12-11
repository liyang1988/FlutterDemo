import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:heishi_app/mine_header.dart';
import 'package:heishi_app/mine_list_cell.dart';

class MinePageControler extends StatelessWidget {
  // final topBar = new AppBar(
  //   backgroundColor: new Color(0xfff8faf8),
  //   centerTitle: true,
  //   elevation: 1.0,
  //   leading: new Icon(Icons.camera_alt),
  //   title: SizedBox(
  //       height: 35.0, child: Image.asset("assets/images/insta_logo.png")),
  //   actions: <Widget>[
  //     Padding(
  //       padding: const EdgeInsets.only(right: 12.0),
  //       child: Icon(Icons.send),
  //     )
  //   ],
  // );
  final cellConfig = [
    {"imgPath": "assets/images/shop/icon_address_center.png", "text": "收货地址"},
    {"imgPath": "assets/images/home/icon_setting.png", "text": "系统设置"},
    {"imgPath": "assets/images/home/icon_about_us.png", "text": "关于我们"},
    {"imgPath": "assets/images/home/icon_assistant.png", "text": "联系客服"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: Padding(
        padding: EdgeInsets.only(
          top: 0.0,
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: false,
          slivers: <Widget>[
            // SliverAppBar(
            //   backgroundColor: Colors.red,
            //   // flexibleSpace: HeartImgWidget(Image.asset(
            //   //     Constant.ASSETS_IMG + 'bg_person_center_default.webp')),
            //   expandedHeight: 200.0,
            // ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                minHeight: 60.0,
                maxHeight: 220.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      height: 160,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, right: 0, left: 0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: NetworkImage(
                                  "http://pic130.huitu.com/res/20191014/1540915_20191014230439978070_1.jpg"),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text("用户-ec96c",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: _rightArrow(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20, top: 140),
                      child: Container(
                        width: 400,
                        height: 80,
                        // color: const Color.fromARGB(255, 247, 247, 247),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _vertivalItem("0", "优惠券"),
                            _vertivalDivider(),
                            _vertivalItem("0", "取货码"),
                            _vertivalDivider(),
                            _vertivalItem("0", "我的订单"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _divider(),
            _personItem(
                cellConfig[0]["imgPath"], cellConfig[0]["text"], true, false,
                onTab: () {}),
            _horizontalDivider(),
            _personItem(
                cellConfig[1]["imgPath"], cellConfig[1]["text"], false, false),
            _horizontalDivider(),
            _personItem(
                cellConfig[2]["imgPath"], cellConfig[2]["text"], false, false),
            _horizontalDivider(),
            _personItem(
                cellConfig[3]["imgPath"], cellConfig[3]["text"], true, true),
            _divider(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                // height: 100,
                // color: Colors.white,
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.fill,
                  height: 100,
                  image:
                      'http://pic202.nipic.com/pic/20190109/10154023_161254796087_4.jpg',
                  placeholder:
                      'assets/images/home/icon_QR_press.png' /* 指定gif */,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Scaffold(
    //   appBar: null,
    //   backgroundColor: Colors.white,
    //   body: ListView.builder(
    //     itemCount: cellConfig.length + 1,
    //     itemBuilder: (BuildContext context, int index) {
    //       if (index == 0) {
    //         return MineHeader();
    //       } else {
    //         var config = cellConfig[index - 1];
    //         return MineListCell(config["imgPath"], config["text"]);
    //       }
    //     },
    //   ), //XTCommonCell(),
    // );
  }

  SliverToBoxAdapter _divider() {
    return SliverToBoxAdapter(
      child: Container(
        height: 10.0,
        color: const Color.fromARGB(255, 247, 247, 247),
      ),
    );
  }

  SliverToBoxAdapter _personItem(
      String imgAsset, String title, bool isBound, isLast,
      {VoidCallback onTab}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20),
        child: Container(
          height: 60,
          // color: Colors.white,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: isBound
                ? const BorderRadius.all(const Radius.circular(8))
                : null,
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    imgAsset,
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: isLast
                        ? <Widget>[
                            Container(
                              width: 130,
                              child: Text(
                                "工作日 8:00-20:00",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: const Color.fromARGB(
                                        255, 204, 204, 204)),
                              ),
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                "400-0282-802",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ]
                        : [],
                  ),
                ),
                // _rightArrow()
              ],
            ),
            onTap: onTab,
          ),
        ),
      ),
    );
  }

  _rightArrow() {
    return Icon(
      Icons.chevron_right,
      color: const Color.fromARGB(255, 204, 204, 204),
    );
  }

  Container _vertivalDivider() {
    return Container(
      height: 50.0,
      width: 2,
      color: const Color.fromARGB(255, 247, 247, 247),
    );
  }

  SliverToBoxAdapter _horizontalDivider() {
    return SliverToBoxAdapter(
      child: Container(
        height: 1.5,
        width: 500,
        color: const Color.fromARGB(255, 247, 247, 247),
      ),
    );
  }

  Container _vertivalItem(String numb, String title, {VoidCallback onTab}) {
    return Container(
      width: 100,
      height: 60,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                numb,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            ),
          ],
        ),
        onTap: onTab,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
