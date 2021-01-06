import 'package:flutter/material.dart';
import 'package:flutter_carrot_market/pages/detail.dart';
import 'package:flutter_carrot_market/repository/contents_repository.dart';
import 'package:flutter_carrot_market/utils/data_utils.dart';
import 'package:flutter_svg/svg.dart';

class MyFavoriteContents extends StatefulWidget {
  MyFavoriteContents({Key key}) : super(key: key);

  @override
  _MyFavoriteContentsState createState() => _MyFavoriteContentsState();
}

class _MyFavoriteContentsState extends State<MyFavoriteContents> {
  final ContentsRepository contentsRepository = ContentsRepository();

  @override
  void initState() {
    super.initState();
  }

  Future<List<dynamic>> _loadMyFavoriteContentList() async {
    return await contentsRepository.loadFavoriteContents();
  }

  Widget _appBarWidget() {
    return AppBar(
      elevation: 0,
      title: Text(
        "관심목록",
        style: TextStyle(fontSize: 15),
      ),
      centerTitle: false,
    );
  }

  Widget _makeDataList(List<dynamic> datas) {
    int size = datas == null ? 0 : datas.length;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (datas != null && datas.length > 0) {
          Map<String, dynamic> data = datas[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 7),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailContentView(data: data);
                }));
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Hero(
                          tag: data["cid"],
                          child: Image.asset(
                            data["image"],
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.only(left: 20, top: 2),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data["title"],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 5),
                              Text(
                                data["location"],
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff999999)),
                              ),
                              SizedBox(height: 5),
                              Text(
                                DataUtils.calcStringToWon(data["price"]),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 18,
                                        child: SvgPicture.asset(
                                          "assets/svg/heart_off.svg",
                                          width: 13,
                                          height: 13,
                                        ),
                                      ),
                                      SizedBox(width: 3),
                                      Text(data["likes"]),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      itemCount: size,
    );
  }

  Widget _bodyWidget() {
    return FutureBuilder(
      future: _loadMyFavoriteContentList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("데이터 오류"));
        }
        if (snapshot.hasData) {
          return _makeDataList(snapshot.data);
        }
        return Center(child: Text("해당 지역에 데이터가 없습니다."));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
      backgroundColor: Colors.grey.withOpacity(0.05),
    );
  }
}
