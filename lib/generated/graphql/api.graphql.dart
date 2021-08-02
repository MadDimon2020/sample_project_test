// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.graphql.g.dart';

mixin UserMixin {
  @JsonKey(name: '__typename')
  String $$typename;
  String id;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;
  @JsonKey(name: 'display_name')
  String displayName;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUser$QueryRoot$User with EquatableMixin, UserMixin {
  GetCurrentUser$QueryRoot$User();

  factory GetCurrentUser$QueryRoot$User.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUser$QueryRoot$UserFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber
      ];
  Map<String, dynamic> toJson() => _$GetCurrentUser$QueryRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUser$QueryRoot with EquatableMixin {
  GetCurrentUser$QueryRoot();

  factory GetCurrentUser$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUser$QueryRootFromJson(json);

  GetCurrentUser$QueryRoot$User user;

  @override
  List<Object> get props => [user];
  Map<String, dynamic> toJson() => _$GetCurrentUser$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$SubscriptionRoot$User with EquatableMixin, UserMixin {
  CurrentUser$SubscriptionRoot$User();

  factory CurrentUser$SubscriptionRoot$User.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentUser$SubscriptionRoot$UserFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber
      ];
  Map<String, dynamic> toJson() =>
      _$CurrentUser$SubscriptionRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$SubscriptionRoot with EquatableMixin {
  CurrentUser$SubscriptionRoot();

  factory CurrentUser$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$CurrentUser$SubscriptionRootFromJson(json);

  CurrentUser$SubscriptionRoot$User user;

  @override
  List<Object> get props => [user];
  Map<String, dynamic> toJson() => _$CurrentUser$SubscriptionRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsFeed$SubscriptionRoot$News with EquatableMixin {
  NewsFeed$SubscriptionRoot$News();

  factory NewsFeed$SubscriptionRoot$News.fromJson(Map<String, dynamic> json) =>
      _$NewsFeed$SubscriptionRoot$NewsFromJson(json);

  String content;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  String id;

  String title;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [content, createdAt, id, title, userId];
  Map<String, dynamic> toJson() => _$NewsFeed$SubscriptionRoot$NewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsFeed$SubscriptionRoot with EquatableMixin {
  NewsFeed$SubscriptionRoot();

  factory NewsFeed$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$NewsFeed$SubscriptionRootFromJson(json);

  List<NewsFeed$SubscriptionRoot$News> news;

  @override
  List<Object> get props => [news];
  Map<String, dynamic> toJson() => _$NewsFeed$SubscriptionRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchPostByIdQuery$QueryRoot$NewsByPk with EquatableMixin {
  FetchPostByIdQuery$QueryRoot$NewsByPk();

  factory FetchPostByIdQuery$QueryRoot$NewsByPk.fromJson(
          Map<String, dynamic> json) =>
      _$FetchPostByIdQuery$QueryRoot$NewsByPkFromJson(json);

  String content;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  String id;

  String title;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [content, createdAt, id, title, userId];
  Map<String, dynamic> toJson() =>
      _$FetchPostByIdQuery$QueryRoot$NewsByPkToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchPostByIdQuery$QueryRoot with EquatableMixin {
  FetchPostByIdQuery$QueryRoot();

  factory FetchPostByIdQuery$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$FetchPostByIdQuery$QueryRootFromJson(json);

  @JsonKey(name: 'news_by_pk')
  FetchPostByIdQuery$QueryRoot$NewsByPk newsByPk;

  @override
  List<Object> get props => [newsByPk];
  Map<String, dynamic> toJson() => _$FetchPostByIdQuery$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserNameAndAvatar$QueryRoot$UsersByPk with EquatableMixin {
  UserNameAndAvatar$QueryRoot$UsersByPk();

  factory UserNameAndAvatar$QueryRoot$UsersByPk.fromJson(
          Map<String, dynamic> json) =>
      _$UserNameAndAvatar$QueryRoot$UsersByPkFromJson(json);

  @JsonKey(name: 'display_name')
  String displayName;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @override
  List<Object> get props => [displayName, avatarUrl];
  Map<String, dynamic> toJson() =>
      _$UserNameAndAvatar$QueryRoot$UsersByPkToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserNameAndAvatar$QueryRoot with EquatableMixin {
  UserNameAndAvatar$QueryRoot();

  factory UserNameAndAvatar$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$UserNameAndAvatar$QueryRootFromJson(json);

  @JsonKey(name: 'users_by_pk')
  UserNameAndAvatar$QueryRoot$UsersByPk usersByPk;

  @override
  List<Object> get props => [usersByPk];
  Map<String, dynamic> toJson() => _$UserNameAndAvatar$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUserArguments extends JsonSerializable with EquatableMixin {
  GetCurrentUserArguments({@required this.userId});

  @override
  factory GetCurrentUserArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserArgumentsFromJson(json);

  final String userId;

  @override
  List<Object> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentUserArgumentsToJson(this);
}

class GetCurrentUserQuery
    extends GraphQLQuery<GetCurrentUser$QueryRoot, GetCurrentUserArguments> {
  GetCurrentUserQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetCurrentUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'users_by_pk'),
              alias: NameNode(value: 'user'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'userId')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'User'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'User'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'users'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'updated_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'display_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'avatar_url'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'phone_number'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'GetCurrentUser';

  @override
  final GetCurrentUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetCurrentUser$QueryRoot parse(Map<String, dynamic> json) =>
      GetCurrentUser$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CurrentUserArguments extends JsonSerializable with EquatableMixin {
  CurrentUserArguments({@required this.userId});

  @override
  factory CurrentUserArguments.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserArgumentsFromJson(json);

  final String userId;

  @override
  List<Object> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$CurrentUserArgumentsToJson(this);
}

class CurrentUserSubscription
    extends GraphQLQuery<CurrentUser$SubscriptionRoot, CurrentUserArguments> {
  CurrentUserSubscription({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: NameNode(value: 'CurrentUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'users_by_pk'),
              alias: NameNode(value: 'user'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'userId')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'User'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'User'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'users'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'updated_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'display_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'avatar_url'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'phone_number'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'CurrentUser';

  @override
  final CurrentUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CurrentUser$SubscriptionRoot parse(Map<String, dynamic> json) =>
      CurrentUser$SubscriptionRoot.fromJson(json);
}

class NewsFeedSubscription
    extends GraphQLQuery<NewsFeed$SubscriptionRoot, JsonSerializable> {
  NewsFeedSubscription();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: NameNode(value: 'newsFeed'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'news'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'order_by'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'created_at'),
                          value: EnumValueNode(name: NameNode(value: 'desc')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'created_at'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'user_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'newsFeed';

  @override
  List<Object> get props => [document, operationName];
  @override
  NewsFeed$SubscriptionRoot parse(Map<String, dynamic> json) =>
      NewsFeed$SubscriptionRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchPostByIdQueryArguments extends JsonSerializable with EquatableMixin {
  FetchPostByIdQueryArguments({@required this.id});

  @override
  factory FetchPostByIdQueryArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchPostByIdQueryArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$FetchPostByIdQueryArgumentsToJson(this);
}

class FetchPostByIdQueryQuery extends GraphQLQuery<FetchPostByIdQuery$QueryRoot,
    FetchPostByIdQueryArguments> {
  FetchPostByIdQueryQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'fetchPostByIdQuery'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'news_by_pk'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'created_at'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'user_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'fetchPostByIdQuery';

  @override
  final FetchPostByIdQueryArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  FetchPostByIdQuery$QueryRoot parse(Map<String, dynamic> json) =>
      FetchPostByIdQuery$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UserNameAndAvatarArguments extends JsonSerializable with EquatableMixin {
  UserNameAndAvatarArguments({@required this.id});

  @override
  factory UserNameAndAvatarArguments.fromJson(Map<String, dynamic> json) =>
      _$UserNameAndAvatarArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$UserNameAndAvatarArgumentsToJson(this);
}

class UserNameAndAvatarQuery extends GraphQLQuery<UserNameAndAvatar$QueryRoot,
    UserNameAndAvatarArguments> {
  UserNameAndAvatarQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'UserNameAndAvatar'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'users_by_pk'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'display_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'avatar_url'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'UserNameAndAvatar';

  @override
  final UserNameAndAvatarArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UserNameAndAvatar$QueryRoot parse(Map<String, dynamic> json) =>
      UserNameAndAvatar$QueryRoot.fromJson(json);
}
