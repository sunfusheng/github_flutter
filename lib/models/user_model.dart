import 'package:github_flutter/generated/json/base/json_convert_content.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';

class UserModel with JsonConvert<UserModel> {
  String login;
  int id;
  @JSONField("node_id")
  String nodeId;
  @JSONField("avatar_url")
  String avatarUrl;
  @JSONField("gravatar_id")
  String gravatarId;
  String url;
  @JSONField("html_url")
  String htmlUrl;
  @JSONField("followers_url")
  String followersUrl;
  @JSONField("following_url")
  String followingUrl;
  @JSONField("gists_url")
  String gistsUrl;
  @JSONField("starred_url")
  String starredUrl;
  @JSONField("subscriptions_url")
  String subscriptionsUrl;
  @JSONField("organizations_url")
  String organizationsUrl;
  @JSONField("repos_url")
  String reposUrl;
  @JSONField("events_url")
  String eventsUrl;
  @JSONField("received_events_url")
  String receivedEventsUrl;
  String type;
  @JSONField("site_admin")
  bool siteAdmin;
  String name;
  String company;
  String blog;
  String location;
  String email;
  dynamic hireable;
  String bio;
  @JSONField("public_repos")
  int publicRepos;
  @JSONField("public_gists")
  int publicGists;
  int followers;
  int following;
  @JSONField("created_at")
  String createdAt;
  @JSONField("updated_at")
  String updatedAt;
  @JSONField("private_gists")
  int privateGists;
  @JSONField("total_private_repos")
  int totalPrivateRepos;
  @JSONField("owned_private_repos")
  int ownedPrivateRepos;
  @JSONField("disk_usage")
  int diskUsage;
  int collaborators;
  @JSONField("two_factor_authentication")
  bool twoFactorAuthentication;
  UserPlan plan;

  @override
  String toString() {
    return 'UserModel{login: $login, htmlUrl: $htmlUrl}';
  }
}

class UserPlan with JsonConvert<UserPlan> {
  String name;
  int space;
  int collaborators;
  @JSONField("private_repos")
  int privateRepos;
}
