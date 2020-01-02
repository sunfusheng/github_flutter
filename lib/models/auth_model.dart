import 'package:github_flutter/generated/json/base/json_convert_content.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';

class AuthModel with JsonConvert<AuthModel> {
	int id;
	String url;
	AuthApp app;
	String token;
	@JSONField("hashed_token")
	String hashedToken;
	@JSONField("token_last_eight")
	String tokenLastEight;
	dynamic note;
	@JSONField("note_url")
	dynamic noteUrl;
	@JSONField("created_at")
	String createdAt;
	@JSONField("updated_at")
	String updatedAt;
	List<String> scopes;
	dynamic fingerprint;

  @override
  String toString() {
    return 'AuthModel{token: $token}';
  }


}

class AuthApp with JsonConvert<AuthApp> {
	String name;
	String url;
	@JSONField("client_id")
	String clientId;
}
