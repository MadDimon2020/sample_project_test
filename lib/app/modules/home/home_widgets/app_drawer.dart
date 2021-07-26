import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/app/modules/home/controllers/home_controller.dart';

class AppDrawer extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hi Friend!'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
        ],
      ),
    );
  }
}
