import 'package:github_flutter/generated/json/base/json_convert_content.dart';

class ResponseData<T> {
  int code;
  String msg;
  T data;
  Map<String, dynamic> json;

  ResponseData({this.code, this.msg, this.data, this.json});

  ResponseData<T> parseJson<T>() {
    ResponseData<T> obj = ResponseData<T>(code: code, msg: msg, json: json);
    if (json != null && json.isNotEmpty) {
      obj.data = JsonConvert.fromJsonAsT<T>(json);
    }
    return obj;
  }

  @override
  String toString() {
    return 'ResponseData{\ncode: $code, \nmsg: $msg, \njson: $json, \ndata: $data\n}';
  }
}
