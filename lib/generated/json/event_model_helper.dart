import 'package:github_flutter/models/event_model.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';
import 'package:github_flutter/models/repo_model.dart';
import 'package:github_flutter/models/user_model.dart';

eventModelFromJson(EventModel data, Map<String, dynamic> json) {
  data.id = json['id'];
  data.type = json['type'];
  data.actor =
      json['actor'] != null ? new UserModel().fromJson(json['actor']) : null;
  data.repo =
      json['repo'] != null ? new RepoModel().fromJson(json['repo']) : null;
  data.payload = json['payload'] != null
      ? new EventPayload().fromJson(json['payload'])
      : null;
  data.public = json['public'];
  data.createdAt = json['created_at'];
  data.org = json['org'] != null ? new EventOrg().fromJson(json['org']) : null;
  return data;
}

Map<String, dynamic> eventModelToJson(EventModel entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['type'] = entity.type;
  if (entity.actor != null) {
    data['actor'] = UserModel().toJson();
  }
  if (entity.repo != null) {
    data['repo'] = RepoModel().toJson();
  }
  if (entity.payload != null) {
    data['payload'] = EventPayload().toJson();
  }
  data['public'] = entity.public;
  data['created_at'] = entity.createdAt;
  if (entity.org != null) {
    data['org'] = EventOrg().toJson();
  }
  return data;
}

eventPayloadFromJson(EventPayload data, Map<String, dynamic> json) {
  data.action = json['action'];
  return data;
}

Map<String, dynamic> eventPayloadToJson(EventPayload entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['action'] = entity.action;
  return data;
}

eventOrgFromJson(EventOrg data, Map<String, dynamic> json) {
  data.id = json['id'];
  data.login = json['login'];
  data.gravatarId = json['gravatar_id'];
  data.url = json['url'];
  data.avatarUrl = json['avatar_url'];
  return data;
}

Map<String, dynamic> eventOrgToJson(EventOrg entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['gravatar_id'] = entity.gravatarId;
  data['url'] = entity.url;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}
