import 'package:flutter/material.dart';
import 'package:food_delivary_app/utils/dimansiontions.dart';
import 'package:food_delivary_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
         Icon(icon,color: iconColor,size: Dimensions.iconSize24,),
         SizedBox(width: 20,),
         SmallText(text: text,)
       ],
    );
  }
}
