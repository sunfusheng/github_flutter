import 'package:connectivity/connectivity.dart';

class NetworkUtil {
  // 判断网络是否连接
  static Future<bool> isConnected() async {
    var result = await (Connectivity().checkConnectivity());
    return result != ConnectivityResult.none;
  }
}
