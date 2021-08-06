import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/app/modules/home/controllers/home_controller.dart';
import 'package:sample_project/app/routes/app_pages.dart';
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
    final homeController = Get.put(HomeController());
    return Scaffold(
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
                          SizedBox(
                            height: _masterContainerHeight * 0.03,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                  top: _masterContainerWidth *
                                                      0.03,
                                                  left: _masterContainerWidth *
                                                      0.04,
                                                  right: _masterContainerWidth *
                                                      0.04,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    orderedReadingList[index]
                                                        ['title'],
                                                    style: TextStyle(
                                                      fontSize:
                                                          _masterContainerHeight *
                                                              0.10,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                              flex: 25,
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
                                            Flexible(
                                              flex: 15,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        _masterContainerHeight *
                                                            0.03),
                                                child: Align(
                                                  child: Text(
                                                    '${DateFormat('EEEE, dd LLLL yyyy').format(DateTime.parse(orderedReadingList[index]['created_at'].toString()))}',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic,
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
                                              flex: 80,
                                              child:
                                                  (orderedReadingList[index]
                                                                  ['user_id'] !=
                                                              null &&
                                                          orderedReadingList[
                                                                      index]
                                                                  ['user_id'] !=
                                                              '')
                                                      ? Query(
                                                          options: QueryOptions(
                                                            document:
                                                                UserNameAndAvatarQuery()
                                                                    .document,
                                                            variables: {
                                                              'id':
                                                                  orderedReadingList[
                                                                          index]
                                                                      .userId
                                                            },
                                                          ),
                                                          builder: (result,
                                                              {fetchMore,
                                                              refetch}) {
                                                            final userDetails =
                                                                UserNameAndAvatar$QueryRoot
                                                                        .fromJson(
                                                                            result.data)
                                                                    .usersByPk;
                                                            return Column(
                                                              children: [
                                                                //Author's avatar provided the data is available
                                                                Flexible(
                                                                  flex: 80,
                                                                  child:
                                                                      Container(
                                                                    margin:
                                                                        EdgeInsets
                                                                            .only(
                                                                      top: _masterContainerWidth *
                                                                          0.03,
                                                                      right: _masterContainerWidth *
                                                                          0.015,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: (userDetails.avatarUrl != null &&
                                                                                userDetails.avatarUrl != '')
                                                                            ? Image.network(
                                                                                userDetails.avatarUrl,
                                                                                width: _masterContainerWidth * 0.25,
                                                                                height: _masterContainerWidth * 0.25,
                                                                                fit: BoxFit.fill,
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
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      child:
                                                                          Text(
                                                                        (userDetails.displayName != null &&
                                                                                userDetails.displayName != '')
                                                                            ? userDetails.displayName
                                                                            : 'Author unknown',
                                                                        softWrap:
                                                                            true,
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            TextStyle(
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                          fontSize:
                                                                              _masterContainerHeight * 0.07,
                                                                          fontWeight:
                                                                              FontWeight.bold,
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
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  top:
                                                                      _masterContainerWidth *
                                                                          0.03,
                                                                  right:
                                                                      _masterContainerWidth *
                                                                          0.015,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topCenter,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/user-image-placeholder.jpg',
                                                                      width: _masterContainerWidth *
                                                                          0.25,
                                                                      height:
                                                                          _masterContainerWidth *
                                                                              0.25,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            // News author placeholder
                                                            Flexible(
                                                              flex: 20,
                                                              child: Container(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topCenter,
                                                                  child: Text(
                                                                    'Author unknown',
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        TextStyle(
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      fontSize:
                                                                          _masterContainerHeight *
                                                                              0.07,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                            ),
                                            // UNSAVE-button
                                            Flexible(
                                              flex: 20,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        _masterContainerHeight *
                                                            0.04),
                                                child: Align(
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty
                                                                .all<
                                                                    EdgeInsets>(
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
                                                            .all<
                                                                OutlinedBorder>(
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
                                ]),
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
