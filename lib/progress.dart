import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class progressBar extends StatefulWidget{
  _progressBarState createState() => _progressBarState();
}

class _progressBarState extends State<progressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: EdgeInsets.only(left: 5,right: 5),
      child: FAProgressBar(
      currentValue: 80,
      // displayText: '%',
    ),
    );
  }
}