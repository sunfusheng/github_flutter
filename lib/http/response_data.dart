import 'package:github_flutter/generated/json/base/json_convert_content.dart';

class ResponseData<T> {
  int code;
  String msg;
  bool isList;
  T data;
  List<T> dataList;
  dynamic json;

  ResponseData({this.code, this.msg, this.data, this.dataList, this.json});

  ResponseData<T> parseJson<T>() {
    ResponseData<T> obj = ResponseData<T>(code: code, msg: msg, json: json);
    if (json != null) {
      if (json.runtimeType?.toString() == 'List<dynamic>') {
        List<dynamic> jsonList = json;
        obj.isList = true;
        obj.dataList =
            jsonList.map((it) => JsonConvert.fromJsonAsT<T>(it)).toList();
      } else {
        obj.isList = false;
        obj.data = JsonConvert.fromJsonAsT<T>(json);
      }
    }
    print(obj.toString());
    return obj;
  }

  @override
  String toString() {
    return 'ResponseData{ code: $code, msg: $msg, isList: $isList, \ndata: $data, \ndataList: $dataList, \njson: $json}';
  }
}
