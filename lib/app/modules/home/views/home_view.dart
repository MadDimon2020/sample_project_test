import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/app/modules/home/home_widgets/app_drawer.dart';
import 'package:sample_project/app/routes/app_pages.dart';
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
      backgroundColor: Colors.grey[400],
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
            return Center(
              child: Text(result.exception.toString()),
            );
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var fetchedNews =
              NewsFeed$SubscriptionRoot.fromJson(result.data).news;
          return CupertinoScrollbar(
            isAlwaysShown: true,
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
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 5.0,
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
                                      flex: 70,
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
                                      flex: 30,
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
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 30,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 75,
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
                                    Flexible(
                                      flex: 25,
                                      child: Container(
                                        child: Align(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsets>(
                                                  EdgeInsets.symmetric(
                                                      horizontal:
                                                          deviceWidth * 0.04),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.green),
                                                shape: MaterialStateProperty
                                                    .all<OutlinedBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                )),
                                            child: Text('SAVE'),
                                            onPressed: () async {
                                              print('SAVE-Button pressed');
                                              await controller
                                                  .insertToReadingList({
                                                'post_id':
                                                    '${fetchedNews[index].id}'
                                              });
                                              var dataList = await controller
                                                  .readingListDB
                                                  .query('post_ids');
                                              print(dataList);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          Flexible(
                            flex: 20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  flex: 55,
                                  child: Container(
                                    child: Align(
                                      child: Text(
                                        '${DateFormat('EEEE, dd LLLL yyyy').format(DateTime.parse(fetchedNews[index].createdAt.toString()))}',
                                        style: TextStyle(
                                            fontSize:
                                                _masterContainerHeight * 0.07),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 45,
                                  child: Container(
                                    child: Align(
                                      child: Text(
                                        'Posted by {author name}',
                                        style: TextStyle(
                                            fontSize:
                                                _masterContainerHeight * 0.07),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
