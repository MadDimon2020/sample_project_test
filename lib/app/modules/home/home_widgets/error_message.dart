import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/controllers/api_controller.dart';

class ErrorMessageView extends StatelessWidget {
  double get deviceHeight => Get.height;
  double get deviceWidth => Get.width;
  double get _masterContainerWidth => deviceWidth;
  double get _masterContainerHeight => _masterContainerWidth * 0.53;
  double get _masterContainerMargin => deviceWidth * 0.015;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
