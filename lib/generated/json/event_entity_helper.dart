import 'package:github_flutter/models/event_entity.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';

eventEntityFromJson(EventEntity data, Map<String, dynamic> json) {
	data.id = json['id'];
	data.type = json['type'];
	data.actor = json['actor'] != null ? new EventActor().fromJson(json['actor']) : null;
	data.repo = json['repo'] != null ? new EventRepo().fromJson(json['repo']) : null;
	data.payload = json['payload'] != null ? new EventPayload().fromJson(json['payload']) : null;
	data.public = json['public'];
	data.createdAt = json['created_at'];
	return data;
}

Map<String, dynamic> eventEntityToJson(EventEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['type'] = entity.type;
	if (entity.actor != null) {
		data['actor'] = EventActor().toJson();
	}
	if (entity.repo != null) {
		data['repo'] = EventRepo().toJson();
	}
	if (entity.payload != null) {
		data['payload'] = EventPayload().toJson();
	}
	data['public'] = entity.public;
	data['created_at'] = entity.createdAt;
	return data;
}

eventActorFromJson(EventActor data, Map<String, dynamic> json) {
	data.id = json['id'];
	data.login = json['login'];
	data.displayLogin = json['display_login'];
	data.gravatarId = json['gravatar_id'];
	data.url = json['url'];
	data.avatarUrl = json['avatar_url'];
	return data;
}

Map<String, dynamic> eventActorToJson(EventActor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['login'] = entity.login;
	data['display_login'] = entity.displayLogin;
	data['gravatar_id'] = entity.gravatarId;
	data['url'] = entity.url;
	data['avatar_url'] = entity.avatarUrl;
	return data;
}

eventRepoFromJson(EventRepo data, Map<String, dynamic> json) {
	data.id = json['id'];
	data.name = json['name'];
	data.url = json['url'];
	return data;
}

Map<String, dynamic> eventRepoToJson(EventRepo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['url'] = entity.url;
	return data;
}

eventPayloadFromJson(EventPayload data, Map<String, dynamic> json) {
	data.ref = json['ref'];
	data.refType = json['ref_type'];
	data.masterBranch = json['master_branch'];
	data.description = json['description'];
	data.pusherType = json['pusher_type'];
	return data;
}

Map<String, dynamic> eventPayloadToJson(EventPayload entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ref'] = entity.ref;
	data['ref_type'] = entity.refType;
	data['master_branch'] = entity.masterBranch;
	data['description'] = entity.description;
	data['pusher_type'] = entity.pusherType;
	return data;
}