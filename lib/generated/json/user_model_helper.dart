import 'package:github_flutter/models/user_model.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';

userModelFromJson(UserModel data, Map<String, dynamic> json) {
	data.login = json['login'];
	data.id = json['id'];
	data.nodeId = json['node_id'];
	data.avatarUrl = json['avatar_url'];
	data.gravatarId = json['gravatar_id'];
	data.url = json['url'];
	data.htmlUrl = json['html_url'];
	data.followersUrl = json['followers_url'];
	data.followingUrl = json['following_url'];
	data.gistsUrl = json['gists_url'];
	data.starredUrl = json['starred_url'];
	data.subscriptionsUrl = json['subscriptions_url'];
	data.organizationsUrl = json['organizations_url'];
	data.reposUrl = json['repos_url'];
	data.eventsUrl = json['events_url'];
	data.receivedEventsUrl = json['received_events_url'];
	data.type = json['type'];
	data.siteAdmin = json['site_admin'];
	data.name = json['name'];
	data.company = json['company'];
	data.blog = json['blog'];
	data.location = json['location'];
	data.email = json['email'];
	data.hireable = json['hireable'];
	data.bio = json['bio'];
	data.publicRepos = json['public_repos'];
	data.publicGists = json['public_gists'];
	data.followers = json['followers'];
	data.following = json['following'];
	data.createdAt = json['created_at'];
	data.updatedAt = json['updated_at'];
	data.privateGists = json['private_gists'];
	data.totalPrivateRepos = json['total_private_repos'];
	data.ownedPrivateRepos = json['owned_private_repos'];
	data.diskUsage = json['disk_usage'];
	data.collaborators = json['collaborators'];
	data.twoFactorAuthentication = json['two_factor_authentication'];
	data.plan = json['plan'] != null ? new UserPlan().fromJson(json['plan']) : null;
	return data;
}

Map<String, dynamic> userModelToJson(UserModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['login'] = entity.login;
	data['id'] = entity.id;
	data['node_id'] = entity.nodeId;
	data['avatar_url'] = entity.avatarUrl;
	data['gravatar_id'] = entity.gravatarId;
	data['url'] = entity.url;
	data['html_url'] = entity.htmlUrl;
	data['followers_url'] = entity.followersUrl;
	data['following_url'] = entity.followingUrl;
	data['gists_url'] = entity.gistsUrl;
	data['starred_url'] = entity.starredUrl;
	data['subscriptions_url'] = entity.subscriptionsUrl;
	data['organizations_url'] = entity.organizationsUrl;
	data['repos_url'] = entity.reposUrl;
	data['events_url'] = entity.eventsUrl;
	data['received_events_url'] = entity.receivedEventsUrl;
	data['type'] = entity.type;
	data['site_admin'] = entity.siteAdmin;
	data['name'] = entity.name;
	data['company'] = entity.company;
	data['blog'] = entity.blog;
	data['location'] = entity.location;
	data['email'] = entity.email;
	data['hireable'] = entity.hireable;
	data['bio'] = entity.bio;
	data['public_repos'] = entity.publicRepos;
	data['public_gists'] = entity.publicGists;
	data['followers'] = entity.followers;
	data['following'] = entity.following;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['private_gists'] = entity.privateGists;
	data['total_private_repos'] = entity.totalPrivateRepos;
	data['owned_private_repos'] = entity.ownedPrivateRepos;
	data['disk_usage'] = entity.diskUsage;
	data['collaborators'] = entity.collaborators;
	data['two_factor_authentication'] = entity.twoFactorAuthentication;
	if (entity.plan != null) {
		data['plan'] = UserPlan().toJson();
	}
	return data;
}

userPlanFromJson(UserPlan data, Map<String, dynamic> json) {
	data.name = json['name'];
	data.space = json['space'];
	data.collaborators = json['collaborators'];
	data.privateRepos = json['private_repos'];
	return data;
}

Map<String, dynamic> userPlanToJson(UserPlan entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['space'] = entity.space;
	data['collaborators'] = entity.collaborators;
	data['private_repos'] = entity.privateRepos;
	return data;
}