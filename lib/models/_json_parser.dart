import 'auth.dart';
import 'user.dart';

class JsonParser {
  static T parse<T>(json) {
    if (T.toString() == "User") {
      return User.fromJson(json) as T;
    } else if (T.toString() == "Auth") {
      return Auth.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
