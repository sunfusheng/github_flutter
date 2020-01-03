# GitHub-Flutter

A new Flutter application for GitHub.

## Apis

### 1、用户信息

1.1、根据用户名密码获取用户信息
curl -u "<用户名>" https://api.github.com/user

1.2、获取他人的用户信息
curl https://api.github.com/users/<用户名>

### 2、获取仓库信息

curl https://api.github.com/repos/<用户名>/<仓库详名>

### 3、获取个人动态事件

curl https://api.github.com/users/<用户名>/received_events