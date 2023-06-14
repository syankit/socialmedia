import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:health_app/provider/user_provider.dart';
import 'package:health_app/responsible/gobal_variables.dart';
import 'package:provider/provider.dart';

class Responsive extends StatefulWidget {
  final Widget webscreenlayout;
  final Widget mobilescreenlayout;
  const Responsive({
    Key? key,
    required this.mobilescreenlayout,
    required this.webscreenlayout,
  }) : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webscreen) {
        return widget.webscreenlayout;
      }
      return widget.mobilescreenlayout;
    });
  }
}
