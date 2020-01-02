import 'package:github_flutter/generated/json/base/json_convert_content.dart';
import 'package:github_flutter/generated/json/base/json_filed.dart';
import 'package:github_flutter/models/user_model.dart';

class RepoModel with JsonConvert<RepoModel> {
  int id;
  @JSONField("node_id")
  String nodeId;
  String name;
  @JSONField("full_name")
  String fullName;
  bool private;
  UserModel owner;
  @JSONField("html_url")
  String htmlUrl;
  String description;
  bool fork;
  String url;
  @JSONField("forks_url")
  String forksUrl;
  @JSONField("keys_url")
  String keysUrl;
  @JSONField("collaborators_url")
  String collaboratorsUrl;
  @JSONField("teams_url")
  String teamsUrl;
  @JSONField("hooks_url")
  String hooksUrl;
  @JSONField("issue_events_url")
  String issueEventsUrl;
  @JSONField("events_url")
  String eventsUrl;
  @JSONField("assignees_url")
  String assigneesUrl;
  @JSONField("branches_url")
  String branchesUrl;
  @JSONField("tags_url")
  String tagsUrl;
  @JSONField("blobs_url")
  String blobsUrl;
  @JSONField("git_tags_url")
  String gitTagsUrl;
  @JSONField("git_refs_url")
  String gitRefsUrl;
  @JSONField("trees_url")
  String treesUrl;
  @JSONField("statuses_url")
  String statusesUrl;
  @JSONField("languages_url")
  String languagesUrl;
  @JSONField("stargazers_url")
  String stargazersUrl;
  @JSONField("contributors_url")
  String contributorsUrl;
  @JSONField("subscribers_url")
  String subscribersUrl;
  @JSONField("subscription_url")
  String subscriptionUrl;
  @JSONField("commits_url")
  String commitsUrl;
  @JSONField("git_commits_url")
  String gitCommitsUrl;
  @JSONField("comments_url")
  String commentsUrl;
  @JSONField("issue_comment_url")
  String issueCommentUrl;
  @JSONField("contents_url")
  String contentsUrl;
  @JSONField("compare_url")
  String compareUrl;
  @JSONField("merges_url")
  String mergesUrl;
  @JSONField("archive_url")
  String archiveUrl;
  @JSONField("downloads_url")
  String downloadsUrl;
  @JSONField("issues_url")
  String issuesUrl;
  @JSONField("pulls_url")
  String pullsUrl;
  @JSONField("milestones_url")
  String milestonesUrl;
  @JSONField("notifications_url")
  String notificationsUrl;
  @JSONField("labels_url")
  String labelsUrl;
  @JSONField("releases_url")
  String releasesUrl;
  @JSONField("deployments_url")
  String deploymentsUrl;
  @JSONField("created_at")
  String createdAt;
  @JSONField("updated_at")
  String updatedAt;
  @JSONField("pushed_at")
  String pushedAt;
  @JSONField("git_url")
  String gitUrl;
  @JSONField("ssh_url")
  String sshUrl;
  @JSONField("clone_url")
  String cloneUrl;
  @JSONField("svn_url")
  String svnUrl;
  String homepage;
  int size;
  @JSONField("stargazers_count")
  int stargazersCount;
  @JSONField("watchers_count")
  int watchersCount;
  String language;
  @JSONField("has_issues")
  bool hasIssues;
  @JSONField("has_projects")
  bool hasProjects;
  @JSONField("has_downloads")
  bool hasDownloads;
  @JSONField("has_wiki")
  bool hasWiki;
  @JSONField("has_pages")
  bool hasPages;
  @JSONField("forks_count")
  int forksCount;
  @JSONField("mirror_url")
  dynamic mirrorUrl;
  bool archived;
  bool disabled;
  @JSONField("open_issues_count")
  int openIssuesCount;
  dynamic license;
  int forks;
  @JSONField("open_issues")
  int openIssues;
  int watchers;
  @JSONField("default_branch")
  String defaultBranch;
  @JSONField("temp_clone_token")
  dynamic tempCloneToken;
  @JSONField("network_count")
  int networkCount;
  @JSONField("subscribers_count")
  int subscribersCount;

  @override
  String toString() {
    return 'RepoModel{url: $url}';
  }
}
