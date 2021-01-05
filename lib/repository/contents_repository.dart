import 'dart:convert';

import 'local_storage_repository.dart';

class ContentsRepository extends LocalStorageRepository {
  final String MY_FAVORITE_KEY = "MY_FAVORITE_KEY";
  Map<String, dynamic> data = {
    "ara": [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      },
    ],
    "ora": [
      {
        "cid": "11",
        "image": "assets/images/ora-1.jpg",
        "title": "LG 통돌이세탁기 15kg(내부",
        "location": "제주 제주시 오라동",
        "price": "150000",
        "likes": "13"
      },
      {
        "cid": "12",
        "image": "assets/images/ora-2.jpg",
        "title": "3단책장 전면책장 가져가실분",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "6"
      },
      {
        "cid": "13",
        "image": "assets/images/ora-3.jpg",
        "title": "브리츠 컴퓨터용 스피커",
        "location": "제주 제주시 오라동",
        "price": "1000",
        "likes": "4"
      },
      {
        "cid": "14",
        "image": "assets/images/ora-4.jpg",
        "title": "안락 의자",
        "location": "제주 제주시 오라동",
        "price": "10000",
        "likes": "1"
      },
      {
        "cid": "15",
        "image": "assets/images/ora-5.jpg",
        "title": "어린이책 무료드림",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "1"
      },
      {
        "cid": "16",
        "image": "assets/images/ora-6.jpg",
        "title": "어린이책 무료드림",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "0"
      },
      {
        "cid": "17",
        "image": "assets/images/ora-7.jpg",
        "title": "칼세트 재제품 팝니다",
        "location": "제주 제주시 오라동",
        "price": "20000",
        "likes": "5"
      },
      {
        "cid": "18",
        "image": "assets/images/ora-8.jpg",
        "title": "아이팜장난감정리함팔아요",
        "location": "제주 제주시 오라동",
        "price": "30000",
        "likes": "29"
      },
      {
        "cid": "19",
        "image": "assets/images/ora-9.jpg",
        "title": "한색책상책장수납장세트 팝니다.",
        "location": "제주 제주시 오라동",
        "price": "1500000",
        "likes": "1"
      },
      {
        "cid": "20",
        "image": "assets/images/ora-10.jpg",
        "title": "순성 데일리 오가닉 카시트",
        "location": "제주 제주시 오라동",
        "price": "60000",
        "likes": "8"
      },
    ]
  };

  Future<List<Map<String, String>>> loadContentsFromLocation(
      String location) async {
    await Future.delayed(Duration(milliseconds: 2000));
    // throw Exception();
    return data[location];
  }

  Future<bool> isMyFavoriteContents(String contentId) async {
    bool isMyFavoriteContents = false;
    List json = await loadFavoriteContents();
    if (json == null || !(json is List)) {
      return false;
    } else {
      for (dynamic data in json) {
        if (data["cid"] == contentId) {
          isMyFavoriteContents = true;
          break;
        }
      }
    }
    return isMyFavoriteContents;
  }

  Future<List> loadFavoriteContents() async {
    String jsonString = await this.getStoredValue(MY_FAVORITE_KEY);
    if (jsonString != null) {
      Map<String, dynamic> json = jsonDecode(jsonString);
      return json["favorites"];
    } else {
      return null;
    }
  }

  Future<void> addMyFavoriteContent(Map<String, String> content) async {
    List loadLocalStorageDatas = await loadFavoriteContents();
    if (loadLocalStorageDatas == null || !(loadLocalStorageDatas is List)) {
      loadLocalStorageDatas = [content];
    } else {
      loadLocalStorageDatas.add(content);
    }
    updateFavoriteContent(loadLocalStorageDatas);
  }

  void updateFavoriteContent(List loadLocalStorageDatas) async {
    Map<String, dynamic> myFavoriteDatas = {"favorites": loadLocalStorageDatas};
    await this.storeValue(MY_FAVORITE_KEY, jsonEncode(myFavoriteDatas));
  }

  Future<void> deleteMyFavoriteContent(String id) async {
    List loadLocalStorageDatas = await loadFavoriteContents();
    if (loadLocalStorageDatas != null && loadLocalStorageDatas is List) {
      loadLocalStorageDatas.removeWhere((element) => element["cid"] == id);
    }
    updateFavoriteContent(loadLocalStorageDatas);
  }
}
