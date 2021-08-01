import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/app/modules/home/controllers/home_controller.dart';
import 'package:sample_project/app/routes/app_pages.dart';

import '../controllers/reading_list_controller.dart';

class ReadingListView extends GetView<ReadingListController> {
  double get deviceWidth => Get.width;
  double get deviceHeight => Get.height;
  double get _masterContainerWidth => deviceWidth;
  double get _masterContainerHeight => _masterContainerWidth * 0.53;
  double get _masterContainerMargin => deviceWidth * 0.015;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My Reading List'),
        centerTitle: true,
      ),
      body: Query(
        options: QueryOptions(
          document: gql(ReadingListController.readingList),
          variables: {"_in": homeController.readingList},
        ),
        builder: (result, {fetchMore, refetch}) {
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
          var fetchedNews = result.data['news'] as List<dynamic>;
          var orderedReadingList = fetchedNews != null
              ? ReadingListController.to.orderFetchedData(fetchedNews)
              : null;
          return orderedReadingList == null
              ? Center(
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
                                    elevation:
                                        MaterialStateProperty.all<double>(8.0),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
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
                        ],
                      ),
                    ),
                  ),
                )
              : Scrollbar(
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
                                arguments: [orderedReadingList[index]['id']]);
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
                                            flex: 70,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                top: _masterContainerWidth *
                                                    0.03,
                                                left: _masterContainerWidth *
                                                    0.04,
                                                right: _masterContainerWidth *
                                                    0.04,
                                              ),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  orderedReadingList[index]
                                                      ['title'],
                                                  style: TextStyle(
                                                    fontSize:
                                                        _masterContainerHeight *
                                                            0.10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 4,
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 30,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical:
                                                    _masterContainerHeight *
                                                        0.04,
                                                horizontal:
                                                    _masterContainerWidth *
                                                        0.04,
                                              ),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  orderedReadingList[index]
                                                      ['content'],
                                                  style: TextStyle(
                                                    fontSize:
                                                        _masterContainerHeight *
                                                            0.07,
                                                  ),
                                                  maxLines: 2,
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                top: _masterContainerWidth *
                                                    0.03,
                                                right: _masterContainerWidth *
                                                    0.03,
                                              ),
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
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
                                                      padding:
                                                          MaterialStateProperty
                                                              .all<EdgeInsets>(
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                deviceWidth *
                                                                    0.04),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.red),
                                                      shape: MaterialStateProperty
                                                          .all<OutlinedBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      )),
                                                  child: Text('UNSAVE'),
                                                  onPressed: () async {
                                                    log('Unsave-button pressed',
                                                        name:
                                                            'ReadingListView');
                                                    await homeController
                                                        .deleteFromDatabase(
                                                            orderedReadingList[
                                                                index]['id']);
                                                    homeController
                                                        .deleteFromReadingList(
                                                            orderedReadingList[
                                                                index]['id']);
                                                    await refetch();
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
                                              '${DateFormat('EEEE, dd LLLL yyyy').format(DateTime.parse(orderedReadingList[index]['created_at'].toString()))}',
                                              style: TextStyle(
                                                  fontSize:
                                                      _masterContainerHeight *
                                                          0.07),
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
                                                      _masterContainerHeight *
                                                          0.07),
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
                    itemCount: orderedReadingList.length,
                  ),
                );
        },
      ),
    );
  }
}
