import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/app/modules/home/home_widgets/app_drawer.dart';
import 'package:sample_project/app/modules/home/home_widgets/error_message.dart';
import 'package:sample_project/app/modules/home/home_widgets/news_card.dart';
import 'package:sample_project/app/routes/app_pages.dart';
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
            return ErrorMessageView();
          }
          if (result.isLoading) {
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
