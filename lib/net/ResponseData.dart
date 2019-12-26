import 'package:github_flutter/entity/EntityFactory.dart';

class ResponseData<T> {
  int code;
  String msg;
  var json;
  var data;

  ResponseData({this.code, this.msg, this.json});

  ResponseData<T> parseJson<T>() {
    ResponseData<T> obj = ResponseData<T>(code: code, msg: msg, json: json);
    if (json != null) {
      obj.data = EntityFactory.generateObj<T>(json);
    }
    return obj;
  }

  @override
  String toString() {
    return 'ResponseData{code: $code, msg: $msg, data: $data}';
  }
}
