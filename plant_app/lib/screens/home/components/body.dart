import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import 'feature_plant.dart';
import 'header_with_searchbox.dart';
import 'recommend_plant.dart';
import 'title_with_more_btn.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    //it will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    //it enables scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(
            size: size,
          ),

          TitleWithMoreBtn(
            title: "Recomended",
            press: () {},
          ),
          RecommendsPlant() ,
          TitleWithMoreBtn(
            title: "Featured Plants",
             press: () {}),
             FeaturePlants(),
             SizedBox(height: kDefaultPadding,),
        ],
      ),
    );
  }
}

