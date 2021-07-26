import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

import '../controllers/post_details_controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  final deviceHeight = Get.height;
  final deviceWidth = Get.width;
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
          document: gql(PostDetailsController.fetchPostByIdQuery),
          variables: {'id': PostDetailsController.to.postId},
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
          var postDetails = result.data['news_by_pk'];
          return Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                        deviceWidth * 0.04,
                        deviceWidth * 0.04,
                        deviceWidth * 0.06,
                        deviceWidth * 0.04,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          postDetails['title'],
                          style: TextStyle(
                            fontSize: deviceHeight * 0.033,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(deviceWidth * 0.04),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                child: Image.asset(
                                  'assets/images/user-image-placeholder.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: deviceWidth * 0.02,
                                  right: deviceWidth * 0.01),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Post Author',
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
                            fit: FlexFit.tight,
                            child: Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${DateFormat('EEEE, dd LLLL yyyy').format(DateTime.parse(postDetails['created_at'].toString()))}',
                                  style: TextStyle(
                                      fontSize: deviceHeight * 0.022,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: deviceWidth * 0.04, right: deviceWidth * 0.02),
                      child: Text(
                        postDetails['content'],
                        style: TextStyle(fontSize: deviceHeight * 0.022),
                        softWrap: true,
                        strutStyle: StrutStyle(height: deviceHeight * 0.002),
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