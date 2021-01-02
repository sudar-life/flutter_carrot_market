import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data;
  DetailContentView({Key key, this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  /*
  * appBar Widget 구현 
  */
  Widget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0, // 그림자를 표현되는 높이 3d 측면의 높이를 뜻함.
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
      ],
    );
  }

  Widget _bodyWidget() {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: MediaQuery.of(context).size.width,
          child: Hero(
            tag: widget.data["cid"],
            child: Image.asset(
              widget.data["image"],
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
