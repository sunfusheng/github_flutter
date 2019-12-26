class AuthEntity {
  AuthApp app;
  String hashedToken;
  String note;
  String noteUrl;
  String updatedAt;
  String tokenLastEight;
  dynamic fingerprint;
  String createdAt;
  int id;
  List<String> scopes;
  String url;
  String token;

  AuthEntity(
      {this.app,
      this.hashedToken,
      this.note,
      this.noteUrl,
      this.updatedAt,
      this.tokenLastEight,
      this.fingerprint,
      this.createdAt,
      this.id,
      this.scopes,
      this.url,
      this.token});

  AuthEntity.fromJson(Map<String, dynamic> json) {
    app = json['app'] != null ? new AuthApp.fromJson(json['app']) : null;
    hashedToken = json['hashed_token'];
    note = json['note'];
    noteUrl = json['note_url'];
    updatedAt = json['updated_at'];
    tokenLastEight = json['token_last_eight'];
    fingerprint = json['fingerprint'];
    createdAt = json['created_at'];
    id = json['id'];
    scopes = json['scopes']?.cast<String>();
    url = json['url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.app != null) {
      data['app'] = this.app.toJson();
    }
    data['hashed_token'] = this.hashedToken;
    data['note'] = this.note;
    data['note_url'] = this.noteUrl;
    data['updated_at'] = this.updatedAt;
    data['token_last_eight'] = this.tokenLastEight;
    data['fingerprint'] = this.fingerprint;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['scopes'] = this.scopes;
    data['url'] = this.url;
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return 'AuthEntity{tokenLastEight: $tokenLastEight, token: $token}';
  }
}

class AuthApp {
  String name;
  String url;
  String clientId;

  AuthApp({this.name, this.url, this.clientId});

  AuthApp.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    clientId = json['client_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['client_id'] = this.clientId;
    return data;
  }
}
