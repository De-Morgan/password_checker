import 'package:flutter/material.dart';

import 'change_password_page.dart';

void main() {
  runApp(PasswordCheckerApp());
}

class PasswordCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Checker',
      theme: ThemeData(
        primaryColor: Color(0xffFC7E15),
      ),
      home: ChangePasswordPage(),
    );
  }
}


//
// class AnimationControllerExample extends StatefulWidget    {
//   AnimationControllerExample({Key key, this.title}) : super(key: key);
//
//
//   final String title;
//
//   @override
//   _AnimationControllerExampleState createState() => _AnimationControllerExampleState();
// }
//
// class _AnimationControllerExampleState extends State<AnimationControllerExample> with TickerProviderStateMixin {
//   AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChildWidget();
//   }
// }
//
// class ChildWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
// class HookAnimationControllerExample extends HookWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     final controller1 = useAnimationController(duration: Duration(seconds: 1));
//     final controller2 = useAnimationController(duration: Duration(seconds: 2));
//     final controller3 = useAnimationController(duration: Duration(seconds: 3));
//     return Container();
//   }
// }
//
// class CounterWidget extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final count = useState(0);
//
//     return GestureDetector(
//       // Rebuilds the Counter widget automatically.
//       onTap: () => count.value++,
//       child: Text(count.value.toString()),
//     );
//   }
// }