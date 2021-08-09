import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/Interface.dart';
import 'package:game/widget/fabbuttons.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians, Vector3;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterBase',
        home: Scaffold(body: SizedBox.expand(child: RadialMenu())));
  }
}

class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with TickerProviderStateMixin {
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);



    // ..addListener(() => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
    return RadialAnimation(
      controller: controller,

    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class RadialAnimation extends StatefulWidget {
  RadialAnimation(
      {Key? key,
      required this.controller,
      })
      :
        super(key: key);

  final AnimationController controller;



  @override
  _RadialAnimationState createState() => _RadialAnimationState();
}

class _RadialAnimationState extends State<RadialAnimation> implements emptyInterface {
  late double height;

  late double width;

  late Animation<double> rotation;
  late Animation<double> translation;
  late Animation<double> scale;


  double radianconvert(double degree) {
    double unitradian = 57.295779513;
    return degree / unitradian;
  }


  bool check = false;
  bool visibility=false;



  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  initState(){
    super.initState();




    translation = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.elasticOut),
    );
    scale = Tween<double>(
    begin: 1.5,
    end: 0.0,
    ).animate(
    CurvedAnimation(parent: widget.controller, curve: Curves.fastOutSlowIn),
    );
    rotation = Tween<double>(
    begin: 0.0,
    end: 360.0,
    ).animate(
    CurvedAnimation(
    parent:widget. controller,
    curve: Interval(
    0.0,
    0.7,
    curve: Curves.decelerate,
    ),
    )
    );
  }

  Widget drawer() {
    return Container(
      // margin: EdgeInsets.only(right: 20),
      //padding: EdgeInsets.all(10),

      child: ClipRRect(
        borderRadius: BorderRadius.only(

        ),
        child: Drawer(


          child: Container(
            padding:  EdgeInsets.only(right: width*0.05,),

            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(

                    itemBuilder: (ctx, i) => Align(
                      alignment: Alignment.topRight,
                      child: Card(

                        color: const Color(0xff202020),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(

                                children: [

                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 2),
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/man.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  SizedBox(width: width*0.01,),

                                  Column(

                                    children: [
                                      Container(
                                        width: width*0.2,
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text "
                                              "of the printing and typesetting industry. ",
                                          style: TextStyle(
                                              fontSize:12,
                                              color: Colors.white,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 6,
                                        ),
                                      ),
                                      //

                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: height*0.08,)
                            ],

                        ),
                      ),
                    ),

                    itemCount: 2,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child:
                       Row(
                        children: [
                          Expanded(

                          child:TextField(
                            decoration: InputDecoration(
                              hintText: "Lorem Ipsum is simply",
                              hintStyle: TextStyle(
                                color: Colors.white
                              ),
                              border: InputBorder.none
                            ),

                          ),),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),

                            ),
                            child: IconButton(
                              icon: Icon(Icons.send,color: Colors.white,),
                              onPressed: (){

                              },
                            ),
                          )
                        ],
                      ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

int i=0;

  @override
  void func() {

    print("mnmjhjjhjhn");

     // _scaffoldKey.currentState?.openEndDrawer();


    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    print("jh");
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;


    return Scaffold(
      endDrawer: drawer(),
     key: _scaffoldKey,

      body: Container(
          child: Stack(alignment: Alignment.center, children: [
            Container(
                width: width,
                height: height,
                child: Image.asset(
                  "assets/images/base.png",
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: width * 0.05,
              child: Container(
                  width: width * 0.7,
                  height: height,
                  child: Image.asset("assets/images/Table .png")),
            ),
            Positioned(right: width * 0.03, top: height * 0.08, child: GestureDetector(
                onTap: (){
                  print("djnjdnjndjn");
                },
                child: card())),
            Positioned(left: width * 0.03, top: height * 0.08, child: card2()),
            Positioned(
                right: width * 0.03, bottom: height * 0.4, child: card()),
            Positioned(
                left: width * 0.03, bottom: height * 0.4, child: card2()),
            Positioned(
                left: width * 0.01, bottom: height * 0.08, child: playercard()),
           Positioned(right: 1,bottom: 2, child: Container(

             decoration: BoxDecoration(
                 color: Colors.blue,
                 shape: BoxShape.circle
             ),
             width: width * 0.12,
             height: height * 0.12,
             child: IconButton(
               icon: Icon(Icons.add,size: 30,),
               enableFeedback: true,
               onPressed: () {
                 setState(() {
                   visibility=!visibility;
                 });

                 }

             ),
           ),),
            Positioned(right:width* 0.0,bottom: height*0.19, child: AnimatedOpacity(
              opacity:visibility ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(

                decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle
                ),
                width: width * 0.12,
                height: height * 0.12,
                child: IconButton(
                    icon: Image.asset("assets/icons/chat.png"),
                    enableFeedback: true,
                    onPressed: () {
                      _scaffoldKey.currentState!.openEndDrawer();

                    }

                ),
              ),
            ),),

            Positioned(right: width*0.08,bottom: height*0.15, child: AnimatedOpacity(
              opacity:visibility ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 5),
              child: Container(

                decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle
                ),
                width: width * 0.12,
                height: height * 0.12,
                child: IconButton(
                    icon: Image.asset("assets/icons/sticker.png"),
                    enableFeedback: true,
                    onPressed: () {


                    }

                ),
              ),
            ),),

            Positioned(right: width*0.10,bottom: 0, child: AnimatedOpacity(
              opacity:visibility ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(

                decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle
                ),
                width: width * 0.12,
                height: height * 0.12,
                child: IconButton(
                    icon: Image.asset("assets/icons/voice.png"),
                    enableFeedback: true,
                    onPressed: () {
                     playerlist(context);

                    }

                ),
              ),
            ),),
           // ButtonAnimation(opendrawer: this),
            Positioned.fill(
                right:width*0.30,

                child:Align(
                  alignment: Alignment.center,
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(0/ 360),
                    child: Container(
                      width: width*0.070,
                      height: height*0.70,
                      child: Image.asset("assets/images/image.png"),
                    ),
                  ),
                )
            ),
            Positioned(
                left:width*0.30,
                bottom: width*0.15,
                child:RotationTransition(
                  turns: new AlwaysStoppedAnimation(45/ 360),
                  child: Container(
                    width: width*0.070,
                    height: height*0.70,
                    child: Image.asset("assets/images/image.png"),
                  ),
                )
            ),

            Positioned.fill(

                bottom: width*0.10,
                child:Align(
                  alignment: Alignment.center,
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(90/ 360),
                    child: Container(
                      width: width*0.070,
                      height: height*0.70,
                      child: Image.asset("assets/images/image.png"),
                    ),
                  ),
                )
            ),
            Positioned(
                left:width*0.65,
                bottom: width*0.15,
                child:RotationTransition(
                  turns: new AlwaysStoppedAnimation(135/ 360),
                  child: Container(
                    width: width*0.070,
                    height: height*0.70,
                    child: Image.asset("assets/images/image.png"),
                  ),
                )
            ),
            Positioned(
                left:width*0.62,

                child:Align(
                  alignment: Alignment.center,
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(0/ 360),
                    child: Container(
                      width: width*0.07,
                      height: height*08,
                      child: Image.asset("assets/images/image.png"),
                    ),
                  ),
                )
            ),





            Positioned(
              top:width*0.27,
              left: width*0.29,
              child: Container(
                height: 300,
                width:300,
                child: AnimatedBuilder(
                    animation: widget.controller,
                    builder: (context, widget) {
                      return Transform.rotate(
                          angle: radians(rotation.value),
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[

                                  _buildButton(0,
                                      color: Colors.red,
                                      icon: FontAwesomeIcons.thumbtack),


                                _buildButton(-20,
                                    color: Colors.red,
                                    icon: FontAwesomeIcons.cat),
                                _buildButton(-40,
                                    color: Colors.red,
                                    icon: FontAwesomeIcons.sprayCan),
                                _buildButton(-60,
                                    color: Colors.orange,
                                    icon: FontAwesomeIcons.fire),
                                _buildButton(-80,
                                    color: Colors.blue,
                                    icon: FontAwesomeIcons.kiwiBird),
                                _buildButton(-100,
                                    color: Colors.orange,
                                    icon: FontAwesomeIcons.fire),
                                _buildButton(-120,
                                    color: Colors.red,
                                    icon: FontAwesomeIcons.cat),
                                _buildButton(-140,
                                    color: Colors.blue,
                                    icon: FontAwesomeIcons.kiwiBird),
                                _buildButton(-160,
                                    color: Colors.orange,
                                    icon: FontAwesomeIcons.fire),
                                _buildButton(-180,
                                    color: Colors.red,
                                    icon: FontAwesomeIcons.cat),
                                Transform.scale(
                                  scale: scale.value - 1,
                                  child: FloatingActionButton(
                                      child: Icon(FontAwesomeIcons.timesCircle),
                                      onPressed: _close,
                                      backgroundColor: Colors.red),
                                ),
                                Transform.scale(
                                  scale: scale.value,
                                  child: FloatingActionButton(
                                      child: Text(
                                        "Open Cards",
                                        style: TextStyle(fontSize: 7),
                                      ),
                                      onPressed: _open),
                                )
                              ]));
                    }),
              ),
            ),
            //ButtonAnimation(opendrawer: this,),

          ]),
        ),

    );
  }

  _open() {
    widget.controller.forward();
  }

  _close() {
    widget.controller.reverse();
  }

  _buildButton(double angle, {required Color color, required IconData icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),

          child: Container(
            decoration: BoxDecoration(color: color),
            child: IconButton(
              icon: Icon(
                icon,
                color: Colors.white,
              ),
              onPressed: () {
                print("dnnbdn");
              },
            ),
            //Icon(icon), backgroundColor: color, onPressed: _close, elevation: 0)
          ),
       );
  }

  Widget card() {
    return Card(
      color: const Color(0xff202020),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), topLeft: Radius.circular(30),
            bottomRight: Radius.circular(8),topRight: Radius.circular(8),
        ),
      ),
      child: Container(
          padding: EdgeInsets.only(right: 7),
          decoration: BoxDecoration(),
          child: Row(
            children: [
              Stack(children: [
                CircularCountDownTimer(
                  duration: 10,
                  initialDuration: 0,
                  controller:
                  check == false ? _player1controller : _player3controller,
                  width: 65,
                  height: 65,
                  ringColor: Colors.white,
                  fillColor: Colors.pink,
                  backgroundColor: Colors.black,
                  strokeWidth: 10.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  isTimerTextShown: false,
                  autoStart: false,
                  onStart: () {
                    print('Countdown Started');
                  },
                  onComplete: () {
                    print('Countdown Ended');
                  },
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: AssetImage("assets/images/man.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ]),
              SizedBox(width: width*0.01,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jhon Doe",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  //
                  Container(height: 02,width:70,decoration: BoxDecoration(
                      color: Colors.white
                  ),),

                  Row(
                    children: [
                      Text(
                        "KING OF HEARTS",
                        style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(height: 10,
                          width: 10,
                        margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            shape:BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/lkh.png"),
                            )
                          ),
                          ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Winning Streak 3",
                        style: TextStyle(
                            fontSize: 6,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape:BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/fire.png"),
                            )
                        ),
                      ),

                    ],
                  ),
                  Text(
                    "Win Ratio 3.1%",
                    style: TextStyle(
                        fontSize: 6,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "level 21%",
                    style: TextStyle(
                        fontSize: 6,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Raputation 3.1%",
                    style: TextStyle(
                        fontSize: 6,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ),

    );
  }

  Widget card2() {
    return Card(
      color: const Color(0xff202020),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40), topRight: Radius.circular(30),
          bottomLeft: Radius.circular(8),topLeft: Radius.circular(8)

        ),
      ),
      child: Container(
          padding: EdgeInsets.only(left: 7,bottom: 7),
          decoration: BoxDecoration(

          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Jhon Doe",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Container(height: 02,width:70,decoration: BoxDecoration(
                      color: Colors.white
                  ),),
                  //
                  Row(
                    children: [
                      Text(
                        "KING OF HEARTS",
                        style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(height: 10,
                        width: 10,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            shape:BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/lkh.png"),
                            )
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Winning Streak 3",
                        style: TextStyle(
                            fontSize: 6,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape:BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/fire.png"),
                            )
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Win Ratio 3.1%",
                    style: TextStyle(
                        fontSize: 6,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "level 21%",
                    style: TextStyle(
                        fontSize: 6,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Raputation 3.1%",
                    style: TextStyle(
                        fontSize: 6,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(width: width*0.01,),
              Stack(children: [
                CircularCountDownTimer(
                  duration: 10,
                  initialDuration: 0,
                  controller:
                      check == false ? _player1controller : _player3controller,
                  width: 65,
                  height: 65,
                  ringColor: Colors.white,
                  fillColor: Colors.pink,
                  backgroundColor: Colors.black,
                  strokeWidth: 10.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  isTimerTextShown: false,
                  autoStart: false,
                  onStart: () {
                    print('Countdown Started');
                  },
                  onComplete: () {
                    print('Countdown Ended');
                  },
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: AssetImage("assets/images/man.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
    );
  }

  int _duration = 10;

  CountDownController _controller = CountDownController();

  CountDownController _player4controller = CountDownController();

  CountDownController _player3controller = CountDownController();

  CountDownController _player1controller = CountDownController();

  CountDownController _player2controller = CountDownController();



  Widget playercard() {
    return Card(
      color: const Color(0xff202020),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(children: [
              CircularCountDownTimer(
                duration: 10,
                initialDuration: 0,
                controller: _controller,
                width: 65,
                height: 65,
                ringColor: Colors.white,
                fillColor: Colors.pink,
                backgroundColor: Colors.black,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.S,
                isTimerTextShown: false,
                isReverse: false,
                isReverseAnimation: false,
                autoStart: false,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: () {
                  print('Countdown Ended');
                },
              ),
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                    image: AssetImage("assets/images/man.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ]),
            SizedBox(width: width*0.02,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Jhon Doe",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Container(height: 02,width:70,decoration: BoxDecoration(
                  color: Colors.white
                ),),
                //
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "KING OF HEARTS",
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(height: 10,
                      width: 10,
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/lkh.png"),
                          )
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Winning Streak 3",
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(height: 12,
                      width: 12,
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/fire.png"),
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () async {
                  //print("press");
                  _controller.start();
                  _controller.restart(duration: _duration);

                  // _player1controller.start();
                  // _player3controller.start();
                  // _player4controller.start();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 24,
                )),
          ],
        ),

    );
  }
  playerlist(BuildContext context){
    return showDialog(context: context,

      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Container(
            height: height*0.3,
            width: width*0.36,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
          ),

        );

      }, barrierDismissible: false,);
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
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: () {
          print("bbb b");

        },
      ),
    );
  }


}


