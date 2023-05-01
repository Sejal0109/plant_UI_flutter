// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/Image_and_icons.dart';
import 'package:plant_app/screens/details/components/icon_card.dart';
import 'package:plant_app/screens/details/components/title_and_price.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        ImageAndIcons(size: size),
        TitleAndPrice(
          title: "Angelica",
          country: "Russian",
          price: 440,
        ),
         SizedBox(height: kDefaultPadding,),
        Row(
          children: <Widget>[
            SizedBox(
              width: size.width / 2,
              height: 84,
              child: TextButton(
                
                // style: ButtonStyle(
                  
                //   backgroundColor:
                //       MaterialStateProperty.all<Color>(kPrimaryColor),
                // ),
                
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
       ),
       
    ),
                child: Text("Buy Now",style: TextStyle(color: Colors.white, fontSize: 16) ,
                ),
              ),
            ),
            Expanded(
              child:TextButton(
                child: Text("Description",
                style: TextStyle(color: kPrimaryColor),),
            onPressed: (() {
              
            }),))
          ],
        ),
        
      ],
    ));
  }
}
