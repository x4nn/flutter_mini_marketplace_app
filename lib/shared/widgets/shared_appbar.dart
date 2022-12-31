import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({super.key, required title, List<Widget>? actions})
      : super(
          title: Text(title),
          centerTitle: true,
          actions: actions,
        );
}
