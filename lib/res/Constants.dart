import 'StringsR.dart';

class Constants {
  static const String BASE_URL_API_GITHUB = 'https://api.github.com/';
  static const String BASE_URL_GITHUB = 'https://github.com/';

  static const String USER_AGENT = 'sunfusheng';
  static const String ACCEPT_JSON = 'application/vnd.github.v3+json';

  static const String NOTE = "FlutterGitHub";
  static const String NOTE_URL = StringsR.githubUrl;
  static const String CLIENT_ID = "f52c9822aafe7fc8175f";
  static const String CLIENT_SECRET =
      "ac752771e11606b1d7685d4188ebca5fad32b15b";
  static const Set<String> SCOPES = {
    "user",
    "repo",
    "notifications",
    "gist",
    "admin:org"
  };
}
