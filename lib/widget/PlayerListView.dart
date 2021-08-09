import 'package:flutter/material.dart';
class PlayerListView extends StatelessWidget {
late double width;
late double height;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Card(
      color: const Color(0xff202020),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),

      child: Container(
        padding: EdgeInsets.symmetric(vertical: height*0.01),
        child: Row(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Jhon Doe",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                //
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "KING OF HEARTS",
                      style: TextStyle(
                          fontSize: 6,
                          color: Colors.white,
                          ),
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

              ],
            ),
            SizedBox(width: width*0.01,),
            Container(
              height: height*0.12,
              width: 1,
              decoration: BoxDecoration(
                color: Colors.white
              ),
            ),
            SizedBox(width: width*0.01,),
            Column(
              children: [
                Row(
                  children: [
                    button("Add", AssetImage("assets/icons/person.png")),
                    SizedBox(width: 5,),
                    button("Report", AssetImage("assets/icons/report.png")),
                  ],
                ),
                SizedBox(height: 5,),
                Row(

                  children: [
                    button("Mute", AssetImage("assets/icons/mute.png")),
                    SizedBox(width: 5,),
                    button("Block", AssetImage("assets/icons/block.png")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),);

  }
  Widget button(String text, AssetImage iamge){
    return Container(
      height: height*0.05,
      width: width*0.08,
      padding: EdgeInsets.only(left: width*0.01,right: width*0.01,top: height*0.01,bottom: height*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         ImageIcon(iamge,size: 10,color: Colors.white,),
          Text(text,style: TextStyle(
            color: Colors.white,
            fontSize: 8
          ),),
        ],
      )
    );
  }
}
