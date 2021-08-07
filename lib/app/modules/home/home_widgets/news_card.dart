import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/app/modules/home/controllers/home_controller.dart';
import 'package:sample_project/app/modules/reading_list/controllers/reading_list_controller.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

class NewsCard extends GetWidget<HomeController> {
  final String postId;
  final String postTitle;
  final String postContent;
  final String authorId;
  final DateTime createdAt;
  final bool interactiveButton;
  final Future<QueryResult> Function() refetchFn;

  const NewsCard({
    Key key,
    @required this.postId,
    @required this.postTitle,
    @required this.postContent,
    @required this.authorId,
    @required this.createdAt,
    @required this.interactiveButton,
    this.refetchFn,
  }) : super(key: key);

  double get deviceWidth => Get.width;
  double get deviceHeight => Get.height;
  double get _masterContainerWidth => deviceWidth;
  double get _masterContainerHeight => _masterContainerWidth * 0.53;
  double get _masterContainerMargin => deviceWidth * 0.015;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ObjectKey(NewsCard),
      height: _masterContainerHeight,
      width: _masterContainerWidth,
      margin: EdgeInsets.only(
        left: _masterContainerMargin,
        right: _masterContainerMargin,
        top: _masterContainerMargin * 2,
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.POST_DETAILS, arguments: [postId]);
        },
        splashColor: Theme.of(context).primaryColor,
        child: Card(
          color: Colors.grey[300],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 8.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 80,
                child: Row(children: [
                  //Title, content and date of the news.
                  buildNewsSection(),
                  Flexible(
                    flex: 30,
                    child: Column(
                      children: [
                        //User name and avatar
                        buildUserDetails(),
                        // SAVE/UNSAVE-Button
                        buildNewsCardButton(
                          interactive: interactiveButton,
                          refetchReadingList: refetchFn,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Flexible buildNewsSection() {
    return Flexible(
      flex: 70,
      child: Column(
        children: [
          Flexible(
            flex: 60,
            child: Container(
              margin: EdgeInsets.only(
                top: _masterContainerWidth * 0.03,
                left: _masterContainerWidth * 0.04,
                right: _masterContainerWidth * 0.04,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  postTitle,
                  style: TextStyle(
                    fontSize: _masterContainerHeight * 0.10,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 25,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: _masterContainerHeight * 0.04,
                horizontal: _masterContainerWidth * 0.04,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  postContent,
                  style: TextStyle(
                    fontSize: _masterContainerHeight * 0.07,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 15,
            child: Container(
              padding: EdgeInsets.only(bottom: _masterContainerHeight * 0.03),
              child: Align(
                child: Text(
                  '${DateFormat('EEEE, dd LLLL yyyy').format(DateTime.parse(createdAt.toString()))}',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: _masterContainerHeight * 0.07),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible buildUserDetails() {
    return Flexible(
      flex: 80,
      child: (authorId != null && authorId != '')
          ? Query(
              options: QueryOptions(
                document: UserNameAndAvatarQuery().document,
                variables: {'id': authorId},
              ),
              builder: (result, {fetchMore, refetch}) {
                final userDetails =
                    UserNameAndAvatar$QueryRoot.fromJson(result.data).usersByPk;
                return Column(
                  children: [
                    //Author's avatar provided the data is available
                    Flexible(
                      flex: 80,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: _masterContainerWidth * 0.03,
                          right: _masterContainerWidth * 0.015,
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: (userDetails.avatarUrl != null &&
                                    userDetails.avatarUrl != '')
                                ? FadeInImage(
                                    width: _masterContainerWidth * 0.25,
                                    height: _masterContainerWidth * 0.25,
                                    fit: BoxFit.fill,
                                    placeholder: AssetImage(
                                        'assets/images/anonymous-user.jpg'),
                                    image: NetworkImage(
                                      userDetails.avatarUrl,
                                    ),
                                  )
                                : Image.asset(
                                    'assets/images/user-image-placeholder.jpg',
                                    width: _masterContainerWidth * 0.25,
                                    height: _masterContainerWidth * 0.25,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    //News author provided the data is available
                    Flexible(
                      flex: 20,
                      child: Container(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            (userDetails.displayName != null &&
                                    userDetails.displayName != '')
                                ? userDetails.displayName
                                : 'Author unknown',
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: _masterContainerHeight * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          : Column(
              children: [
                // Author's avatar placeholder
                Flexible(
                  flex: 80,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: _masterContainerWidth * 0.03,
                      right: _masterContainerWidth * 0.015,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/user-image-placeholder.jpg',
                          width: _masterContainerWidth * 0.25,
                          height: _masterContainerWidth * 0.25,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                // News author's name placeholder
                Flexible(
                  flex: 20,
                  child: Container(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Author unknown',
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: _masterContainerHeight * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Widget buildNewsCardButton(
      {@required bool interactive,
      Future<QueryResult> Function() refetchReadingList}) {
    return Flexible(
      flex: 20,
      child: Container(
        padding: EdgeInsets.only(bottom: _masterContainerHeight * 0.04),
        child: Align(
          child: interactive == true
              ? Obx(
                  () => ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
                        ),
                        backgroundColor:
                            !controller.readingList.contains(postId)
                                ? MaterialStateProperty.all<Color>(Colors.green)
                                : MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )),
                    child: Text(!controller.readingList.contains(postId)
                        ? '  SAVE  '
                        : 'UNSAVE'),
                    onPressed: () {
                      controller.saveUnsaveHandler(postId);
                    },
                  ),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      )),
                  child: Text('UNSAVE'),
                  onPressed: () {
                    ReadingListController.removeFromReadingList(
                      postId: postId,
                      refetchFn: refetchReadingList,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
