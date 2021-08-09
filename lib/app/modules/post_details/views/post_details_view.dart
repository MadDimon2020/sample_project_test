import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

import '../controllers/post_details_controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  final deviceHeight = Get.height;
  final deviceWidth = Get.width;
  double get _masterContainerWidth => deviceWidth;
  double get _masterContainerHeight => _masterContainerWidth * 0.53;
  double get _masterContainerMargin => deviceWidth * 0.015;
  double get titleSectionHeight => deviceHeight * 0.3;
  double get titleSectionWidth => deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostDetailsView'),
        centerTitle: true,
      ),
      body: Query(
        options: QueryOptions(
          document: FetchPostByIdQueryQuery().document,
          variables: {'id': PostDetailsController.to.postId},
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            log(result.exception.toString(), name: 'PostDetailsView');
            return Center(
              child: Container(
                height: _masterContainerHeight,
                padding: EdgeInsets.all(_masterContainerMargin),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.grey[400],
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
                      SizedBox(
                        height: _masterContainerHeight * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // var postDetails = result.data['news_by_pk'];
          final postDetails =
              FetchPostByIdQuery$QueryRoot.fromJson(result.data).newsByPk;
          return Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(deviceWidth * 0.04),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          postDetails.title,
                          style: TextStyle(
                            fontSize: deviceHeight * 0.033,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.01,
                  ),
                  Flexible(
                    flex: 20,
                    child: Container(
                        padding: EdgeInsets.all(deviceWidth * 0.04),
                        child: Row(
                          children: [
                            Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  backgroundImage:
                                      postDetails.author?.avatarUrl != null
                                          ? NetworkImage(
                                              postDetails.author.avatarUrl)
                                          : AssetImage(
                                              'assets/images/user-image-placeholder.jpg',
                                            ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 40,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: deviceWidth * 0.02,
                                    right: deviceWidth * 0.01),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    postDetails.author?.displayName != null
                                        ? postDetails.author.displayName
                                        : 'Author unknown',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: deviceHeight * 0.022,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 40,
                              child: Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${DateFormat('EEEE, dd LLLL yyyy').format(DateTime.parse(postDetails.createdAt.toString()))}',
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.02,
                                        fontStyle: FontStyle.italic),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.01,
                  ),
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(postDetails.content,
                            style: TextStyle(fontSize: deviceHeight * 0.022),
                            softWrap: true,
                            strutStyle:
                                StrutStyle(height: deviceHeight * 0.002),
                            textAlign: TextAlign.left),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
