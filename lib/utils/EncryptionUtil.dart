import 'dart:convert';

class EncryptionUtil {
  /*
  * Base64加密
  */
  static String encodeBase64(String content) {
    return base64Encode(utf8.encode(content));
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String content) {
    return String.fromCharCodes(base64Decode(content));
  }
}
