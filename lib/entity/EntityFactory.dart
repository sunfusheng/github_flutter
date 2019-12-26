import 'auth_entity.dart';

class EntityFactory {
  static T generateObj<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AuthEntity") {
      return AuthEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
