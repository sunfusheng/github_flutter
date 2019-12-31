import 'package:github_flutter/generated/json/base/json_convert_content.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';

class EventEntity with JsonConvert<EventEntity> {
	String id;
	String type;
	EventActor actor;
	EventRepo repo;
	EventPayload payload;
	bool public;
	@JSONField("created_at")
	String createdAt;
}

class EventActor with JsonConvert<EventActor> {
	int id;
	String login;
	@JSONField("display_login")
	String displayLogin;
	@JSONField("gravatar_id")
	String gravatarId;
	String url;
	@JSONField("avatar_url")
	String avatarUrl;
}

class EventRepo with JsonConvert<EventRepo> {
	int id;
	String name;
	String url;
}

class EventPayload with JsonConvert<EventPayload> {
	dynamic ref;
	@JSONField("ref_type")
	String refType;
	@JSONField("master_branch")
	String masterBranch;
	String description;
	@JSONField("pusher_type")
	String pusherType;
}
