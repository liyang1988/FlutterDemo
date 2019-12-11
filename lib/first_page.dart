import 'package:flutter/material.dart';
import 'package:heishi_app/customer_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'dart:typed_data';

import 'package:heishi_app/picmodel.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

class FirstPageControler extends StatefulWidget {
  FirstPageControler({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FirstPageControlerState();
  }
}

class FirstPageControlerState extends State<FirstPageControler> {
  List<PicModel> picList = new List();
  int page = 1;
  @override
  void initState() {
    super.initState();
    _getPicList();
  }

  final topBar = new CustomAppbar(
    title: '',
    leadingWidget: Text(
      "黑拾星球",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    trailingWidget: new Row(
      // alignment: MainAxisAlignment.spaceAround,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new IconButton(
          icon: Icon(
            Icons.home,
          ),
          onPressed: () {},
        ),
        new IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: null,
        ),
        new IconButton(
          icon: Icon(
            Icons.account_box,
          ),
          onPressed: null,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        // shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _getBannerView(),
          ),
          SliverToBoxAdapter(
            child: _getMiddleInfoView(),
          ),
          SliverToBoxAdapter(
            child: _girdViewBuild(),
          ),
        ],
      ),
    );
  }

  Widget _getBannerView() {
    print("_getBannerView");
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10, top: 5),
      child: Container(
        height: 160,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                          'http://icon.nipic.com/BannerPic/20191202/original/20191202132029_1.jpg',
                        ),
                        fit: BoxFit.fill)));
          },

          itemCount: 3,
          // outer: false,
          pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
          // layout: SwiperLayout.STACK,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
        ),
      ),
    );
  }

  Widget _getMiddleInfoView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "欢迎回来，你已经连续签到3天",
                style: TextStyle(color: Colors.grey),
              ),
              Text("每日签到 "),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Container(
            height: 100,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            child: Column(),
          ),
        ),
      ],
    );
  }

  StaggeredGridView _girdViewBuild() {
    List<String> datas = getDataList();
    return StaggeredGridView.countBuilder(
      itemCount: picList.length,
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 4,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (context, index) => buildItem(this.picList[index], index),
      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
    );

    //  SliverPadding(
    //   padding: EdgeInsets.only(left: 10, right: 10, top: 20),
    //   sliver: SliverGrid(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2, // 4行
    //       mainAxisSpacing: 10.0,
    //       crossAxisSpacing: 15.0,
    //       // childAspectRatio: 1.0,
    //     ),
    //     delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
    //       if (index == picList.length - 1) {
    //         _getPicList();
    //       }
    //       return buildItem(picList[index], index);
    //     }, childCount: picList.length),
    //   ),
    // );
  }

  _getPicList() async {
    String url = 'https://www.apiopen.top/meituApi?page=$page';
    print("_getPicList11--$url");
    var httpClient = new HttpClient();
    try {
      var req = await httpClient.getUrl(Uri.parse(url));
      var res = await req.close();
      // print(res);
      var co = res.statusCode;
      print("_getPicList22--$co");
      if (res.statusCode == HttpStatus.ok) {
        var jsonString = await res.transform(utf8.decoder).join(); //将结果转换成字符串拼接
        // print(jsonString);
        Map data = jsonDecode(jsonString); //格式化成Map对象
        print("_getPicList33");
        print(data);
        List pics = data['data'];
        List<PicModel> items = new List();
        for (var value in pics) {
          items.add(new PicModel.fromJson(value));
        }

        setState(() {
          this.picList.addAll(items);
          this.page++;
        });
      } else {
        var listModel = [
          {
            'createdAt': "instance.createdAt111122121234342342334",
            'publishedAt': " instance.publishedAt",
            'type': "instance.type",
            'url':
                "http://pic205.nipic.com/pic/20190214/12340304_175738785087_4.jpg"
          },
          {
            'createdAt':
                "instance.createdAt1213213423r23r23r34t343434g34g34g34g43g34cvxzvxcvxcvxcvxcvdsfasfasdasdasdasdsdaxcvvxcvxcvxcvxcvzxvxzvs",
            'publishedAt': " instance.publishedAt",
            'type': "instance.type",
            'url':
                "http://icon.nipic.com/BannerPic/20191202/original/20191202132029_1.jpg"
          },
          {
            'createdAt': "instance.createdAtewerewrwer234234234234234234",
            'publishedAt': " instance.publishedAt",
            'type': "instance.type",
            'url':
                "http://pic195.nipic.com/pic/20181205/10154023_122646203082_4.jpg"
          },
          {
            'createdAt':
                "instance.createdAtgrgegssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
            'publishedAt': " instance.publishedAt",
            'type': "instance.type",
            'url':
                "http://pic205.nipic.com/pic/20190214/12340304_175738785087_4.jpg"
          },
          {
            'createdAt': "instance.createdAt",
            'publishedAt': " instance.publishedAt",
            'type': "instance.type",
            'url':
                "http://icon.nipic.com/BannerPic/20191202/original/20191202132029_1.jpg"
          },
          {
            'createdAt':
                "instance.createdAtzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",
            'publishedAt': " instance.publishedAt",
            'type': "instance.type",
            'url':
                "http://icon.nipic.com/BannerPic/20191202/original/20191202132029_1.jpg"
          },
          {
            'createdAt': "instance.createdAt",
            'publishedAt': " instance.publishedAt",
            'type': "instance.type",
            'url':
                "http://pic195.nipic.com/pic/20181205/10154023_122646203082_4.jpg"
          },
          {
            'createdAt': "instance.createdAt",
            'publishedAt': " instance.publishedAt",
            'type': "instance.type",
            'url':
                "http://icon.nipic.com/BannerPic/20191202/original/20191202132029_1.jpg"
          },
        ];

        print("_getPicList44");
        List pics = listModel;
        List<PicModel> items = new List();
        for (var value in pics) {
          items.add(new PicModel.fromJson(value));
        }

        setState(() {
          this.picList.addAll(items);
          this.page++;
        });
      }
    } catch (e) {}
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget buildItem(item, index) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Scaffold(
                      appBar: new AppBar(
                        title: new Text('图片详情'),
                      ),
                      body: new Center(
                          child: new Container(
                        width: 300.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      item.url,
                                    ),
                                    fit: BoxFit.fill))),
                      )),
                    )));
      },
      child: _imageCell(item.url, item.createdAt, index),
    );
  }

  Widget _imageCell(url, title, index) {
    return Card(
      child: Column(children: <Widget>[
        // Container(
        //   width: 300,
        //   child: CachedNetworkImage(
        //     // errorWidget: new Icon(Icons.error),
        //     imageUrl: url,
        //     fadeInDuration: new Duration(seconds: 3),
        //     fadeOutDuration: new Duration(seconds: 1),
        //     fit: BoxFit.fitWidth,
        //   ),
        // ),
        new Stack(
          children: <Widget>[
            new Center(
              child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: url,
              ),
            ),
          ],
        ),
        new Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              // color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8)),
            ),
            child: Text(title),
          ),
        ),
      ]),
    );
  }
}
