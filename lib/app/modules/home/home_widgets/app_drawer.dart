import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:fluttericon/linecons_icons.dart';

import 'package:sample_project/app/modules/home/controllers/home_controller.dart';
import 'package:sample_project/controllers/api_controller.dart';

class AppDrawer extends GetView<HomeController> {
  double get deviceHeight => Get.height;
  double get deviceWidth => Get.width;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Awesome Posts'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              CloseButton(
                onPressed: Get.back,
              ),
            ],
          ),
          _buildMenuItem(
            icon: Icons.home,
            iconColor: Colors.black,
            title: 'Home',
            onTapHandler: () {
              Get.back();
            },
          ),
          _buildMenuItem(
            icon: Linecons.doc,
            iconColor: Colors.green,
            title: 'My Reading List',
            onTapHandler: () {},
          ),
          _buildMenuItem(
              icon: Icons.logout,
              iconColor: Colors.red,
              title: 'Logout',
              onTapHandler: ApiController.to.logout),
        ],
      ),
    );
  }

  Column _buildMenuItem({
    @required IconData icon,
    Color iconColor,
    @required String title,
    @required Function onTapHandler,
  }) {
    return Column(
      children: [
        Divider(),
        ListTile(
          leading: Icon(
            icon,
            color: iconColor,
            size: deviceWidth * 0.1,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: deviceWidth * 0.045),
          ),
          onTap: onTapHandler,
        ),
      ],
    );
  }
}
