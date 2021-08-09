import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/app/modules/home/controllers/home_controller.dart';
import 'package:sample_project/app/modules/home/home_widgets/error_message.dart';
import 'package:sample_project/app/modules/home/home_widgets/news_card.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

import '../controllers/reading_list_controller.dart';

class ReadingListView extends GetView<ReadingListController> {
  double get deviceWidth => Get.width;
  double get deviceHeight => Get.height;
  double get _masterContainerWidth => deviceWidth;
  double get _masterContainerHeight => _masterContainerWidth * 0.53;
  double get _masterContainerMargin => deviceWidth * 0.015;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reading List'),
        centerTitle: true,
      ),
      body: Query(
        options: QueryOptions(
          document: ReadingListQuery().document,
          variables: {"_in": HomeController.to.readingList},
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            log(result.exception.toString(), name: 'ReadingListView');
            return ErrorMessageView();
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // final fetchedNews = result.data['news'] as List<dynamic>;
          final fetchedNews = ReadingList$QueryRoot.fromJson(result.data).news;
          var orderedReadingList = fetchedNews != null
              ? ReadingListController.to.orderFetchedData(fetchedNews)
              : null;
          return orderedReadingList == null
              ? _buildEmptyListMessage()
              : Scrollbar(
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
                        interactiveButton: false,
                        refetchFn: refetch,
                      );
                    },
                    itemCount: orderedReadingList.length,
                  ),
                );
        },
      ),
    );
  }

  Center _buildEmptyListMessage() {
    return Center(
      child: Container(
        height: _masterContainerHeight,
        padding: EdgeInsets.all(_masterContainerMargin),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.greenAccent,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 65,
                child: Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _masterContainerMargin),
                    child: Text(
                      'You have no posts added to your reading list. Please return to the home page and select the desired news by pressing the "SAVE" button.',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: deviceHeight * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 35,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(8.0),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                    icon: Icon(Icons.home),
                    label: Text(
                      'Return to the Homepage',
                      style: TextStyle(
                          fontSize: deviceHeight * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: _masterContainerHeight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
