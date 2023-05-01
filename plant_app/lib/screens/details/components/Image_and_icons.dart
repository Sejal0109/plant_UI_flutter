// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.72,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: 
                const EdgeInsets.symmetric(horizontal: kDefaultPadding/2 ),
                child: Column(
                  
                  children: <Widget>[
                    Align(
                      
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2,vertical: kDefaultPadding),
                        onPressed: () {
                        Navigator.pop(context);
                      },
                       icon: Icon(Icons.backspace_outlined)),
                    ),
                    Spacer(),
                    
                    IconCard(icon: "assests/icons/hot.png"),
                    IconCard(icon: "assests/icons/sun.png",),
                    IconCard(icon: "assests/icons/water.png",),
                    IconCard(icon: "assests/icons/wind.png",)
                  ],
                            ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 60,
                  color: kPrimaryColor.withOpacity(0.29),
                )],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover ,
                  image: AssetImage("assests/images/plant3.jpg"),
                  )
                  ),
            )
          ],
        ),
      ),
    );
  }
}

