// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentUser$QueryRoot$User _$GetCurrentUser$QueryRoot$UserFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot$User()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..phoneNumber = json['phone_number'] as String;
}

Map<String, dynamic> _$GetCurrentUser$QueryRoot$UserToJson(
    GetCurrentUser$QueryRoot$User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('display_name', instance.displayName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}

GetCurrentUser$QueryRoot _$GetCurrentUser$QueryRootFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot()
    ..user = json['user'] == null
        ? null
        : GetCurrentUser$QueryRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetCurrentUser$QueryRootToJson(
    GetCurrentUser$QueryRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  return val;
}

CurrentUser$SubscriptionRoot$User _$CurrentUser$SubscriptionRoot$UserFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot$User()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..phoneNumber = json['phone_number'] as String;
}

Map<String, dynamic> _$CurrentUser$SubscriptionRoot$UserToJson(
    CurrentUser$SubscriptionRoot$User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('display_name', instance.displayName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}

CurrentUser$SubscriptionRoot _$CurrentUser$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot()
    ..user = json['user'] == null
        ? null
        : CurrentUser$SubscriptionRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CurrentUser$SubscriptionRootToJson(
    CurrentUser$SubscriptionRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  return val;
}

NewsFeed$SubscriptionRoot$News _$NewsFeed$SubscriptionRoot$NewsFromJson(
    Map<String, dynamic> json) {
  return NewsFeed$SubscriptionRoot$News()
    ..content = json['content'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..userId = json['user_id'] as String;
}

Map<String, dynamic> _$NewsFeed$SubscriptionRoot$NewsToJson(
    NewsFeed$SubscriptionRoot$News instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('user_id', instance.userId);
  return val;
}

NewsFeed$SubscriptionRoot _$NewsFeed$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return NewsFeed$SubscriptionRoot()
    ..news = (json['news'] as List)
        ?.map((e) => e == null
            ? null
            : NewsFeed$SubscriptionRoot$News.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewsFeed$SubscriptionRootToJson(
    NewsFeed$SubscriptionRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('news', instance.news?.map((e) => e?.toJson())?.toList());
  return val;
}

FetchPostByIdQuery$QueryRoot$NewsByPk
    _$FetchPostByIdQuery$QueryRoot$NewsByPkFromJson(Map<String, dynamic> json) {
  return FetchPostByIdQuery$QueryRoot$NewsByPk()
    ..content = json['content'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..userId = json['user_id'] as String;
}

Map<String, dynamic> _$FetchPostByIdQuery$QueryRoot$NewsByPkToJson(
    FetchPostByIdQuery$QueryRoot$NewsByPk instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('user_id', instance.userId);
  return val;
}

FetchPostByIdQuery$QueryRoot _$FetchPostByIdQuery$QueryRootFromJson(
    Map<String, dynamic> json) {
  return FetchPostByIdQuery$QueryRoot()
    ..newsByPk = json['news_by_pk'] == null
        ? null
        : FetchPostByIdQuery$QueryRoot$NewsByPk.fromJson(
            json['news_by_pk'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FetchPostByIdQuery$QueryRootToJson(
    FetchPostByIdQuery$QueryRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('news_by_pk', instance.newsByPk?.toJson());
  return val;
}

GetCurrentUserArguments _$GetCurrentUserArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUserArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$GetCurrentUserArgumentsToJson(
    GetCurrentUserArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  return val;
}

CurrentUserArguments _$CurrentUserArgumentsFromJson(Map<String, dynamic> json) {
  return CurrentUserArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$CurrentUserArgumentsToJson(
    CurrentUserArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  return val;
}

FetchPostByIdQueryArguments _$FetchPostByIdQueryArgumentsFromJson(
    Map<String, dynamic> json) {
  return FetchPostByIdQueryArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$FetchPostByIdQueryArgumentsToJson(
    FetchPostByIdQueryArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}
