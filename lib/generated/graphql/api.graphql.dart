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
class AddNewPost$MutationRoot$InsertNewsOne with EquatableMixin {
  AddNewPost$MutationRoot$InsertNewsOne();

  factory AddNewPost$MutationRoot$InsertNewsOne.fromJson(
          Map<String, dynamic> json) =>
      _$AddNewPost$MutationRoot$InsertNewsOneFromJson(json);

  String title;

  String content;

  @override
  List<Object> get props => [title, content];
  Map<String, dynamic> toJson() =>
      _$AddNewPost$MutationRoot$InsertNewsOneToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddNewPost$MutationRoot with EquatableMixin {
  AddNewPost$MutationRoot();

  factory AddNewPost$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$AddNewPost$MutationRootFromJson(json);

  @JsonKey(name: 'insert_news_one')
  AddNewPost$MutationRoot$InsertNewsOne insertNewsOne;

  @override
  List<Object> get props => [insertNewsOne];
  Map<String, dynamic> toJson() => _$AddNewPost$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReadingList$QueryRoot$News with EquatableMixin {
  ReadingList$QueryRoot$News();

  factory ReadingList$QueryRoot$News.fromJson(Map<String, dynamic> json) =>
      _$ReadingList$QueryRoot$NewsFromJson(json);

  String content;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  String id;

  String title;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [content, createdAt, id, title, userId];
  Map<String, dynamic> toJson() => _$ReadingList$QueryRoot$NewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReadingList$QueryRoot with EquatableMixin {
  ReadingList$QueryRoot();

  factory ReadingList$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$ReadingList$QueryRootFromJson(json);

  List<ReadingList$QueryRoot$News> news;

  @override
  List<Object> get props => [news];
  Map<String, dynamic> toJson() => _$ReadingList$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchPostByIdQuery$QueryRoot$NewsByPk$Author with EquatableMixin {
  FetchPostByIdQuery$QueryRoot$NewsByPk$Author();

  factory FetchPostByIdQuery$QueryRoot$NewsByPk$Author.fromJson(
          Map<String, dynamic> json) =>
      _$FetchPostByIdQuery$QueryRoot$NewsByPk$AuthorFromJson(json);

  @JsonKey(name: 'display_name')
  String displayName;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @override
  List<Object> get props => [displayName, avatarUrl];
  Map<String, dynamic> toJson() =>
      _$FetchPostByIdQuery$QueryRoot$NewsByPk$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchPostByIdQuery$QueryRoot$NewsByPk with EquatableMixin {
  FetchPostByIdQuery$QueryRoot$NewsByPk();

  factory FetchPostByIdQuery$QueryRoot$NewsByPk.fromJson(
          Map<String, dynamic> json) =>
      _$FetchPostByIdQuery$QueryRoot$NewsByPkFromJson(json);

  FetchPostByIdQuery$QueryRoot$NewsByPk$Author author;

  String content;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  String id;

  String title;

  @override
  List<Object> get props => [author, content, createdAt, id, title];
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
class NewsFeed$SubscriptionRoot$News$Author with EquatableMixin {
  NewsFeed$SubscriptionRoot$News$Author();

  factory NewsFeed$SubscriptionRoot$News$Author.fromJson(
          Map<String, dynamic> json) =>
      _$NewsFeed$SubscriptionRoot$News$AuthorFromJson(json);

  @JsonKey(name: 'display_name')
  String displayName;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @override
  List<Object> get props => [displayName, avatarUrl];
  Map<String, dynamic> toJson() =>
      _$NewsFeed$SubscriptionRoot$News$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsFeed$SubscriptionRoot$News with EquatableMixin {
  NewsFeed$SubscriptionRoot$News();

  factory NewsFeed$SubscriptionRoot$News.fromJson(Map<String, dynamic> json) =>
      _$NewsFeed$SubscriptionRoot$NewsFromJson(json);

  NewsFeed$SubscriptionRoot$News$Author author;

  String content;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  String id;

  String title;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [author, content, createdAt, id, title, userId];
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
class AddNewPostArguments extends JsonSerializable with EquatableMixin {
  AddNewPostArguments({this.content, this.title});

  @override
  factory AddNewPostArguments.fromJson(Map<String, dynamic> json) =>
      _$AddNewPostArgumentsFromJson(json);

  final String content;

  final String title;

  @override
  List<Object> get props => [content, title];
  @override
  Map<String, dynamic> toJson() => _$AddNewPostArgumentsToJson(this);
}

class AddNewPostMutation
    extends GraphQLQuery<AddNewPost$MutationRoot, AddNewPostArguments> {
  AddNewPostMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'AddNewPost'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'content')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'title')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_news_one'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'object'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'content'),
                          value:
                              VariableNode(name: NameNode(value: 'content'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'AddNewPost';

  @override
  final AddNewPostArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AddNewPost$MutationRoot parse(Map<String, dynamic> json) =>
      AddNewPost$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ReadingListArguments extends JsonSerializable with EquatableMixin {
  ReadingListArguments({this.$in});

  @override
  factory ReadingListArguments.fromJson(Map<String, dynamic> json) =>
      _$ReadingListArgumentsFromJson(json);

  @JsonKey(name: '_in')
  final List<String> $in;

  @override
  List<Object> get props => [$in];
  @override
  Map<String, dynamic> toJson() => _$ReadingListArgumentsToJson(this);
}

class ReadingListQuery
    extends GraphQLQuery<ReadingList$QueryRoot, ReadingListArguments> {
  ReadingListQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'ReadingList'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: '_in')),
              type: ListTypeNode(
                  type: NamedTypeNode(
                      name: NameNode(value: 'uuid'), isNonNull: true),
                  isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'news'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_in'),
                                value:
                                    VariableNode(name: NameNode(value: '_in')))
                          ]))
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
  final String operationName = 'ReadingList';

  @override
  final ReadingListArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  ReadingList$QueryRoot parse(Map<String, dynamic> json) =>
      ReadingList$QueryRoot.fromJson(json);
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
                    name: NameNode(value: 'author'),
                    alias: null,
                    arguments: [],
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
                    ])),
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
                    name: NameNode(value: 'author'),
                    alias: null,
                    arguments: [],
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
                    ])),
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
