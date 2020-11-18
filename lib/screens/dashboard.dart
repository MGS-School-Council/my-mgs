import 'package:flutter/material.dart';
import 'package:mymgs/widgets/drawer_app_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrawerAppBar('Dashboard')
    );
  }
}