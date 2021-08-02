import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/app/modules/home/home_widgets/app_drawer.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/controllers/controllers.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  double get deviceWidth => Get.width;
  double get deviceHeight => Get.height;
  double get _masterContainerWidth => deviceWidth;
  double get _masterContainerHeight => _masterContainerWidth * 0.53;
  double get _masterContainerMargin => deviceWidth * 0.015;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    if (_scaffoldKey.currentState != null)
      _scaffoldKey.currentState.openDrawer();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: _openDrawer),
        title: Text('Awesome Posts'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Subscription(
        options: SubscriptionOptions(
          document: NewsFeedSubscription().document,
        ),
        builder: (result) {
          if (result.hasException) {
            log(result.exception.toString(), name: 'HomeView');
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Align(
                      child: Text(
                        'Oops...\n Something went wrong...\n Try to login again',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: deviceHeight * 0.03,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.01,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                    onPressed: () {
                      ApiController.to.logout();
                    },
                    child: Text(
                      'Go to Login page',
                      style: TextStyle(fontSize: deviceHeight * 0.03),
                    ),
                  ),
                ],
              ),
            );
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var fetchedNews =
              NewsFeed$SubscriptionRoot.fromJson(result.data).news;
          return Scrollbar(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: _masterContainerHeight,
                  width: _masterContainerWidth,
                  margin: EdgeInsets.only(
                    left: _masterContainerMargin,
                    right: _masterContainerMargin,
                    top: _masterContainerMargin * 2,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.POST_DETAILS,
                          arguments: [fetchedNews[index].id]);
                    },
                    splashColor: Theme.of(context).primaryColor,
                    child: Card(
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 8.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Row(children: [
                              Flexible(
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
                                            fetchedNews[index].title,
                                            style: TextStyle(
                                              fontSize:
                                                  _masterContainerHeight * 0.10,
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
                                          vertical:
                                              _masterContainerHeight * 0.04,
                                          horizontal:
                                              _masterContainerWidth * 0.04,
                                        ),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            fetchedNews[index].content,
                                            style: TextStyle(
                                              fontSize:
                                                  _masterContainerHeight * 0.07,
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
                                        padding: EdgeInsets.only(
                                            bottom:
                                                _masterContainerHeight * 0.03),
                                        child: Align(
                                          child: Text(
                                            '${DateFormat('EEEE, dd LLLL yyyy').format(DateTime.parse(fetchedNews[index].createdAt.toString()))}',
                                            style: TextStyle(
                                                fontSize:
                                                    _masterContainerHeight *
                                                        0.07),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 30,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 60,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: _masterContainerWidth * 0.03,
                                          right: _masterContainerWidth * 0.03,
                                        ),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              'assets/images/user-image-placeholder.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Query(
                                      options: QueryOptions(
                                        document: gql(HomeController
                                            .userNameAndAvatarQuery),
                                        variables: {
                                          'id': fetchedNews[index].userId
                                        },
                                      ),
                                      builder: (result, {fetchMore, refetch}) {
                                        final userDetails =
                                            result.data['users_by_pk']
                                                as Map<String, dynamic>;
                                        return Flexible(
                                          flex: 20,
                                          child: Container(
                                            child: Align(
                                              child: Text(
                                                userDetails != null
                                                    ? userDetails[
                                                        'display_name']
                                                    : 'Author unknown',
                                                softWrap: true,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize:
                                                        _masterContainerHeight *
                                                            0.07),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Flexible(
                                      flex: 20,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                _masterContainerHeight * 0.04),
                                        child: Align(
                                          child: Obx(
                                            () => ElevatedButton(
                                              style: ButtonStyle(
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                    EdgeInsets.symmetric(
                                                        horizontal:
                                                            deviceWidth * 0.04),
                                                  ),
                                                  backgroundColor: !controller
                                                          .readingList
                                                          .contains(
                                                              fetchedNews[index]
                                                                  .id)
                                                      ? MaterialStateProperty
                                                          .all<Color>(
                                                              Colors.green)
                                                      : MaterialStateProperty
                                                          .all<Color>(
                                                              Colors.red),
                                                  shape: MaterialStateProperty
                                                      .all<OutlinedBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                  )),
                                              child: Text(!controller
                                                      .readingList
                                                      .contains(
                                                          fetchedNews[index].id)
                                                  ? '  SAVE  '
                                                  : 'UNSAVE'),
                                              onPressed: () async {
                                                log('Save/Unsave-button pressed',
                                                    name: 'HomeView');
                                                var dataList = await controller
                                                    .readingListDB
                                                    .query(
                                                  'post_ids',
                                                  columns: ['post_id'],
                                                  where: 'post_id = ?',
                                                  whereArgs: [
                                                    fetchedNews[index].id
                                                  ],
                                                );
                                                dataList.length == 0
                                                    ? await controller
                                                        .insertToDatabase({
                                                        'post_id':
                                                            '${fetchedNews[index].id}'
                                                      })
                                                    : controller
                                                        .deleteFromDatabase(
                                                            fetchedNews[index]
                                                                .id);
                                                !controller.readingList
                                                        .contains(
                                                            fetchedNews[index]
                                                                .id)
                                                    ? controller
                                                        .insertToReadingList(
                                                            fetchedNews[index]
                                                                .id)
                                                    : controller
                                                        .deleteFromReadingList(
                                                            fetchedNews[index]
                                                                .id);
                                                dataList = await controller
                                                    .readingListDB
                                                    .query('post_ids');
                                                print(dataList);
                                                print(controller.readingList);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
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
              },
              itemCount: fetchedNews.length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a new post',
        backgroundColor: Colors.blue.withOpacity(0.7),
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.NEW_POST);
        },
      ),
    );
  }
}
