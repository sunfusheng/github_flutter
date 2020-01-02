# github_flutter

A new Flutter application for GitHub.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### 1、用户信息

1.1、根据用户名密码获取用户信息
curl -u "<用户名>" https://api.github.com/user

1.2、获取他人的用户信息
curl https://api.github.com/users/<用户名>

### 2、获取仓库信息

curl https://api.github.com/repos/<用户名>/<仓库详名>

### 3、获取个人动态事件

curl https://api.github.com/users/<用户名>/received_events