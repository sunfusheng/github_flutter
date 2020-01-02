import 'package:github_flutter/models/auth_model.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';

authModelFromJson(AuthModel data, Map<String, dynamic> json) {
	data.id = json['id'];
	data.url = json['url'];
	data.app = json['app'] != null ? new AuthApp().fromJson(json['app']) : null;
	data.token = json['token'];
	data.hashedToken = json['hashed_token'];
	data.tokenLastEight = json['token_last_eight'];
	data.note = json['note'];
	data.noteUrl = json['note_url'];
	data.createdAt = json['created_at'];
	data.updatedAt = json['updated_at'];
	data.scopes = json['scopes']?.cast<String>();
	data.fingerprint = json['fingerprint'];
	return data;
}

Map<String, dynamic> authModelToJson(AuthModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['url'] = entity.url;
	if (entity.app != null) {
		data['app'] = AuthApp().toJson();
	}
	data['token'] = entity.token;
	data['hashed_token'] = entity.hashedToken;
	data['token_last_eight'] = entity.tokenLastEight;
	data['note'] = entity.note;
	data['note_url'] = entity.noteUrl;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['scopes'] = entity.scopes;
	data['fingerprint'] = entity.fingerprint;
	return data;
}

authAppFromJson(AuthApp data, Map<String, dynamic> json) {
	data.name = json['name'];
	data.url = json['url'];
	data.clientId = json['client_id'];
	return data;
}

Map<String, dynamic> authAppToJson(AuthApp entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['url'] = entity.url;
	data['client_id'] = entity.clientId;
	return data;
}