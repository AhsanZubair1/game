import 'package:flutter/material.dart';

import '../Interface.dart';
class ButtonAnimation extends StatefulWidget {
  ButtonAnimation({required this.opendrawer});
  final emptyInterface opendrawer;

  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with SingleTickerProviderStateMixin {
  double radianconvert(double degree) {
    double unitradian = 57.295779513;
    return degree / unitradian;
  }

  late AnimationController btncontroler;
  late Animation degOneTranslation;
  late Animation rotation;

  bool check = false;

  initState() {
    super.initState();
    btncontroler =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslation = Tween(begin: 0.0, end: 1.0).animate(btncontroler);
    btncontroler.addListener(() {
      setState(() {});
    });
    rotation = Tween(begin: 180.0, end: 0.0)
        .animate(CurvedAnimation(parent: btncontroler, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return (Positioned(
      height: 300,
      width: 300,
      child:Container(




        child: Stack(
          alignment: Alignment.centerRight,

          children: [

                InkWell(
                  onTap: () {
                    print("mnmnmkjkjkjkjkjk");
                    widget.opendrawer.func();
                  },
                  child: Transform.translate(
                    offset: Offset.fromDirection(
                        radianconvert(270), degOneTranslation.value * 70),
                    child: Transform(
                      transform: Matrix4.rotationZ(radianconvert(rotation.value)),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          print("mnmnm");
                          widget.opendrawer.func();
                        },
                        child: CircularButton(
                            width: width * 0.12,
                            height: height * 0.12,
                            color: Colors.orange,
                            icon: Icon(
                              Icons.messenger_sharp,
                              color: Colors.white,
                            ),
                            onclick: () {
                              // widget.opendrawer.func();
                            }),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("mnmnmkjkjkjkjkjk");
                    widget.opendrawer.func();
                  },
                  child: Transform.translate(
                    offset: Offset.fromDirection(
                        radianconvert(225), degOneTranslation.value * 70),
                    child: Transform(
                      transform: Matrix4.rotationZ(radianconvert(rotation.value)),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          print("mnmnm");
                          widget.opendrawer.func();
                        },
                        child: CircularButton(
                            width: width * 0.12,
                            height: height * 0.12,
                            color: Colors.orange,
                            icon: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            onclick: () {
                              // widget.opendrawer.func();
                            }),
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    print("mnmnmkjkjkjkjkjk");
                    widget.opendrawer.func();
                  },
                  child: Transform.translate(
                    offset: Offset.fromDirection(
                        radianconvert(180), degOneTranslation.value * 90),
                    child: Transform(
                      transform: Matrix4.rotationZ(radianconvert(rotation.value)),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          print("mnmnm");
                          widget.opendrawer.func();
                        },
                        child: CircularButton(
                            width: width * 0.12,
                            height: height * 0.12,
                            color: Colors.orange,
                            icon: Icon(
                              Icons.messenger_sharp,
                              color: Colors.white,
                            ),
                            onclick: () {
                              // widget.opendrawer.func();
                            }),
                      ),
                    ),
                  ),
                ),
                Container(

                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle
                  ),
                  alignment: Alignment.center,
                  width: width * 0.12,
                  height: height * 0.12,
                  child: IconButton(
                    icon: Icon(Icons.add,size: 30,),
                    enableFeedback: true,
                    onPressed: () {
                      widget.opendrawer.func();


                      if (btncontroler.isCompleted) {
                        btncontroler.reverse();
                      } else {
                        btncontroler.forward();
                      }
                    },
                  ),
                ),

              ],

        )
            ),
    )
    );


  }
}

class CircularButton extends StatelessWidget {
  CircularButton(
      {required this.width,
        required this.height,
        required this.color,
        required this.icon,
        required this.onclick});

  final double height;
  final double width;
  final Color color;
  final Icon icon;
  final Function onclick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: width,
      height: height,
      child: icon,
    );
  }
}
