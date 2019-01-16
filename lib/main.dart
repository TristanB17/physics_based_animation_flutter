import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin { //SingleTickerProviderStateMixin provides state w/ ticker objs
  Animation animation; 
  AnimationController animationController;
  // animationController contains add'l methods to control animation

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 5000), vsync: this); //needs two args, time of anim and vsync prevents bg animations from consuming resources 
    
    animation = Tween(begin: 0.0, end: 500.0).animate(animationController) // Tween = stateless obj, takes begin and end args, covers range of animation
    ..addListener(() { //.. dart notation chains method onto result of previous method ; 
      setState((){}); // ensures state changes with passing of single frame (avg Flutter app == 60 fps)
    });
    animationController.repeat(); //.forward() starts animation
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}