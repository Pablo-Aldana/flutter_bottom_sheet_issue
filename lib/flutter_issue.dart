import 'package:flutter/material.dart';

//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class FlutterIssue extends StatelessWidget {
  const FlutterIssue({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: TextButton(
                onPressed: () {
                  showModal(context);
                },
                child: Text("OPEN ME")),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SwipeUp_flutterIssue())
      ],
    );
  }

  showModal(context) {
    showModalBottomSheet(
        backgroundColor: Colors.grey.withAlpha(100),
        //elevation: 0,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            child: Center(child: Text("hello")),
          ) /*const VideoManager()*/;
        });
  }
}

class SwipeUp_flutterIssue extends StatefulWidget {
  const SwipeUp_flutterIssue(
      {Key? key,
      /*required this.onModifyUserResult*/
      this.color})
      : super(key: key);
  final Color? color;
  @override
  SwipeUp_flutterIssueState createState() => SwipeUp_flutterIssueState();
}

class SwipeUp_flutterIssueState extends State<SwipeUp_flutterIssue>
    with SingleTickerProviderStateMixin {
  /*late AnimationController controller;
  late Animation<Offset> offset;
*/

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0.2),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  Color color = Colors.white; // Colors.transparent;
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      // color = Colors.white;
      _visible = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    controller.forward();
    color = widget.color ?? Colors.white;
    return SizedBox(
        height: 100,
        child: SlideTransition(
            position: _offsetAnimation,
            child: AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 2500),
              child: Icon(
                Icons.arrow_upward,
                color: color,
                size: 50,
              ),
            )));
  }
}
