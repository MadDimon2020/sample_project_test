import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/controllers/api_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final deviceWidth = Get.width;
  final deviceHeight = Get.height;
  double get _masterContainerWidth => deviceWidth;
  double get _masterContainerHeight => _masterContainerWidth * 0.53;
  double get _masterContainerMargin => deviceWidth * 0.015;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: Icon(Icons.more_vert),
        title: Text('Awesome Posts'),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red.shade400),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              label: Text('Logout'),
              icon: Icon(Icons.logout),
              onPressed: ApiController.to.logout,
            ),
          ),
        ],
      ),
      body: Subscription(
        options: SubscriptionOptions(
          document: gql(HomeController.newsSubscription),
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
          var news = result.data['news'] as List<dynamic>;
          return ListView.builder(
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
                  splashColor: Theme.of(context).primaryColor,
                  child: Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 5.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: _masterContainerHeight * 0.04,
                                  left: _masterContainerWidth * 0.04,
                                  right: _masterContainerWidth * 0.03,
                                  bottom: _masterContainerHeight * 0.04,
                                ),
                                width: (_masterContainerWidth -
                                        _masterContainerMargin * 2) *
                                    0.63,
                                height: (_masterContainerHeight * 0.58),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    news[index]['title'],
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
                              Container(
                                padding: EdgeInsets.only(
                                    left: _masterContainerWidth * 0.04,
                                    right: _masterContainerWidth * 0.01),
                                width: (_masterContainerWidth -
                                        _masterContainerMargin * 2) *
                                    0.63,
                                height: (_masterContainerHeight -
                                        _masterContainerMargin * 2) *
                                    0.21,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    news[index]['content'],
                                    style: TextStyle(
                                      fontSize: _masterContainerHeight * 0.08,
                                    ),
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: (_masterContainerWidth -
                                    _masterContainerMargin * 2) *
                                0.34,
                            height: (_masterContainerWidth -
                                    _masterContainerMargin * 2) *
                                0.36,
                            padding: EdgeInsets.only(
                              right: _masterContainerWidth * 0.02,
                              bottom: _masterContainerWidth * 0.05,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/user-image-placeholder.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: (_masterContainerWidth -
                                      _masterContainerMargin * 2) *
                                  0.55,
                              height: (_masterContainerHeight -
                                      _masterContainerMargin * 2) *
                                  0.18,
                              child: Align(
                                child: Text(
                                  '${DateFormat('EEEE, dd LLLL yyyy').format(DateTime.parse(news[index]['created_at'].toString()))}',
                                  style: TextStyle(
                                      fontSize: _masterContainerHeight * 0.07),
                                ),
                              ),
                            ),
                            Container(
                              width: (_masterContainerWidth -
                                      _masterContainerMargin * 2) *
                                  0.4,
                              height: (_masterContainerHeight -
                                      _masterContainerMargin * 2) *
                                  0.18,
                              child: Align(
                                child: Text(
                                  'Post by {author name}',
                                  style: TextStyle(
                                      fontSize: _masterContainerHeight * 0.07),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: news.length,
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
