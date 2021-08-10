import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/app/modules/home/home_widgets/app_drawer.dart';
import 'package:sample_project/app/modules/home/home_widgets/news_card.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
            Get.defaultDialog(
              barrierDismissible: false,
              title: 'Oops... Something went wrong...',
              titleStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              middleText:
                  'Could not load data from server...n\Try to enter again later',
              middleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              actions: [
                ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text('Go to Login Screen'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    ApiController.to.logout();
                  },
                ),
              ],
            );
          } else if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final fetchedNews =
              NewsFeed$SubscriptionRoot.fromJson(result.data).news;
          return Scrollbar(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewsCard(
                  key: ValueKey(fetchedNews[index].id),
                  postId: fetchedNews[index].id,
                  postTitle: fetchedNews[index].title,
                  postContent: fetchedNews[index].content,
                  createdAt: fetchedNews[index].createdAt,
                  authorAvatarUrl: fetchedNews[index].author?.avatarUrl,
                  authorName: fetchedNews[index].author?.displayName,
                  interactiveButton: true,
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
