import 'package:github_flutter/generated/json/base/json_convert_content.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';
import 'package:github_flutter/models/repo_model.dart';
import 'package:github_flutter/models/user_model.dart';

class EventModel with JsonConvert<EventModel> {
	String id;
	String type;
	UserModel actor;
	RepoModel repo;
	EventPayload payload;
	bool public;
	@JSONField("created_at")
	String createdAt;
	EventOrg org;
}

class EventPayload with JsonConvert<EventPayload> {
	String action;
}

class EventOrg with JsonConvert<EventOrg> {
	int id;
	String login;
	@JSONField("gravatar_id")
	String gravatarId;
	String url;
	@JSONField("avatar_url")
	String avatarUrl;
}
