import 'package:flutter/material.dart';
import 'package:food_delivary_app/utils/dimansiontions.dart';
import 'package:food_delivary_app/widgets/big_text.dart';
import 'package:food_delivary_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivary_app/widgets/small_text.dart';

class AppColumn  extends StatelessWidget {
  final String text;

  const AppColumn ({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: "Badam Pizza",size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children:
              List.generate(5, (index) => Icon(Icons.star,size: 10,color: Colors.blue,)),
            ),
            SizedBox(width: 10),
            SmallText(text: "4.5"),
            SizedBox(width: 10),
            SmallText(text: "1287"),
            SizedBox(width: 10),
            SmallText(text: "comment")
          ],
        ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: Colors.blue),
            IconAndTextWidget(icon: Icons.location_on,
                text: "1.7 km",
                iconColor: Colors.blue),
            IconAndTextWidget(icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: Colors.blue)
          ],
        )
      ],
    );
  }
}
